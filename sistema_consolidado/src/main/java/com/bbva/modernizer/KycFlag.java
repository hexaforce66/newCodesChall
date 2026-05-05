package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum KycFlag {
    VALID("Y"),
    MISSING("N");

    private final String code;

    KycFlag(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}