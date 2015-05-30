package com.romanvoloboev.dto.json;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@JsonIgnoreProperties(ignoreUnknown = true)
public class JSONResponseDTO {
    private boolean success;
    private List<JSONDataItemDTO> data = new ArrayList<>();

    public JSONResponseDTO() {
    }

    public JSONResponseDTO(boolean success, List<JSONDataItemDTO> data) {
        this.success = success;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public List<JSONDataItemDTO> getData() {
        return data;
    }

    public void setData(List<JSONDataItemDTO> data) {
        this.data = data;
    }
}
