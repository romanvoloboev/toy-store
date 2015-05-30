package com.romanvoloboev.dto.json;

import java.util.Map;

/**
 * @author Roman Voloboev
 */

public class JSONRequestDTO {
    private String apiKey;
    private String modelName;
    private String calledMethod;
    private Map<String, String> methodProperties;

    public JSONRequestDTO() {
    }

    public JSONRequestDTO(String apiKey, String modelName, String calledMethod, Map<String, String> methodProperties) {
        this.apiKey = apiKey;
        this.modelName = modelName;
        this.calledMethod = calledMethod;
        this.methodProperties = methodProperties;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getCalledMethod() {
        return calledMethod;
    }

    public void setCalledMethod(String calledMethod) {
        this.calledMethod = calledMethod;
    }

    public Map<String, String> getMethodProperties() {
        return methodProperties;
    }

    public void setMethodProperties(Map<String, String> methodProperties) {
        this.methodProperties = methodProperties;
    }
}
