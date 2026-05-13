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
            returnArea.setReturnCode(ReturnCode.RET_ACCT_ERR);
            returnArea.setReturnMessage("Account is not open");
            return returnArea;
        }

        if (!payment.getPayCurrency().equals(account.getAccCurrency())) {
            returnArea.setReturnCode(ReturnCode.RET_ACCT_ERR);
            returnArea.setReturnMessage("Payment currency differs from account currency");
            return returnArea;
        }

        if (payment.getPayAmount().compareTo(account.getAccDailyLimit()) > 0) {
            returnArea.setReturnCode(ReturnCode.RET_RISK_ERR);
            returnArea.setReturnMessage("Payment exceeds daily limit and requires review");
            return returnArea;
        }

        if (payment.getPayAmount().compareTo(account.getAccBalance()) > 0) {
            returnArea.setReturnCode(ReturnCode.RET_BAL_ERR);
            returnArea.setReturnMessage("Insufficient funds");
            return returnArea;
        }

        return returnArea;
    }
}