package com.romanvoloboev.controller;

import com.romanvoloboev.model.Image;
import com.romanvoloboev.service.ImageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Controller
public class ImageController {
    private static final Logger LOGGER = Logger.getLogger(ImageController.class.getName());

    @Autowired private ImageServiceImpl imageService;

    @RequestMapping(value = "/image/load", method = RequestMethod.GET)
    public void loadImage(@RequestParam("id")long id, HttpServletResponse response) {
        response.setContentType("application/x-download");
        response.setContentType("image/*");
        response.setHeader("Content-Disposition", "attachment; filename=image");
        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            byte[] image = imageService.selectByteValue(id);
            if (image == null) throw new NullPointerException("No image found");
            FileCopyUtils.copy(image, outputStream);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    LOGGER.log(Level.SEVERE, e.getMessage());
                }
            }
        }
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @ResponseBody
    @RequestMapping(value = "/cp/upload_image", method = RequestMethod.POST)
    public Map<String, Object> uploadImage(MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            if (!file.isEmpty()) {
                if (file.getContentType().contains("image/jpeg") || file.getContentType().contains("image/png")) {
                    Image image = new Image(file.getBytes());
                    Long id = imageService.save(image);
                    response.put("status", "ok");
                    response.put("image", id);
                } else {
                    response.put("status", "wrongFileType");
                    throw new Exception("Invalid file type");
                }
            } else {
                response.put("status", "emptyFile");
                throw new Exception("File can't be empty");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @ResponseBody
    @RequestMapping(value = "/cp/delete_image", method = RequestMethod.POST)
    public Map<String, String> deleteImage(@RequestParam("id")long id) {
        Map<String, String> response = new HashMap<>();
        try {
            imageService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

}
