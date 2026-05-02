// ProcesoBancarioOrquestador.java
@Service
public class ProcesoBancarioOrquestador {

    private final ProcesoBancarioMotor procesoBancarioMotor;
    private final TransaccionRepository transaccionRepository;
    private final CuentaRepository cuentaRepository;
    private final Logger logger;

    @Autowired
    public ProcesoBancarioOrquestador(ProcesoBancarioMotor procesoBancarioMotor,
                                      TransaccionRepository transaccionRepository,
                                      CuentaRepository cuentaRepository,
                                      Logger logger) {
        this.procesoBancarioMotor = procesoBancarioMotor;
        this.transaccionRepository = transaccionRepository;
        this.cuentaRepository = cuentaRepository;
        this.logger = logger;
    }

    public void procesarTransacciones() {
        List<Transaccion> transacciones = transaccionRepository.findAll();
        transacciones.forEach(this::procesarTransaccion);
    }

    private void procesarTransaccion(Transaccion transaccion) {
        try {
            Cuenta cuenta = cuentaRepository.findById(transaccion.getId()).orElseThrow();
            procesoBancarioMotor.validarTransaccion(cuenta, transaccion);
            cuentaRepository.save(cuenta);
        } catch (Exception e) {
            logger.error("Error procesando transacción", e);
            // Dependencia 4: Log de Errores Bancarios
            logError(transaccion.getId(), e.getMessage());
        }
    }

    private void logError(Long id, String mensaje) {
        // Implementación del log de errores
        System.out.println("AUDITORIA: TRANSACCION RECHAZADA - ID: " + id);
        System.out.println("MOTIVO: " + mensaje);
    }
}