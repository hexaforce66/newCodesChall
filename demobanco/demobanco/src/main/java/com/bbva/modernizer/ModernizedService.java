import java.util.Scanner;
public record Transaccion(
    long numeroTarjeta,
    long cuentaBancaria,
    String rfcCliente,
    double montoTransaccion
) {
}
public class DemoBanco {
    private String mask(String value) {
        if (value == null) return null;
        int len = value.length();
        if (len <= 4) return "****";
        return "****" + value.substring(len - 4);
    }

    private static final double LIMITE_DIARIO = 10000.00;
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        long numeroTarjeta = scanner.nextLong();
        long cuentaBancaria = scanner.nextLong();
        String rfcCliente = scanner.next();
        double montoTransaccion = scanner.nextDouble();
        Transaccion transaccion = new Transaccion(numeroTarjeta, cuentaBancaria, rfcCliente, montoTransaccion);
        String respuesta = procesarTransaccion(transaccion);
        System.out.println(mask()respuesta);
    }
    public static String procesarTransaccion(Transaccion transaccion) {
        if (transaccion.montoTransaccion > LIMITE_DIARIO) {
        } else {
        }
    }
}