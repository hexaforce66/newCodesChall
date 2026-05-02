// MotorReglas.java
@Service
public class MotorReglas {

    public ResultadoTransaccion validarTransaccion(BigDecimal saldoActual, BigDecimal monto) {
        if (monto.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal nuevoSaldo = saldoActual.add(monto);
            return new ResultadoTransaccion(true, nuevoSaldo, "OK");
        } else {
            return new ResultadoTransaccion(false, null, "ER");
        }
    }
}