package com.bbva.modernizer;

import java.math.BigDecimal;

public class Txnlog {
    public String buildAuditLine(Payment payment, ReturnArea returnArea) {
        return "PAY-ID=" + payment.id() +
                ";CUSTOMER=" + payment.customerId() +
                ";ACCOUNT=" + payment.accountId() +
                ";AMOUNT=" + payment.amount() +
                ";RETURN=" + returnArea.code() +
                ";RISK=" + returnArea.riskScore() +
                ";MESSAGE=" + returnArea.message();
    }
}