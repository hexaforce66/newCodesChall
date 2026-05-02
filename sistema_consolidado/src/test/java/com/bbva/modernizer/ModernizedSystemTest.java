// PaymentJobOrchestratorTest.java
@ExtendWith(MockitoExtension.class)
public class PaymentJobOrchestratorTest {
    @Mock
    private PaymentRepository paymentRepository;

    @Mock
    private PaymentRuleEngine paymentRuleEngine;

    @InjectMocks
    private PaymentJobOrchestrator paymentJobOrchestrator;

    @Test
    public void testExecute() {
        // Configuración
        List<Payment> payments = Arrays.asList(new Payment("1", "1", "1", BigDecimal.valueOf(100), "EUR", "CHANNEL1", "DESTINATION1", LocalDate.now()));
        when(paymentRepository.findAll()).thenReturn(payments);

        Customer customer = new Customer("1", "ACTIVE", true, "LOW");
        when(paymentRepository.findCustomerByPayment(any(Payment.class))).thenReturn(customer);

        Account account = new Account("1", "1", "OPEN", BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        when(paymentRepository.findAccountByPayment(any(Payment.class))).thenReturn(account);

        ReturnCode returnCode = new ReturnCode("0000", "Payment approved", 0);
        when(paymentRuleEngine.evaluate(any(Payment.class), any(Customer.class), any(Account.class))).thenReturn(returnCode);

        // Ejecución
        paymentJobOrchestrator.execute();

        // Verificación
        verify(paymentRepository, times(1)).findAll();
        verify(paymentRepository, times(1)).findCustomerByPayment(any(Payment.class));
        verify(paymentRepository, times(1)).findAccountByPayment(any(Payment.class));
        verify(paymentRuleEngine, times(1)).evaluate(any(Payment.class), any(Customer.class), any(Account.class));
    }

    @Test
    public void testExecute_PaymentException() {
        // Configuración
        List<Payment> payments = Arrays.asList(new Payment("1", "1", "1", BigDecimal.valueOf(100), "EUR", "CHANNEL1", "DESTINATION1", LocalDate.now()));
        when(paymentRepository.findAll()).thenReturn(payments);

        Customer customer = new Customer("1", "ACTIVE", true, "LOW");
        when(paymentRepository.findCustomerByPayment(any(Payment.class))).thenReturn(customer);

        Account account = new Account("1", "1", "OPEN", BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        when(paymentRepository.findAccountByPayment(any(Payment.class))).thenReturn(account);

        PaymentException paymentException = new PaymentException("1001", "Customer is not active");
        when(paymentRuleEngine.evaluate(any(Payment.class), any(Customer.class), any(Account.class))).thenThrow(paymentException);

        // Ejecución
        paymentJobOrchestrator.execute();

        // Verificación
        verify(paymentRepository, times(1)).findAll();
        verify(paymentRepository, times(1)).findCustomerByPayment(any(Payment.class));
        verify(paymentRepository, times(1)).findAccountByPayment(any(Payment.class));
        verify(paymentRuleEngine, times(1)).evaluate(any(Payment.class), any(Customer.class), any(Account.class));
    }
}