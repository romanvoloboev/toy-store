package com.romanvoloboev.repository;

import com.romanvoloboev.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author Roman Voloboev
 */

public interface ImageRepository extends JpaRepository<Image, Long> {
    @Query("select i.image from Image i where i.id = :id")
    byte[] getImageById(@Param("id") Long id);
}
