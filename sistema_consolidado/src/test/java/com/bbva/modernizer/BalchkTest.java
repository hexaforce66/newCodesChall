package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_Returns2001() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_BLOCKED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("2001", "Account is not open", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }

    @Test
    public void testValidateBalance_AccountClosed_Returns2001() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_CLOSED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("2001", "Account is not open", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffersFromAccountCurrency_Returns2001() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(100.00), "USD", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("2001", "Payment currency differs from account currency", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_Returns9001() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(1500.00), "EUR", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("9001", "Payment exceeds daily limit and requires review", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_Returns3001() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(1500.00), "EUR", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(100.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("3001", "Insufficient funds", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }

    @Test
    public void testValidateBalance_ValidPayment_Returns0000() {
        // Arrange
        Payment payment = new Payment("PAY001", "CUST001", "ACC001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL1", "DESTINATION1", "20220101");
        Account account = new Account("ACC001", "CUST001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnCode expectedReturnCode = new ReturnCode("0000", "Balance validation approved", BigDecimal.ZERO);

        // Act
        Balchk balchk = new Balchk();
        ReturnCode returnCode = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnCode.getReturnCode(), returnCode.getReturnCode());
        assertEquals(expectedReturnCode.getReturnMessage(), returnCode.getReturnMessage());
    }
}