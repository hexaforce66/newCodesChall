# Características
## Flujo feliz
### Escenario: Proceso de transacciones exitoso
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene una transacción válida
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $1200.00

## Casos de borde (valores mínimos/máximos)
### Escenario: Transacción con monto mínimo
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene una transacción con monto mínimo de $0.01
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $1000.01

### Escenario: Transacción con monto máximo
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene una transacción con monto máximo de $9999999.99
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $10000000.99

## Casos de error (datos inválidos)
### Escenario: Archivo de transacciones no existe
Dado que el archivo de transacciones "transacciones.txt" no existe
Cuando se ejecuta el proceso de transacciones
Entonces se produce un error de archivo no encontrado

### Escenario: Transacción con monto inválido
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene una transacción con monto inválido de "-$100.00"
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces se produce un error de monto inválido

### Escenario: Cuenta no existe
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene una transacción válida
Y la cuenta con ID "12345" no existe
Cuando se ejecuta el proceso de transacciones
Entonces se produce un error de cuenta no encontrada

## Escenarios de negocio complejos
### Escenario: Proceso de transacciones con múltiples transacciones
Dado que el archivo de transacciones "transacciones.txt" existe
Y el archivo contiene múltiples transacciones válidas
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $1500.00

### Escenario: Proceso de transacciones con transacciones concurrentes
Dado que el archivo de transacciones "transacciones.txt" existe
Y múltiples transacciones válidas se procesan concurrentemente
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $1200.00

Ejemplos:
| ID | Monto |
| --- | --- |
| 12345 | $100.00 |
| 67890 | $200.00 |
| 34567 | $300.00 |

### Escenario: Proceso de transacciones con transacciones en lotes
Dado que el archivo de transacciones "transacciones.txt" existe
Y múltiples transacciones válidas se procesan en lotes
Y la cuenta con ID "12345" tiene un saldo inicial de $1000.00
Cuando se ejecuta el proceso de transacciones
Entonces el saldo final de la cuenta con ID "12345" es de $1500.00

Ejemplos:
| ID | Monto |
| --- | --- |
| 12345 | $100.00 |
| 67890 | $200.00 |
| 34567 | $300.00 |
| 90123 | $400.00 |
| 45678 | $500.00 |