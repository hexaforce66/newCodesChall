// Payment.java
public record Payment(String id, String customerId, String accountId, double amount, String currency, String channel, String destination, String requestDate) {
}

// Customer.java
public record Customer(String id, String status, boolean kycValid, String riskSegment) {
}

// Account.java
public record Account(String id, String customerId, String status, double balance, double dailyLimit, String currency) {
}

// ReturnCode.java
public record ReturnCode(String code, String message, int riskScore) {
}