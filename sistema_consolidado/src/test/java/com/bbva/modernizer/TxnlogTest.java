package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TxnlogTest {

    @Test
    public void testBuildAuditLine_ValidPayment_ReturnsAuditLine() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Payment approved", 0);

        // Act
        Txnlog txnlog = new Txnlog();
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        // Assert
        assertEquals("PAY-ID=PAY-001;CUSTOMER=CUST-001;ACCOUNT=ACC-001;AMOUNT=100.00;RETURN=0000;RISK=0;MESSAGE=Payment approved", auditLine);
    }
}