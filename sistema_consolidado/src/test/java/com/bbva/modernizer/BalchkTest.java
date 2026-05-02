package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_BLOCKED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Account is not open", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_AccountClosed_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_CLOSED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Account is not open", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffersFromAccountCurrency_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "USD", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_ACCT_ERR, "Payment currency differs from account currency", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(600.00), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_REVIEW, "Payment exceeds daily limit and requires review", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(1200.00), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_BAL_ERR, "Insufficient funds", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }
}