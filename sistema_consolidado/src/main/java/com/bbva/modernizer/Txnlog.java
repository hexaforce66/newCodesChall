package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Txnlog {
    public String buildAuditLine(Payment payment, ReturnArea returnArea) {
        return "PAY-ID=" + payment.getPayId() +
                ";CUSTOMER=" + payment.getPayCustomerId() +
                ";ACCOUNT=" + payment.getPayAccountId() +
                ";AMOUNT=" + payment.getPayAmount() +
                ";RETURN=" + returnArea.getReturnCode().getCode() +
                ";RISK=" + returnArea.getReturnRiskScore() +
                ";MESSAGE=" + returnArea.getReturnMessage();
    }
}