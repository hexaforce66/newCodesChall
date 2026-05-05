package com.bbva.modernizer;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Balchk {
    public ReturnArea validateBalance(Account account, Payment payment) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        if (account.getStatus() == AccountStatus.BLOCKED || account.getStatus() == AccountStatus.CLOSED) {
            returnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR, "Account is not open", 0);
        } else if (!payment.getCurrency().equals(account.getCurrency())) {
            returnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR, "Payment currency differs from account currency", 0);
        } else if (payment.getAmount().compareTo(account.getDailyLimit()) > 0) {
            returnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment exceeds daily limit and requires review", 0);
        } else if (payment.getAmount().compareTo(account.getBalance()) > 0) {
            returnArea = new ReturnArea(ReturnCode.BALANCE_ERROR, "Insufficient funds", 0);
        }

        return returnArea;
    }
}