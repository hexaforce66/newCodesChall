// ProcesoBancarioMotor.java
@Service
public class ProcesoBancarioMotor {

    public void validarTransaccion(Cuenta cuenta, Transaccion transaccion) {
        if (transaccion.getMonto() > 0) {
            cuenta.setSaldo(cuenta.getSaldo() + transaccion.getMonto());
        } else {
            throw new BusinessException("Monto de transacción inválido");
        }
    }
}