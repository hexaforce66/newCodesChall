// OrquestadorTest.java
@ExtendWith(MockitoExtension.class)
public class OrquestadorTest {
    
    @Mock
    private MotorReglas motorReglas;
    
    @Mock
    private RepositorioCuentas repositorioCuentas;
    
    @Mock
    private Logger logger;
    
    @InjectMocks
    private Orquestador orquestador;
    
    @Test
    public void testProcesarTransaccionValida() {
        // Configuración
        Transaccion transaccion = new Transaccion(1L, 100.0);
        Cuenta cuenta = new Cuenta(1L, 1000.0);
        ResultadoValidacion resultadoValidacion = new ResultadoValidacion(true, 1100.0, "OK");
        
        // Mockear llamadas
        when(repositorioCuentas.findById(transaccion.getId())).thenReturn(cuenta);
        when(motorReglas.validar(transaccion, cuenta)).thenReturn(resultadoValidacion);
        
        // Ejecutar método
        orquestador.procesarTransaccion(transaccion);
        
        // Verificar llamadas
        verify(repositorioCuentas, times(1)).findById(transaccion.getId());
        verify(motorReglas, times(1)).validar(transaccion, cuenta);
        verify(repositorioCuentas, times(1)).actualizarSaldo(transaccion.getId(), resultadoValidacion.getNuevoSaldo());
    }
    
    @Test
    public void testProcesarTransaccionInvalida() {
        // Configuración
        Transaccion transaccion = new Transaccion(1L, -100.0);
        Cuenta cuenta = new Cuenta(1L, 1000.0);
        ResultadoValidacion resultadoValidacion = new ResultadoValidacion(false, 0, "ER");
        
        // Mockear llamadas
        when(repositorioCuentas.findById(transaccion.getId())).thenReturn(cuenta);
        when(motorReglas.validar(transaccion, cuenta)).thenReturn(resultadoValidacion);
        
        // Ejecutar método
        orquestador.procesarTransaccion(transaccion);
        
        // Verificar llamadas
        verify(repositorioCuentas, times(1)).findById(transaccion.getId());
        verify(motorReglas, times(1)).validar(transaccion, cuenta);
        verify(logger, times(1)).logError(transaccion.getId(), resultadoValidacion.getCodigoError());
    }
}