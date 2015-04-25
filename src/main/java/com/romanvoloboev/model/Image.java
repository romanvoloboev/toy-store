package com.romanvoloboev.model;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "image")
public class Image {
    private Long id;
    private byte[] image;

    public Image() {
    }

    public Image(Long id, byte[] image) {
        this.id = id;
        this.image = image;
    }

    public Image(byte[] image) {
        this.image = image;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "image_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "image", length = 2000, nullable = false)
    public byte[] getImage() {
        return image;
    }
    public void setImage(byte[] image) {
        this.image = image;
    }
}
