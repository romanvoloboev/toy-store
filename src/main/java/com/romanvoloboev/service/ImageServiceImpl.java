package com.romanvoloboev.service;

import com.romanvoloboev.model.Image;
import com.romanvoloboev.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Roman Voloboev
 */

@Service
public class ImageServiceImpl {
    @Autowired private ImageRepository imageRepository;

    @Transactional
    public Long save(Image image) throws Exception {
        return imageRepository.save(image).getId();
    }

    @Transactional
    public void delete(Long id) throws Exception {
        imageRepository.delete(id);
    }

    @Transactional(readOnly = true)
    public Image selectModel(Long id) throws Exception {
        return imageRepository.getOne(id);
    }

    @Transactional(readOnly = true)
    public byte[] selectByteValue(Long id) throws Exception {
        return imageRepository.getImageById(id);
    }
}
