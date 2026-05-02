// LogErrores.java
@Service
public class LogErrores {

    public void logearError(int id, String codigoError) {
        System.out.println("AUDITORIA: TRANSACCION RECHAZADA - ID: " + id);
        System.out.println("MOTIVO: " + codigoError);
    }
}