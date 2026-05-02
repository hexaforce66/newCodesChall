package com.bbva.modernizer;

import java.math.BigDecimal;

public enum ReturnCode {
    APPROVED('0000'),
    CUSTOMER_ERROR('1001'),
    ACCOUNT_ERROR('2001'),
    BALANCE_ERROR('3001'),
    RISK_ERROR('4001'),
    REVIEW_REQUIRED('9001');

    private final String value;

    ReturnCode(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}