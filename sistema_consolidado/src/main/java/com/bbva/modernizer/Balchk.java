package com.bbva.modernizer;

import java.math.BigDecimal;

public class Balchk {
    public ReturnArea validateBalance(Payment payment, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED.getValue(), "Balance validation approved", 0);

        if (account.status() == AccountStatus.BLOCKED || account.status() == AccountStatus.CLOSED) {
            returnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR.getValue(), "Account is not open", 0);
        } else if (!payment.currency().equals(account.currency())) {
            returnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR.getValue(), "Payment currency differs from account currency", 0);
        } else if (payment.amount().compareTo(account.dailyLimit()) > 0) {
            returnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED.getValue(), "Payment exceeds daily limit and requires review", 0);
        } else if (payment.amount().compareTo(account.balance()) > 0) {
            returnArea = new ReturnArea(ReturnCode.BALANCE_ERROR.getValue(), "Insufficient funds", 0);
        }

        return returnArea;
    }
}