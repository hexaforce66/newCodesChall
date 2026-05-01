// MotorReglas.java
@Service
public class MotorReglas {
    
    public ResultadoValidacion validar(Transaccion transaccion, Cuenta cuenta) {
        if (transaccion.getMonto() > 0) {
            double nuevoSaldo = cuenta.getSaldo() + transaccion.getMonto();
            return new ResultadoValidacion(true, nuevoSaldo, "OK");
        } else {
            return new ResultadoValidacion(false, 0, "ER");
        }
    }
}