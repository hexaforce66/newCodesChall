package com.bbva.modernizer;

import java.math.BigDecimal;

public class Txnlog {
    public String buildAuditLine(Payment payment, ReturnCode returnCode) {
        return "PAY-ID=" + payment.getPayId() +
                ";CUSTOMER=" + payment.getPayCustomerId() +
                ";ACCOUNT=" + payment.getPayAccountId() +
                ";AMOUNT=" + payment.getPayAmount() +
                ";RETURN=" + returnCode.getReturnCode() +
                ";RISK=" + returnCode.getReturnRiskScore() +
                ";MESSAGE=" + returnCode.getReturnMessage();
    }
}