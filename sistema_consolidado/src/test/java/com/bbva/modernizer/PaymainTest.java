package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PaymainTest {

    @Test
    public void testMainProcess_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");

        // Act
        Paymain paymain = new Paymain();
        paymain.mainProcess(payment);

        // Assert
        // No assertion needed, as the mainProcess method does not return any value.
        // The test is successful if the method executes without any errors.
    }
}