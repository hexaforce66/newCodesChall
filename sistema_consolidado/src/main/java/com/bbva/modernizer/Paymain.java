package com.bbva.modernizer;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Paymain {
    public void processPayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        Custval custval = new Custval();
        returnArea = custval.validateCustomer(customer, payment);

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            Balchk balchk = new Balchk();
            returnArea = balchk.validateBalance(account, payment);
        }

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            Riskscor riskscor = new Riskscor();
            returnArea = riskscor.calculateRisk(payment, customer, account);
        }

        Txnlog txnlog = new Txnlog();
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        System.out.println(auditLine);
    }
}