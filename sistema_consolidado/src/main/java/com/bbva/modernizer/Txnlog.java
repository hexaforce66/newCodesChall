package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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