package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Paymain {
    public void processPayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Payment approved", 0);

        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            Balchk balchk = new Balchk();
            returnArea = balchk.validateBalance(payment, account);
        }

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            Riskscor riskscor = new Riskscor();
            returnArea = riskscor.calculateRisk(payment, customer, account);
        }

        Txnlog txnlog = new Txnlog();
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        // Write audit line to file

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            // Write payment to approved file
        } else {
            // Write payment to rejected file
        }
    }
}