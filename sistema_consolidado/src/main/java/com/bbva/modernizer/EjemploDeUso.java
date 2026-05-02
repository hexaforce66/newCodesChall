// EjemploDeUso.java
public class EjemploDeUso {

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(Application.class, args);
        ProcesoBancarioOrquestador orquestador = context.getBean(ProcesoBancarioOrquestador.class);
        orquestador.procesarTransacciones(new File("transacciones.txt"));
    }
}