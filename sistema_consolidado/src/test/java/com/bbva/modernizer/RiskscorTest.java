package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiskscorTest {

    @Test
    public void testCalculateRisk_RiskScoreAbove80_ReturnsRiskError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(10000), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.HIGH);
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RISK_ERROR, "Payment rejected by risk score", 90);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), returnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), returnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), returnArea.getReturnRiskScore());
    }

    @Test
    public void testCalculateRisk_RiskScoreAbove60_ReturnsReviewRequired() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(5000), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.MEDIUM);
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment requires manual risk review", 60);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), returnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), returnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), returnArea.getReturnRiskScore());
    }

    @Test
    public void testCalculateRisk_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.APPROVED, "Risk validation approved", 10);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), returnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), returnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), returnArea.getReturnRiskScore());
    }
}