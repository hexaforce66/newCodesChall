public class DemoBanco {
    private String numeroTarjeta;
    private String cuentaBancaria;
    private String rfcCliente;
    private double montoTransaccion;
    private double limiteDiario;
    private String respuesta;

    public DemoBanco() {
        this.numeroTarjeta = "";
        this.cuentaBancaria = "";
        this.rfcCliente = "";
        this.montoTransaccion = 0.0;
        this.limiteDiario = 10000.00;
        this.respuesta = "";
    }

    public void iniciar() {
        System.out.println("Introduce el número de tarjeta:");
        this.numeroTarjeta = leerEntrada();
        System.out.println("Introduce la cuenta bancaria:");
        this.cuentaBancaria = leerEntrada();
        System.out.println("Introduce el RFC del cliente:");
        this.rfcCliente = leerEntrada();
        System.out.println("Introduce el monto de la transacción:");
        this.montoTransaccion = leerDouble();

        if (this.montoTransaccion > this.limiteDiario) {
            this.respuesta = "Transacción rechazada: excede límite diario";
        } else {
            this.respuesta = "Transacción aprobada";
        }

        System.out.println(this.respuesta);
    }

    private String leerEntrada() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }

    private double leerDouble() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextDouble();
    }

    public static void main(String[] args) {
        DemoBanco demoBanco = new DemoBanco();
        demoBanco.iniciar();
    }
}