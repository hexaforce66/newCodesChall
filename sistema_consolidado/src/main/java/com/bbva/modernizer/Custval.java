package com.bbva.modernizer;

import java.math.BigDecimal;

public class Custval {
    public ReturnArea validateCustomer(Payment payment, Customer customer) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED.getValue(), "Customer validation approved", 0);

        if (payment.customerId().isEmpty()) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR.getValue(), "Customer id is mandatory", 0);
        } else if (customer.status() == CustomerStatus.BLOCKED || customer.status() == CustomerStatus.CLOSED) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR.getValue(), "Customer is not active", 0);
        } else if (customer.kycStatus() == KycStatus.MISSING) {
            returnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR.getValue(), "Customer KYC is incomplete", 0);
        }

        return returnArea;
    }
}