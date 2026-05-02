package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Paymain {
    public void processPayments(List<Payment> payments, List<Customer> customers, List<Account> accounts) {
        List<Payment> approvedPayments = new ArrayList<>();
        List<Payment> rejectedPayments = new ArrayList<>();
        List<Payment> reviewPayments = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Payment payment : payments) {
            Customer customer = getCustomer(customers, payment.getPayCustomerId());
            Account account = getAccount(accounts, payment.getPayAccountId());

            if (customer != null && account != null) {
                ReturnCode returnCode = new ReturnCode("0000", "Payment approved", BigDecimal.ZERO);

                Custval custval = new Custval();
                returnCode = custval.validateCustomer(payment, customer);

                if (returnCode.getReturnCode().equals("0000")) {
                    Balchk balchk = new Balchk();
                    returnCode = balchk.validateBalance(payment, account);
                }

                if (returnCode.getReturnCode().equals("0000")) {
                    Riskscor riskscor = new Riskscor();
                    returnCode = riskscor.calculateRisk(payment, customer, account);
                }

                if (returnCode.getReturnCode().equals("0000")) {
                    approvedPayments.add(payment);
                    totalAmount = totalAmount.add(payment.getPayAmount());
                } else if (returnCode.getReturnCode().equals("9001")) {
                    reviewPayments.add(payment);
                } else {
                    rejectedPayments.add(payment);
                }
            }
        }

        // Write approved, rejected and review payments to files
        // Write audit log
        // Write summary
    }

    private Customer getCustomer(List<Customer> customers, String customerId) {
        for (Customer customer : customers) {
            if (customer.getCustId().equals(customerId)) {
                return customer;
            }
        }
        return null;
    }

    private Account getAccount(List<Account> accounts, String accountId) {
        for (Account account : accounts) {
            if (account.getAccId().equals(accountId)) {
                return account;
            }
        }
        return null;
    }
}