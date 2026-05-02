// PaymentProcessorTest.java
@ExtendWith(MockitoExtension.class)
public class PaymentProcessorTest {
    @Mock
    private PaymentValidator paymentValidator;

    @Mock
    private RiskScoreCalculator riskScoreCalculator;

    @Mock
    private AuditLogger auditLogger;

    @InjectMocks
    private PaymentProcessor paymentProcessor;

    @Test
    public void testProcessPayment() {
        // Configuración
        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setPaymentId("12345");
        paymentDTO.setCustomerId("67890");
        paymentDTO.setAccountId("34567");
        paymentDTO.setAmount(100.0);
        paymentDTO.setCurrency("EUR");
        paymentDTO.setChannel("WEB");
        paymentDTO.setDestination("ES");
        paymentDTO.setRequestDate(new Date());

        // Simulación
        when(paymentValidator.validatePayment(paymentDTO)).thenReturn(true);
        when(riskScoreCalculator.calculateRisk(paymentDTO)).thenReturn(10);
        when(auditLogger.logAudit(paymentDTO)).thenReturn(true);

        // Ejecución
        paymentProcessor.processPayment(paymentDTO);

        // Verificación
        verify(paymentValidator, times(1)).validatePayment(paymentDTO);
        verify(riskScoreCalculator, times(1)).calculateRisk(paymentDTO);
        verify(auditLogger, times(1)).logAudit(paymentDTO);
    }

    @Test
    public void testProcessPaymentError() {
        // Configuración
        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setPaymentId("12345");
        paymentDTO.setCustomerId("67890");
        paymentDTO.setAccountId("34567");
        paymentDTO.setAmount(100.0);
        paymentDTO.setCurrency("EUR");
        paymentDTO.setChannel("WEB");
        paymentDTO.setDestination("ES");
        paymentDTO.setRequestDate(new Date());

        // Simulación
        when(paymentValidator.validatePayment(paymentDTO)).thenThrow(new PaymentException("Pago no válido"));

        // Ejecución
        assertThrows(PaymentException.class, () -> paymentProcessor.processPayment(paymentDTO));

        // Verificación
        verify(paymentValidator, times(1)).validatePayment(paymentDTO);
        verify(riskScoreCalculator, never()).calculateRisk(paymentDTO);
        verify(auditLogger, never()).logAudit(paymentDTO);
    }
}