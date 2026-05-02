// Main.java
public class Main {
    public static void main(String[] args) {
        PaymentProcessor paymentProcessor = new PaymentProcessor(new PaymentValidator(), new CustomerValidator(), new AccountValidator(), new RiskScoreCalculator(), new TransactionLogger());
        JobOrchestrator jobOrchestrator = new JobOrchestrator(paymentProcessor);
        jobOrchestrator.execute();
    }
}