package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Roman Voloboev
 */

@Service
public class ProductServiceImpl implements ProductService {
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z0-9 ]+$";
    public static final String INT_PATTERN = "^[0-9]+$";
    public static final String FLOAT_PATTERN = "^(?=.+)(?:[1-9]\\d*|0)?(?:\\.\\d+)?$";

    @Autowired private ProductRepository productRepository;

    @Transactional
    @Override
    public void save(ProductDTO productDTO) throws Exception {

    }

    @Transactional
    @Override
    public Product selectModel(Integer id) throws Exception {
        return productRepository.getOne(id);
    }

    private String formatDateToString(Date date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        dateFormat.setLenient(false);
        return dateFormat.format(date);
    }

    private Date formatStringToDate(String date) throws ParseException{
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        dateFormat.setLenient(false);
        return dateFormat.parse(date);
    }
}
