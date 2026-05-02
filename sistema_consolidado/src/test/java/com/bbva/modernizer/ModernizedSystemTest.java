// JobOrchestratorTest.java
@ExtendWith(MockitoExtension.class)
public class JobOrchestratorTest {
    @Mock
    private PaymentProcessor paymentProcessor;

    @InjectMocks
    private JobOrchestrator jobOrchestrator;

    @Test
    void testExecute() {
        // Configuración del mock
        when(paymentProcessor.processPayment(any(Payment.class))).thenReturn(ReturnCode.builder().code("OK").message("Pago procesado correctamente").riskScore(0).build());

        // Ejecución del método a probar
        jobOrchestrator.execute();

        // Verificación del resultado
        verify(paymentProcessor, times(1)).processPayment(any(Payment.class));
    }

    @Test
    void testExecute_PaymentException() {
        // Configuración del mock
        when(paymentProcessor.processPayment(any(Payment.class))).thenThrow(PaymentException.class);

        // Ejecución del método a probar
        assertThrows(PaymentException.class, () -> jobOrchestrator.execute());

        // Verificación del resultado
        verify(paymentProcessor, times(1)).processPayment(any(Payment.class));
    }
}