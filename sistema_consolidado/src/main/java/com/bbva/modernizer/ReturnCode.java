package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public enum ReturnCode {
    APPROVED("0000"),
    CUSTOMER_ERROR("1001"),
    ACCOUNT_ERROR("2001"),
    BALANCE_ERROR("3001"),
    RISK_ERROR("4001"),
    REVIEW_REQUIRED("9001");

    private final String code;

    ReturnCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}