Claro, aquí tienes el código Java moderno y puro que realiza la misma función que el programa COBOL proporcionado:

```java
import java.util.Scanner;

public class DemoBanco {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Introduce el número de tarjeta: ");
        String numeroTarjeta = scanner.nextLine();

        System.out.print("Introduce la cuenta bancaria: ");
        String cuentaBancaria = scanner.nextLine();

        System.out.print("Introduce el RFC del cliente: ");
        String rfcCliente = scanner.nextLine();

        System.out.print("Introduce el monto de la transacción: ");
        double montoTransaccion = scanner.nextDouble();
        scanner.nextLine(); // Consume newline left-over

        double limiteDiario = 10000.00;

        String respuesta;
        if (montoTransaccion > limiteDiario) {
            respuesta = "Transacción rechazada: excede límite diario";
        } else {
            respuesta = "Transacción aprobada";
        }

        System.out.println(respuesta);
    }
}
```

Este código Java utiliza la clase `Scanner` para leer la entrada del usuario y realiza la misma lógica de negocio que el programa COBOL original. La principal diferencia es que en Java, no es necesario especificar el tamaño de los campos como se hace en COBOL, y se utilizan tipos de datos más modernos y seguros. Además, el manejo de la entrada y salida es más flexible y poderoso en Java.