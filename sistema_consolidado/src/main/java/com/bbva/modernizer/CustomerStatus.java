package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum CustomerStatus {
    ACTIVE("A"),
    BLOCKED("B"),
    CLOSED("C");

    private final String code;

    CustomerStatus(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}