package com.bbva.modernizer;

public class Txnlog {
    public String buildAuditLine(Payment payment, ReturnArea returnArea) {
        return "PAY-ID=" + payment.getId() +
                ";CUSTOMER=" + payment.getCustomerId() +
                ";ACCOUNT=" + payment.getAccountId() +
                ";AMOUNT=" + payment.getAmount() +
                ";RETURN=" + returnArea.getReturnCode().getCode() +
                ";RISK=" + returnArea.getReturnRiskScore() +
                ";MESSAGE=" + returnArea.getReturnMessage();
    }
}