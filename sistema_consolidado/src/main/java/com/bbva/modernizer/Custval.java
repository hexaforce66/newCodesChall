package com.bbva.modernizer;

public class Custval {
    public ReturnArea validateCustomer(Payment payment, Customer customer) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        if (payment.getCustomerId().isEmpty()) {
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer id is mandatory", 0);
            return returnArea;
        }

        if (customer.getStatus() == CustomerStatus.CUST_BLOCKED || customer.getStatus() == CustomerStatus.CUST_CLOSED) {
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer is not active", 0);
            return returnArea;
        }

        if (customer.getKycFlag() == KycFlag.KYC_MISSING) {
            returnArea = new ReturnArea(ReturnCode.RET_CUST_ERR, "Customer KYC is incomplete", 0);
            return returnArea;
        }

        return returnArea;
    }
}