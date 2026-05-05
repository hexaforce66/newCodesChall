package com.bbva.modernizer;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum RiskSegment {
    LOW("L"),
    MEDIUM("M"),
    HIGH("H");

    private final String code;

    RiskSegment(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}