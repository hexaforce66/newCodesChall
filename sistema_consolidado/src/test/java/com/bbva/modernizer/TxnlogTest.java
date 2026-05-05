package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TxnlogTest {

    @Test
    public void testBuildAuditLine_ValidPayment_ReturnsAuditLine() {
        // Arrange
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);
        Txnlog txnlog = new Txnlog();

        // Act
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        // Assert
        assertEquals("PAY-ID=789;CUSTOMER=456;ACCOUNT=123;AMOUNT=50.00;RETURN=0000;RISK=0;MESSAGE=Payment approved", auditLine);
    }
}