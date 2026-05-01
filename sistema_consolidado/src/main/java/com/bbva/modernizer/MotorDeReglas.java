import org.springframework.stereotype.Component;

@Component
public class MotorDeReglas {

    public void validarYCalcular(AreaIntercambio areaIntercambio) {
        // Regla 1: El monto debe ser positivo
        if (areaIntercambio.getMontoTransaccion() > 0) {
            // Regla 2: No se permite sobregiro (ejemplo)
            if (areaIntercambio.getSaldoActual() + areaIntercambio.getMontoTransaccion() >= 0) {
                areaIntercambio.setNuevoSaldo(areaIntercambio.getSaldoActual() + areaIntercambio.getMontoTransaccion());
                areaIntercambio.setResultado("OK");
            }
        }
    }
}