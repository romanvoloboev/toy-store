package com.romanvoloboev.dto.json;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author Roman Voloboev
 */

@JsonIgnoreProperties(ignoreUnknown = true)
public class JSONDataItemDTO {
    @JsonProperty("Ref")
    private String ref;

    @JsonProperty("DescriptionRu")
    private String descr;

    public JSONDataItemDTO() {
    }

    public JSONDataItemDTO(String ref, String descr) {
        this.ref = ref;
        this.descr = descr;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
}
