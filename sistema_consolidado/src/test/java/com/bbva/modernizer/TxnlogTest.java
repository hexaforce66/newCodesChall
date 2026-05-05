package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TxnlogTest {

    @Test
    public void testBuildAuditLine_ValidPayment_ReturnsAuditLine() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);
        String expectedAuditLine = "PAY-ID=PAY-123;CUSTOMER=CUST-123;ACCOUNT=ACC-123;AMOUNT=100.00;RETURN=0000;RISK=0;MESSAGE=Payment approved";

        // Act
        Txnlog txnlog = new Txnlog();
        String actualAuditLine = txnlog.buildAuditLine(payment, returnArea);

        // Assert
        assertEquals(expectedAuditLine, actualAuditLine);
    }
}