package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Paymain {
    public void processPayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Payment approved", 0);

        Balchk balchk = new Balchk();
        Custval custval = new Custval();
        Riskscor riskscor = new Riskscor();
        Txnlog txnlog = new Txnlog();

        returnArea = custval.validateCustomer(payment, customer);

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            returnArea = balchk.validateBalance(payment, account);
        }

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            returnArea = riskscor.calculateRisk(payment, customer, account);
        }

        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        System.out.println(auditLine);

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            System.out.println("PAY-ID=" + payment.getPayId() + ";APPROVED;" + payment.getPayAmount() + ";" + returnArea.getReturnMessage());
        } else {
            System.out.println("PAY-ID=" + payment.getPayId() + ";REJECTED;" + returnArea.getReturnCode().getValue() + ";" + returnArea.getReturnMessage());
        }
    }
}