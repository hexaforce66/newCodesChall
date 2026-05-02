package com.bbva.modernizer;

public class Txnlog {
    public void buildAuditLine(Payment payment, ReturnArea returnArea) {
        String auditLine = "PAY-ID=" + payment.getPayId() +
                ";CUSTOMER=" + payment.getPayCustomerId() +
                ";ACCOUNT=" + payment.getPayAccountId() +
                ";AMOUNT=" + payment.getPayAmount() +
                ";RETURN=" + returnArea.getReturnCode() +
                ";RISK=" + returnArea.getReturnRiskScore() +
                ";MESSAGE=" + returnArea.getReturnMessage();

        System.out.println(auditLine);
    }
}