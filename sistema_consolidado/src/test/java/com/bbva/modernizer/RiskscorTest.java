package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiskscorTest {

    @Test
    public void testCalculateRisk_RiskMedium_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_MEDIUM);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Risk validation approved", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_RiskHigh_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_HIGH);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Risk validation approved", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_PaymentAmountHigh_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(15000), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Risk validation approved", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_RiskScoreHigh_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_HIGH);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_RISK_ERR, returnArea.getReturnCode());
        assertEquals("Payment rejected by risk score", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_RiskScoreMedium_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_MEDIUM);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_REVIEW, returnArea.getReturnCode());
        assertEquals("Payment requires manual risk review", returnArea.getReturnMessage());
    }
}