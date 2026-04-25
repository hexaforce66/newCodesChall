Claro, aquí tienes el código Java moderno, limpio y funcional que realiza la misma función que el código COBOL proporcionado:

```java
import java.util.Scanner;

public class Banco {
    private static final double LIMITE_DIARIO = 10000.00;

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
        scanner.close();

        String respuesta = procesarTransaccion(montoTransaccion);

        System.out.println(respuesta);
    }

    private static String procesarTransaccion(double montoTransaccion) {
        if (montoTransaccion > LIMITE_DIARIO) {
            return "Transacción rechazada: excede límite diario";
        } else {
            return "Transacción aprobada";
        }
    }
}
```

Este código Java utiliza una clase llamada `Banco` con un método `main` que solicita al usuario ingresar el número de tarjeta, la cuenta bancaria, el RFC del cliente y el monto de la transacción. Luego, llama al método `procesarTransaccion` para determinar si la transacción es aprobada o rechazada según el límite diario establecido. Finalmente, imprime la respuesta en la consola.