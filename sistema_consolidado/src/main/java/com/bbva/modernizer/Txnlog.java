package com.bbva.modernizer;

public class Txnlog {
    public void buildAuditLine(Payment payment, ReturnArea returnArea) {
        String auditLine = "PAY-ID=" + payment.getId() +
                ";CUSTOMER=" + payment.getCustomerId() +
                ";ACCOUNT=" + payment.getAccountId() +
                ";AMOUNT=" + payment.getAmount() +
                ";RETURN=" + returnArea.getReturnCode().getCode() +
                ";RISK=" + returnArea.getReturnRiskScore() +
                ";MESSAGE=" + returnArea.getReturnMessage();

        System.out.println(auditLine);
    }
}