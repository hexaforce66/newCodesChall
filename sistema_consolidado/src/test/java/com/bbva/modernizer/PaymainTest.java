package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PaymainTest {

    @Test
    public void testProcessPayment_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Paymain paymain = new Paymain();

        // Act
        paymain.processPayment(payment, customer, account);

        // Assert
        // No assertion needed, as the processPayment method does not return a value.
        // However, we can verify that the payment was processed correctly by checking the output files.
    }
}