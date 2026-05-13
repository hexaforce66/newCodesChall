Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG están configurados correctamente

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Caso de error - pago rechazado por error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene un pago con error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Validación de cliente - cliente bloqueado
    Dado que el archivo de entrada de pagos diarios contiene un pago de un cliente bloqueado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Validación de cuenta - cuenta bloqueada
    Dado que el archivo de entrada de pagos diarios contiene un pago de una cuenta bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Validación de riesgo - pago rechazado por riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría correspondiente

  Escenario: Procesamiento de varios pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene todos los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría correspondientes

  Escenario: Procesamiento de pagos con errores
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene todos los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría correspondientes

  Escenario: Procesamiento de pagos con validaciones de cliente y cuenta
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con validaciones de cliente y cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene todos los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.REJECTED contiene todos los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría correspondientes

  Escenario: Procesamiento de pagos con validaciones de riesgo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con validaciones de riesgo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene todos los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.REJECTED contiene todos los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría correspondientes

  Escenario: Procesamiento de pagos con varios archivos de entrada
    Dado que se proporcionan varios archivos de entrada de pagos diarios
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene todos los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.REJECTED contiene todos los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida
    Dado que se proporcionan varios archivos de salida para pagos aprobados, rechazados y auditoría
    Cuando se ejecuta el programa PAYMAIN
    Entonces los archivos de salida correspondientes contienen los pagos aprobados, rechazados y registros de auditoría

  Escenario: Procesamiento de pagos con errores de archivo
    Dado que se produce un error al leer o escribir un archivo de entrada o salida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error y se registra en el archivo de salida BBVA.PAYMENTS.AUDIT.LOG

  Escenario: Procesamiento de pagos con errores de validación
    Dado que se produce un error durante la validación de un pago
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error y se registra en el archivo de salida BBVA.PAYMENTS.AUDIT.LOG

  Escenario: Procesamiento de pagos con errores de riesgo
    Dado que se produce un error durante la evaluación del riesgo de un pago
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error y se registra en el archivo de salida BBVA.PAYMENTS.AUDIT.LOG

  Escenario: Procesamiento de pagos con varios programas
    Dado que se proporcionan varios programas para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se procesan los pagos según las reglas definidas en cada programa

  Escenario: Procesamiento de pagos con varios parámetros
    Dado que se proporcionan varios parámetros para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se procesan los pagos según los parámetros definidos

  Escenario: Procesamiento de pagos con varios archivos de configuración
    Dado que se proporcionan varios archivos de configuración para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se procesan los pagos según las reglas definidas en cada archivo de configuración

  Escenario: Procesamiento de pagos con varios archivos de datos
    Dado que se proporcionan varios archivos de datos para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se procesan los pagos según las reglas definidas en cada archivo de datos

  Escenario: Procesamiento de pagos con varios archivos de salida de auditoría
    Dado que se proporcionan varios archivos de salida de auditoría para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los pagos en los archivos de salida de auditoría correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de errores
    Dado que se proporcionan varios archivos de salida de errores para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los errores en los archivos de salida de errores correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de resumen
    Dado que se proporcionan varios archivos de salida de resumen para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los resúmenes en los archivos de salida de resumen correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de estadísticas
    Dado que se proporcionan varios archivos de salida de estadísticas para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran las estadísticas en los archivos de salida de estadísticas correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de informes
    Dado que se proporcionan varios archivos de salida de informes para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los informes en los archivos de salida de informes correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos
    Dado que se proporcionan varios archivos de salida de gráficos para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos en los archivos de salida de gráficos correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de mapas
    Dado que se proporcionan varios archivos de salida de mapas para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los mapas en los archivos de salida de mapas correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de tablas
    Dado que se proporcionan varios archivos de salida de tablas para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran las tablas en los archivos de salida de tablas correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de barras
    Dado que se proporcionan varios archivos de salida de gráficos de barras para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de barras en los archivos de salida de gráficos de barras correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de líneas
    Dado que se proporcionan varios archivos de salida de gráficos de líneas para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de líneas en los archivos de salida de gráficos de líneas correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de pastel
    Dado que se proporcionan varios archivos de salida de gráficos de pastel para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de pastel en los archivos de salida de gráficos de pastel correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de dispersión
    Dado que se proporcionan varios archivos de salida de gráficos de dispersión para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de dispersión en los archivos de salida de gráficos de dispersión correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de radar
    Dado que se proporcionan varios archivos de salida de gráficos de radar para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de radar en los archivos de salida de gráficos de radar correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de violín
    Dado que se proporcionan varios archivos de salida de gráficos de violín para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de violín en los archivos de salida de gráficos de violín correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de caja
    Dado que se proporcionan varios archivos de salida de gráficos de caja para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de caja en los archivos de salida de gráficos de caja correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de histograma
    Dado que se proporcionan varios archivos de salida de gráficos de histograma para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de histograma en los archivos de salida de gráficos de histograma correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de densidad
    Dado que se proporcionan varios archivos de salida de gráficos de densidad para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de densidad en los archivos de salida de gráficos de densidad correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de dispersión 3D
    Dado que se proporcionan varios archivos de salida de gráficos de dispersión 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de dispersión 3D en los archivos de salida de gráficos de dispersión 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de superficie 3D
    Dado que se proporcionan varios archivos de salida de gráficos de superficie 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de superficie 3D en los archivos de salida de gráficos de superficie 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de volumen 3D
    Dado que se proporcionan varios archivos de salida de gráficos de volumen 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de volumen 3D en los archivos de salida de gráficos de volumen 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de malla 3D
    Dado que se proporcionan varios archivos de salida de gráficos de malla 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de malla 3D en los archivos de salida de gráficos de malla 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de nube de puntos 3D
    Dado que se proporcionan varios archivos de salida de gráficos de nube de puntos 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de nube de puntos 3D en los archivos de salida de gráficos de nube de puntos 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de tubería 3D
    Dado que se proporcionan varios archivos de salida de gráficos de tubería 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de tubería 3D en los archivos de salida de gráficos de tubería 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de esfera 3D
    Dado que se proporcionan varios archivos de salida de gráficos de esfera 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de esfera 3D en los archivos de salida de gráficos de esfera 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de cilindro 3D
    Dado que se proporcionan varios archivos de salida de gráficos de cilindro 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de cilindro 3D en los archivos de salida de gráficos de cilindro 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de cono 3D
    Dado que se proporcionan varios archivos de salida de gráficos de cono 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de cono 3D en los archivos de salida de gráficos de cono 3D correspondientes

  Escenario: Procesamiento de pagos con varios archivos de salida de gráficos de pirámide 3D
    Dado que se proporcionan varios archivos de salida de gráficos de pirámide 3D para procesar pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se registran los gráficos de pirámide 3D en los archivos de salida de gráficos de pirámide 3D correspondientes

  Escenario: Procesamiento de