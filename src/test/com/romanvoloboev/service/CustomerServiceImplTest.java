package com.romanvoloboev.service;

import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@ContextConfiguration(locations = {"classpath:spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class CustomerServiceImplTest {
    @Autowired private CustomerService customerService;
    @Autowired private AddressService addressService;

    @Test
    public void testSave() throws Exception {
        customerService.save(new Customer("Роман Admin", "test1@gmail.com", "password", "380501234567",
                true, Role.ADMIN, null, null, null, null));

        customerService.save(new Customer("Роман Employee", "test2@gmail.com", "password", "380501234567",
                true, Role.EMPLOYEE, null, null, null, null));

        customerService.save(new Customer("Роман Customer", "test3@gmail.com", "password", "380501234567",
                true, Role.CUSTOMER, null, null, null, null));

    }

    @Test
    public void fillCustomerAddress() throws Exception {
        Customer customer = customerService.selectModel("test1@gmail.com");
        List<Address> addresses = new ArrayList<>();
        addresses.add(new Address("Никополь", "Херсонская", "117", null, customer));
        addresses.add(new Address("Никополь", "Электрометталургов", "55", "4", customer));
        customer.setAddresses(addresses);
        customerService.save(customer);
    }

    @Test
    public  void getAddresses() throws Exception {
        Customer customer = customerService.selectModel("test1@gmail.com");
        List<Address> addressList = addressService.selectModels(customer);
        for (Address address:addressList) {
            System.out.println(address.getCity() +", " +address.getStreet() +", " +address.getHouse());
        }
    }
}
