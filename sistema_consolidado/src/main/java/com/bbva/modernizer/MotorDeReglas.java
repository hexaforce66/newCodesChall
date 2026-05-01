import org.springframework.stereotype.Component;

@Component
public class MotorDeReglas {

    public Resultado validarYCalcular(double saldoActual, double montoTransaccion) {
        Resultado resultado = new Resultado();
        if (montoTransaccion > 0) {
            if (saldoActual + montoTransaccion >= 0) {
                double nuevoSaldo = saldoActual + montoTransaccion;
                resultado.setNuevoSaldo(nuevoSaldo);
                resultado.setExitoso(true);
            }
        }
        return resultado;
    }
}