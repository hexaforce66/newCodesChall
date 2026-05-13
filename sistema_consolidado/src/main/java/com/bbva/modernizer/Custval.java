package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Custval {
    public ReturnArea validateCustomer(Payment payment, Customer customer) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        if (payment.getPayCustomerId().isEmpty()) {
            returnArea.setReturnCode(ReturnCode.RET_CUST_ERR);
            returnArea.setReturnMessage("Customer id is mandatory");
            return returnArea;
        }

        if (customer.getCustStatus() == CustomerStatus.CUST_BLOCKED || customer.getCustStatus() == CustomerStatus.CUST_CLOSED) {
            returnArea.setReturnCode(ReturnCode.RET_CUST_ERR);
            returnArea.setReturnMessage("Customer is not active");
            return returnArea;
        }

        if (customer.getKycFlag() == KycFlag.KYC_MISSING) {
            returnArea.setReturnCode(ReturnCode.RET_CUST_ERR);
            returnArea.setReturnMessage("Customer KYC is incomplete");
            return returnArea;
        }

        return returnArea;
    }
}