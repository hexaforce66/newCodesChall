package com.bbva.modernizer;

import java.math.BigDecimal;

public class Paymain {
    public void processPayment(Payment payment) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        Customer customer = new Customer(payment.getCustomerId(), CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Account account = new Account(payment.getAccountId(), payment.getCustomerId(), AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");

        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            Balchk balchk = new Balchk();
            returnArea = balchk.validateBalance(payment, account);
        }

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            Riskscor riskscor = new Riskscor();
            returnArea = riskscor.calculateRisk(payment, customer, account);
        }

        System.out.println("Return Code: " + returnArea.getReturnCode().getCode());
        System.out.println("Return Message: " + returnArea.getReturnMessage());
        System.out.println("Return Risk Score: " + returnArea.getReturnRiskScore());
    }
}