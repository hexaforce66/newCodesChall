// Orquestador.java
@Service
public class Orquestador {
    
    @Autowired
    private MotorReglas motorReglas;
    
    @Autowired
    private RepositorioCuentas repositorioCuentas;
    
    @Autowired
    private Logger logger;
    
    public void procesarTransaccion(Transaccion transaccion) {
        try {
            // Consulta de Saldo en DB
            Cuenta cuenta = repositorioCuentas.findById(transaccion.getId()).orElseThrow();
            
            // Validación de Motor de Reglas
            ResultadoValidacion resultado = motorReglas.validar(transaccion, cuenta);
            
            if (resultado.esValido()) {
                // Persistencia de Actualización
                repositorioCuentas.actualizarSaldo(transaccion.getId(), resultado.getNuevoSaldo());
            } else {
                // Log de Errores Bancarios
                logger.logError(transaccion.getId(), resultado.getCodigoError());
            }
        } catch (Exception e) {
            // Manejo de errores
            logger.logError(transaccion.getId(), "ER");
        }
    }
}