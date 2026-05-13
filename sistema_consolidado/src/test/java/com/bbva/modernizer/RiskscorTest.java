package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiskscorTest {

    @Test
    public void testCalculateRisk_RiskScoreAbove80_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(15000.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_HIGH);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_RISK_ERR, returnArea.getReturnCode());
        assertEquals("Payment rejected by risk score", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_RiskScoreAbove60_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(10000.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_HIGH);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_REVIEW, returnArea.getReturnCode());
        assertEquals("Payment requires manual risk review", returnArea.getReturnMessage());
    }

    @Test
    public void testCalculateRisk_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        // Act
        Riskscor riskscor = new Riskscor();
        returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Risk validation approved", returnArea.getReturnMessage());
    }
}