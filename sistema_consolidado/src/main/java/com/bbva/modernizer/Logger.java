// Logger.java
@Service
public class Logger {
    
    public void logError(Long id, String codigoError) {
        System.out.println("AUDITORIA: TRANSACCION RECHAZADA - ID: " + id);
        System.out.println("MOTIVO: " + codigoError);
    }
}