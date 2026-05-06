package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Custval {
    public ReturnArea validateCustomer(Payment payment, Customer customer) {
        if (payment.getCustomerId() == null || payment.getCustomerId().isEmpty()) {
            return new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer id is mandatory", 0);
        }

        if (customer.getStatus() == CustomerStatus.BLOCKED || customer.getStatus() == CustomerStatus.CLOSED) {
            return new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer is not active", 0);
        }

        if (customer.getKycStatus() == KycStatus.MISSING) {
            return new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer KYC is incomplete", 0);
        }

        return new ReturnArea(ReturnCode.APPROVED, "Customer validation approved", 0);
    }
}