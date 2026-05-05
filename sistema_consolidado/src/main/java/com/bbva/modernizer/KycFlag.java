package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum KycFlag {
    KYC_VALID("Y"),
    KYC_MISSING("N");

    private final String value;

    KycFlag(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}