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

            Customer customer = findCustomer(customers, payment.getCustomerId());
            if (customer != null) {
                returnArea = new Custval().validateCustomer(payment, customer);
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                Account account = findAccount(accounts, payment.getAccountId());
                if (account != null) {
                    returnArea = new Balchk().validateBalance(payment, account);
                }
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                returnArea = new Riskscor().calculateRisk(payment, customer, account);
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                approvedCount++;
                totalAmount = totalAmount.add(payment.getAmount());
            } else if (returnArea.getReturnCode() == ReturnCode.REVIEW_REQUIRED) {
                reviewCount++;
            } else {
                rejectedCount++;
            }

            writeAuditLine(payment, returnArea);
            writeResult(payment, returnArea);
        }

        writeSummary(approvedCount, rejectedCount, reviewCount, totalAmount);
    }

    private Customer findCustomer(List<Customer> customers, String customerId) {
        for (Customer customer : customers) {
            if (customer.getId().equals(customerId)) {
                return customer;
            }
        }
        return null;
    }

    private Account findAccount(List<Account> accounts, String accountId) {
        for (Account account : accounts) {
            if (account.getId().equals(accountId)) {
                return account;
            }
        }
        return null;
    }

    private void writeAuditLine(Payment payment, ReturnArea returnArea) {
        String auditLine = new Txnlog().buildAuditLine(payment, returnArea);
        try (PrintWriter writer = new PrintWriter(new FileWriter("audit.log", true))) {
            writer.println(auditLine);
        } catch (IOException e) {
            System.err.println("Error writing to audit log: " + e.getMessage());
        }
    }

    private void writeResult(Payment payment, ReturnArea returnArea) {
        String resultLine;
        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            resultLine = payment.getId() + ";APPROVED;" + payment.getAmount() + ";" + returnArea.getReturnMessage();
            try (PrintWriter writer = new PrintWriter(new FileWriter("approved.log", true))) {
                writer.println(resultLine);
            } catch (IOException e) {
                System.err.println("Error writing to approved log: " + e.getMessage());
            }
        } else {
            resultLine = payment.getId() + ";REJECTED;" + returnArea.getReturnCode().getCode() + ";" + returnArea.getReturnMessage();
            try (PrintWriter writer = new PrintWriter(new FileWriter("rejected.log", true))) {
                writer.println(resultLine);
            } catch (IOException e) {
                System.err.println("Error writing to rejected log: " + e.getMessage());
            }
        }
    }

    private void writeSummary(int approvedCount, int rejectedCount, int reviewCount, BigDecimal totalAmount) {
        String summaryLine = "SUMMARY;APPROVED=" + approvedCount +
                ";REJECTED=" + rejectedCount +
                ";REVIEW=" + reviewCount +
                ";TOTAL=" + totalAmount;
        try (PrintWriter writer = new PrintWriter(new FileWriter("summary.log", true))) {
            writer.println(summaryLine);
        } catch (IOException e) {
            System.err.println("Error writing to summary log: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        List<Payment> payments = new ArrayList<>();
        List<Customer> customers = new ArrayList<>();
        List<Account> accounts = new ArrayList<>();

        // Add payments, customers and accounts to the lists...

        Paymain paymain = new Paymain();
        paymain.processPayments(payments, customers, accounts);
    }
}