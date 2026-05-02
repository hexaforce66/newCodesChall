// PaymentException.java
public class PaymentException extends Exception {
    public PaymentException(String message) {
        super(message);
    }
}

// PaymentProcessor.java
public class PaymentProcessor {
    // ...

    public void processPayment(Payment payment) {
        try {
            // Lógica de procesamiento de pagos
        } catch (Exception e) {
            throw new PaymentException("Error procesando pago", e);
        }
    }
}