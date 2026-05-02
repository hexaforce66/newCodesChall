// ProcesoBancarioOrquestadorTest.java
@ExtendWith(MockitoExtension.class)
public class ProcesoBancarioOrquestadorTest {

    @Mock
    private ProcesoBancarioMotor procesoBancarioMotor;

    @Mock
    private TransaccionRepository transaccionRepository;

    @Mock
    private CuentaRepository cuentaRepository;

    @Mock
    private Logger logger;

    @InjectMocks
    private ProcesoBancarioOrquestador orquestador;

    @Test
    public void testProcesarTransacciones() {
        // Configuración de mocks
        Transaccion transaccion = new Transaccion();
        transaccion.setId(1L);
        transaccion.setMonto(BigDecimal.valueOf(100));

        Cuenta cuenta = new Cuenta();
        cuenta.setId(1L);
        cuenta.setSaldo(BigDecimal.valueOf(1000));

        when(transaccionRepository.findAll()).thenReturn(Collections.singletonList(transaccion));
        when(cuentaRepository.findById(transaccion.getId())).thenReturn(Optional.of(cuenta));

        // Ejecución del método
        orquestador.procesarTransacciones();

        // Verificación de resultados
        verify(procesoBancarioMotor).validarTransaccion(cuenta, transaccion);
        verify(cuentaRepository).save(cuenta);
    }

    @Test
    public void testProcesarTransaccionConError() {
        // Configuración de mocks
        Transaccion transaccion = new Transaccion();
        transaccion.setId(1L);
        transaccion.setMonto(BigDecimal.valueOf(-100));

        Cuenta cuenta = new Cuenta();
        cuenta.setId(1L);
        cuenta.setSaldo(BigDecimal.valueOf(1000));

        when(transaccionRepository.findAll()).thenReturn(Collections.singletonList(transaccion));
        when(cuentaRepository.findById(transaccion.getId())).thenReturn(Optional.of(cuenta));

        // Ejecución del método
        orquestador.procesarTransacciones();

        // Verificación de resultados
        verify(logger).error("Error procesando transacción", any(Exception.class));
    }
}