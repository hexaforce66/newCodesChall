package com.bbva.modernizer;

import java.math.BigDecimal;

public class Balchk {
    public ReturnCode validateBalance(Payment payment, Account account) {
        ReturnCode returnCode = new ReturnCode("0000", "Balance validation approved", BigDecimal.ZERO);

        if (account.getAccStatus() == AccountStatus.ACC_BLOCKED || account.getAccStatus() == AccountStatus.ACC_CLOSED) {
            returnCode = new ReturnCode("2001", "Account is not open", BigDecimal.ZERO);
        } else if (!payment.getPayCurrency().equals(account.getAccCurrency())) {
            returnCode = new ReturnCode("2001", "Payment currency differs from account currency", BigDecimal.ZERO);
        } else if (payment.getPayAmount().compareTo(account.getAccDailyLimit()) > 0) {
            returnCode = new ReturnCode("9001", "Payment exceeds daily limit and requires review", BigDecimal.ZERO);
        } else if (payment.getPayAmount().compareTo(account.getAccBalance()) > 0) {
            returnCode = new ReturnCode("3001", "Insufficient funds", BigDecimal.ZERO);
        }

        return returnCode;
    }
}