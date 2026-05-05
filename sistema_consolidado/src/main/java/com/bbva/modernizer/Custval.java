package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Custval {
    public ReturnArea validateCustomer(Payment payment, Customer customer) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Customer validation approved", 0);

        if (payment.getCustomerId() == null || payment.getCustomerId().isEmpty()) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer id is mandatory", 0);
        } else if (customer.getStatus() == CustomerStatus.BLOCKED || customer.getStatus() == CustomerStatus.CLOSED) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer is not active", 0);
        } else if (customer.getKycFlag() == KycFlag.MISSING) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer KYC is incomplete", 0);
        }

        return returnArea;
    }
}