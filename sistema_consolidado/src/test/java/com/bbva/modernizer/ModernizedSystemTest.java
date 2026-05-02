// ProcesoBancarioOrquestadorTest.java
@SpringBootTest
class ProcesoBancarioOrquestadorTest {

    @Autowired
    private ProcesoBancarioOrquestador orquestador;

    @MockBean
    private MotorReglas motorReglas;

    @MockBean
    private ConsultaSaldo consultaSaldo;

    @MockBean
    private ActualizacionSaldo actualizacionSaldo;

    @MockBean
    private LogErrores logErrores;

    @Test
    void procesarTransacciones() throws IOException {
        // Configuración de mocks
        when(consultaSaldo.consultarSaldo(anyInt())).thenReturn(BigDecimal.valueOf(100));
        when(motorReglas.validarTransaccion(any(), any())).thenReturn(new ResultadoTransaccion(true, BigDecimal.valueOf(150), "OK"));

        // Ejecución del método
        orquestador.procesarTransacciones(new File("transacciones.txt"));

        // Verificación de llamadas a mocks
        verify(actualizacionSaldo).actualizarSaldo(anyInt(), any());
        verify(logErrores, never()).logearError(anyInt(), anyString());
    }

    @Test
    void procesarTransaccionesConError() throws IOException {
        // Configuración de mocks
        when(consultaSaldo.consultarSaldo(anyInt())).thenReturn(BigDecimal.valueOf(100));
        when(motorReglas.validarTransaccion(any(), any())).thenReturn(new ResultadoTransaccion(false, null, "ER"));

        // Ejecución del método
        orquestador.procesarTransacciones(new File("transacciones.txt"));

        // Verificación de llamadas a mocks
        verify(actualizacionSaldo, never()).actualizarSaldo(anyInt(), any());
        verify(logErrores).logearError(anyInt(), anyString());
    }
}