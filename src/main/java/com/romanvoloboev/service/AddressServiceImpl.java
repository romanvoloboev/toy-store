package com.romanvoloboev.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.romanvoloboev.dto.json.JSONDataItemDTO;
import com.romanvoloboev.dto.json.JSONRequestDTO;
import com.romanvoloboev.dto.json.JSONResponseDTO;
import com.romanvoloboev.repository.AddressRepository;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.dto.AddressDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Service
public class AddressServiceImpl implements AddressService {
    private static final Logger LOGGER = Logger.getLogger(AddressServiceImpl.class.getName());
    public static final String ADDRESS_PATTERN = "^[а-яА-ЯёЁ., ]+$";

    private @Value("#{main['novaposhta_api_url']}") String novaPoshtaUrl;
    private @Value("#{main['novaposhta_api_key']}") String novaPoshtaKey;

    @Autowired private AddressRepository addressRepository;
    @Autowired private CustomerService customerService;

    @Transactional
    @Override
    public void save(Address address) throws Exception {
        addressRepository.save(address);
    }

    @Transactional
    @Override
    public void save(List<Address> addresses) throws Exception {
        addressRepository.save(addresses);
    }

    @Transactional
    @Override
    public void delete(Address address) throws Exception {
        addressRepository.delete(address);
    }

    @Transactional(readOnly = true)
    @Override
    public Address selectModel(Integer id) throws Exception {
       return addressRepository.findOne(id);
    }

    @Transactional
    @Override
    public void removeCustomerAddress(Integer id, Customer customer) throws Exception {
        Address address = addressRepository.getByIdAndCustomer(id, customer);
        if (address != null) {
            delete(address);
        } else {
            throw new Exception("No specified customer address found");
        }
    }

    /**
     * Returns all company offices in the selected city by using novaposhta API
     * @param city - chosen city
     * @return List of String office addresses
     */
    @Override
    public List<String> selectNovaposhtaOffices(String city) {
        JSONResponseDTO response;
        List<JSONDataItemDTO> dataItemDTOs;
        List<String> offices = new ArrayList<>();
        response = sendQuery("getCities", "FindByString", city);
        if (response.isSuccess()) {
            dataItemDTOs = response.getData();
            String cityRef;
            if (dataItemDTOs.size() > 0) {
                cityRef = dataItemDTOs.get(0).getRef();
            } else {
                offices.add("Офисов не найдено. Возможно, у компании нет офисов в этом городе.");
                return offices;
            }

            response = sendQuery("getWarehouses", "CityRef", cityRef);
            if (response.isSuccess()) {
                dataItemDTOs = response.getData();
                for (JSONDataItemDTO item:dataItemDTOs) {
                    offices.add(item.getDescr());
                }
            }
        } else {
            offices.add("Произошла неопределенная ошибка при загрузке списка офисов...");
        }
        return offices;
    }

    private JSONResponseDTO sendQuery(String method, String propName, String propValue) {
        HttpURLConnection connection = null;
        DataInputStream dataInputStream = null;
        DataOutputStream dataOutputStream = null;
        JSONResponseDTO jsonResponseDTO = null;
        try {
            URL url = new URL(novaPoshtaUrl);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            ObjectMapper mapper = new ObjectMapper();

            //send data
            dataOutputStream = new DataOutputStream(connection.getOutputStream());
            JSONRequestDTO cityJSONRequest = createNovaPoshtaJSONObject("Address", method, propName, propValue);
            mapper.writeValue(dataOutputStream, cityJSONRequest);
            dataOutputStream.flush();
            dataOutputStream.close();

            //receive data
            dataInputStream = new DataInputStream(connection.getInputStream());
            jsonResponseDTO = mapper.readValue(connection.getInputStream(), JSONResponseDTO.class);
            dataInputStream.close();

        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        } finally {
            try {
                if (dataInputStream != null) {
                    dataInputStream.close();
                }

                if (dataOutputStream != null) {
                    dataOutputStream.close();
                }

                if (connection != null) {
                    connection.disconnect();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return jsonResponseDTO;
    }

    private JSONRequestDTO createNovaPoshtaJSONObject(String model, String method, String propName, String propValue) {
        Map<String, String> properties = new HashMap<>();
        properties.put(propName, propValue);
        return new JSONRequestDTO(novaPoshtaKey, model, method, properties);
    }

    @Transactional(readOnly = true)
    private List<Address> selectModels(Integer id) {
        return addressRepository.getByCustomerId(id);
    }

    @Transactional
    @Override
    public List<AddressDTO> selectDTOs(Integer id) {
        List<Address> addresses;
        if (id == -1) {
            Customer customer = customerService.selectAuth();
            addresses = selectModels(customer.getId());
        } else {
            addresses = selectModels(id);
        }
        List<AddressDTO> addressDTOs = new ArrayList<>();
        if (addresses != null) {
            for (Address address : addresses) {
                addressDTOs.add(new AddressDTO(address.getId(), address.getCity(), address.getStreet(),
                        address.getHouse(), address.getFlat()));
            }
        }
        return addressDTOs;
    }

    @Transactional
    @Override
    public List<Address> selectModels(List<AddressDTO> addressDTOList) {
        List<Address> addresses = new ArrayList<>();
        Customer customer;
        if (addressDTOList != null) {
            for (AddressDTO addressDTO : addressDTOList) {
                customer = customerService.selectModel(addressDTO.getCustomer());
                addresses.add(new Address(addressDTO.getCity(), addressDTO.getStreet(),
                        addressDTO.getHouse(), addressDTO.getFlat(), customer));
            }
        }
        return addresses;
    }

    private boolean validate(Object object, Validator validator) throws ValidationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);

        if (constraintViolations.size() > 0) {
            StringBuilder errorString = new StringBuilder();
            for (ConstraintViolation<Object> cv : constraintViolations){
                errorString.append(String.format("Format error in property: [%s], value: [%s], message: [%s]",
                        cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
            }
            throw new ValidationException(errorString.toString());
        }
        return true;
    }

    @Override
    public boolean isValid(AddressDTO addressDTO) throws ValidationException {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        return validate(addressDTO, validator);
    }

}
