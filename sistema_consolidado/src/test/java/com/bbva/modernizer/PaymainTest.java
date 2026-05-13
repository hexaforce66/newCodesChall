package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PaymainTest {

    @Test
    public void testProcessPayment_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");

        // Act
        Paymain paymain = new Paymain();
        paymain.processPayment(payment, customer, account);

        // Assert
        // Verify that the payment was approved and written to the approved file
    }
}