package com.bbva.modernizer;

import java.math.BigDecimal;

public class Balchk {
    public ReturnArea validateBalance(Payment payment, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        if (account.getStatus() == AccountStatus.ACC_BLOCKED || account.getStatus() == AccountStatus.ACC_CLOSED) {
            returnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Account is not open", 0);
            return returnArea;
        }

        if (!payment.getCurrency().equals(account.getCurrency())) {
            returnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Payment currency differs from account currency", 0);
            return returnArea;
        }

        if (payment.getAmount().compareTo(account.getDailyLimit()) > 0) {
            returnArea = new ReturnArea(ReturnCode.RET_REVIEW, "Payment exceeds daily limit and requires review", 0);
            return returnArea;
        }

        if (payment.getAmount().compareTo(account.getBalance()) > 0) {
            returnArea = new ReturnArea(ReturnCode.RET_BAL_ERR, "Insufficient funds", 0);
            return returnArea;
        }

        return returnArea;
    }
}