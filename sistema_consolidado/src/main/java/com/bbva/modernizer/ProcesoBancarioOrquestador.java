// ProcesoBancarioOrquestador.java
@Service
public class ProcesoBancarioOrquestador {

    @Autowired
    private MotorReglas motorReglas;

    @Autowired
    private ConsultaSaldo consultaSaldo;

    @Autowired
    private ActualizacionSaldo actualizacionSaldo;

    @Autowired
    private LogErrores logErrores;

    public void procesarTransacciones(File archivoTransacciones) {
        try (BufferedReader reader = new BufferedReader(new FileReader(archivoTransacciones))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                String[] campos = linea.split(",");
                int id = Integer.parseInt(campos[0]);
                BigDecimal monto = new BigDecimal(campos[1]);

                // Consulta de Saldo
                BigDecimal saldoActual = consultaSaldo.consultarSaldo(id);

                // Validación de Motor de Reglas
                ResultadoTransaccion resultado = motorReglas.validarTransaccion(saldoActual, monto);

                if (resultado.esExitosa()) {
                    // Persistencia de Actualización
                    actualizacionSaldo.actualizarSaldo(id, resultado.getNuevoSaldo());
                } else {
                    // Log de Errores Bancarios
                    logErrores.logearError(id, resultado.getCodigoError());
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Error al procesar transacciones", e);
        }
    }
}