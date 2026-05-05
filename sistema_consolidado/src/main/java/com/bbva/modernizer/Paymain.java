package com.bbva.modernizer;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Paymain {
    public void processPayments(List<Payment> payments, List<Customer> customers, List<Account> accounts) {
        int approvedCount = 0;
        int rejectedCount = 0;
        int reviewCount = 0;
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Payment payment : payments) {
            ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

            Customer customer = getCustomer(customers, payment.getCustomerId());
            Account account = getAccount(accounts, payment.getAccountId());

            if (customer != null && account != null) {
                Custval custval = new Custval();
                returnArea = custval.validateCustomer(payment, customer);

                if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                    Balchk balchk = new Balchk();
                    returnArea = balchk.validateBalance(payment, account);

                    if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                        Riskscor riskscor = new Riskscor();
                        returnArea = riskscor.calculateRisk(payment, customer, account);
                    }
                }
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                approvedCount++;
                totalAmount = totalAmount.add(payment.getAmount());
            } else if (returnArea.getReturnCode() == ReturnCode.REVIEW_REQUIRED) {
                reviewCount++;
            } else {
                rejectedCount++;
            }

            writeResult(payment, returnArea);
        }

        writeSummary(approvedCount, rejectedCount, reviewCount, totalAmount);
    }

    private Customer getCustomer(List<Customer> customers, String customerId) {
        for (Customer customer : customers) {
            if (customer.getId().equals(customerId)) {
                return customer;
            }
        }
        return null;
    }

    private Account getAccount(List<Account> accounts, String accountId) {
        for (Account account : accounts) {
            if (account.getId().equals(accountId)) {
                return account;
            }
        }
        return null;
    }

    private void writeResult(Payment payment, ReturnArea returnArea) {
        Txnlog txnlog = new Txnlog();
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        try (PrintWriter writer = new PrintWriter(new FileWriter("audit.log", true))) {
            writer.println(auditLine);
        } catch (IOException e) {
            System.err.println("Error writing to audit log: " + e.getMessage());
        }

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            try (PrintWriter writer = new PrintWriter(new FileWriter("approved_payments.log", true))) {
                writer.println(payment.getId() + ";APPROVED;" + payment.getAmount() + ";" + returnArea.getReturnMessage());
            } catch (IOException e) {
                System.err.println("Error writing to approved payments log: " + e.getMessage());
            }
        } else {
            try (PrintWriter writer = new PrintWriter(new FileWriter("rejected_payments.log", true))) {
                writer.println(payment.getId() + ";REJECTED;" + returnArea.getReturnCode().getCode() + ";" + returnArea.getReturnMessage());
            } catch (IOException e) {
                System.err.println("Error writing to rejected payments log: " + e.getMessage());
            }
        }
    }

    private void writeSummary(int approvedCount, int rejectedCount, int reviewCount, BigDecimal totalAmount) {
        try (PrintWriter writer = new PrintWriter(new FileWriter("summary.log"))) {
            writer.println("SUMMARY;APPROVED=" + approvedCount +
                    ";REJECTED=" + rejectedCount +
                    ";REVIEW=" + reviewCount +
                    ";TOTAL=" + totalAmount);
        } catch (IOException e) {
            System.err.println("Error writing to summary log: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        Paymain paymain = new Paymain();

        List<Payment> payments = new ArrayList<>();
        // Add payments to the list

        List<Customer> customers = new ArrayList<>();
        // Add customers to the list

        List<Account> accounts = new ArrayList<>();
        // Add accounts to the list

        paymain.processPayments(payments, customers, accounts);
    }
}