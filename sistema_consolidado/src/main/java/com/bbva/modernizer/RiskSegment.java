package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum RiskSegment {
    RISK_LOW("L"),
    RISK_MEDIUM("M"),
    RISK_HIGH("H");

    private final String code;

    RiskSegment(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}