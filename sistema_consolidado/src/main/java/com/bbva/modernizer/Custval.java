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
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer id is mandatory", 0);
        } else if (customer.getCustStatus() == CustomerStatus.CUST_BLOCKED || customer.getCustStatus() == CustomerStatus.CUST_CLOSED) {
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer is not active", 0);
        } else if (customer.getKycFlag() == KycFlag.KYC_MISSING) {
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer KYC is incomplete", 0);
        }

        return returnArea;
    }
}