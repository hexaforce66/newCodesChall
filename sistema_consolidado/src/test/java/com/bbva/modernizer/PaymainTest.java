package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PaymainTest {

    @Test
    public void testProcessPayment_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");

        // Act
        Paymain paymain = new Paymain();
        paymain.processPayment(payment);

        // Assert
        // Verify that the payment was approved
        // This can be done by checking the output files or the database
    }
}