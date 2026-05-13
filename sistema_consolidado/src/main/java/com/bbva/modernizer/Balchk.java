package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Balchk {
    public ReturnArea validateBalance(Payment payment, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        if (account.getAccStatus() == AccountStatus.ACC_BLOCKED || account.getAccStatus() == AccountStatus.ACC_CLOSED) {
            returnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Account is not open", 0);
        } else if (!payment.getPayCurrency().equals(account.getAccCurrency())) {
            returnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Payment currency differs from account currency", 0);
        } else if (payment.getPayAmount().compareTo(account.getAccDailyLimit()) > 0) {
            returnArea = new ReturnArea(ReturnCode.RET_REVIEW, "Payment exceeds daily limit and requires review", 0);
        } else if (payment.getPayAmount().compareTo(account.getAccBalance()) > 0) {
            returnArea = new ReturnArea(ReturnCode.RET_BAL_ERR, "Insufficient funds", 0);
        }

        return returnArea;
    }
}