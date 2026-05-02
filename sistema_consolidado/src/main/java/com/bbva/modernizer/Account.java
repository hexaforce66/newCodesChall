package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.Date;

public record Account(
    String id,
    String customerId,
    AccountStatus status,
    BigDecimal balance,
    BigDecimal dailyLimit,
    String currency
) {
}

enum AccountStatus {
    OPEN,
    BLOCKED,
    CLOSED
}

public record Customer(
    String id,
    CustomerStatus status,
    boolean kycValid,
    RiskSegment riskSegment
) {
}

enum CustomerStatus {
    ACTIVE,
    BLOCKED,
    CLOSED
}

enum RiskSegment {
    LOW,
    MEDIUM,
    HIGH
}

public record Payment(
    String id,
    String customerId,
    String accountId,
    BigDecimal amount,
    String currency,
    String channel,
    String destination,
    Date requestDate
) {
}

public record ReturnArea(
    ReturnCode code,
    String message,
    int riskScore
) {
}

enum ReturnCode {
    APPROVED,
    CUSTOMER_ERROR,
    ACCOUNT_ERROR,
    BALANCE_ERROR,
    RISK_ERROR,
    REVIEW_REQUIRED
}

public class PaymentValidator {
    public ReturnArea validatePayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        if (!customer.status().equals(CustomerStatus.ACTIVE)) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer is not active", 0);
        }

        if (!account.status().equals(AccountStatus.OPEN)) {
            returnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR, "Account is not open", 0);
        }

        if (payment.amount().compareTo(account.balance()) > 0) {
            returnArea = new ReturnArea(ReturnCode.BALANCE_ERROR, "Insufficient funds", 0);
        }

        if (payment.amount().compareTo(account.dailyLimit()) > 0) {
            returnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment exceeds daily limit and requires review", 0);
        }

        return returnArea;
    }
}

public class RiskCalculator {
    public ReturnArea calculateRisk(Payment payment, Customer customer, Account account, ReturnArea returnArea) {
        int baseScore = 10;

        if (customer.riskSegment().equals(RiskSegment.MEDIUM)) {
            baseScore += 30;
        } else if (customer.riskSegment().equals(RiskSegment.HIGH)) {
            baseScore += 60;
        }

        int amountScore = 0;
        if (payment.amount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            amountScore = 30;
        } else if (payment.amount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            amountScore = 15;
        } else {
            amountScore = 5;
        }

        int riskScore = baseScore + amountScore;

        if (riskScore > 80) {
            returnArea = new ReturnArea(ReturnCode.RISK_ERROR, "Payment rejected by risk score", riskScore);
        } else if (riskScore > 60) {
            returnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment requires manual risk review", riskScore);
        }

        return returnArea;
    }
}

public class PaymentProcessor {
    public void processPayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new PaymentValidator().validatePayment(payment, customer, account);

        if (returnArea.code().equals(ReturnCode.APPROVED)) {
            returnArea = new RiskCalculator().calculateRisk(payment, customer, account, returnArea);
        }

        // Log the result
        System.out.println("Payment " + payment.id() + " " + returnArea.message());
    }
}