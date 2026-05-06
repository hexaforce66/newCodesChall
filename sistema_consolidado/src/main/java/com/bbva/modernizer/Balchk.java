package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Balchk {
    public ReturnArea validateBalance(Payment payment, Account account) {
        if (account.getStatus() == AccountStatus.BLOCKED || account.getStatus() == AccountStatus.CLOSED) {
            return new ReturnArea(ReturnCode.ACCOUNT_ERROR, "Account is not open", 0);
        }

        if (!payment.getCurrency().equals(account.getCurrency())) {
            return new ReturnArea(ReturnCode.ACCOUNT_ERROR, "Payment currency differs from account currency", 0);
        }

        if (payment.getAmount().compareTo(account.getDailyLimit()) > 0) {
            return new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment exceeds daily limit and requires review", 0);
        }

        if (payment.getAmount().compareTo(account.getBalance()) > 0) {
            return new ReturnArea(ReturnCode.BALANCE_ERROR, "Insufficient funds", 0);
        }

        return new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);
    }
}