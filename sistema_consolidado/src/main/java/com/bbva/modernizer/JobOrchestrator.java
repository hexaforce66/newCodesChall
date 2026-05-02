// JobOrchestrator.java
public class JobOrchestrator {
    private PaymentProcessor paymentProcessor;

    public JobOrchestrator(PaymentProcessor paymentProcessor) {
        this.paymentProcessor = paymentProcessor;
    }

    public void execute() {
        // Lógica de ejecución del proceso de pago
        paymentProcessor.processPayment(new Payment("1", "1", "1", 100.0, "EUR", "WEB", "ES", "2023-03-01"));
    }
}