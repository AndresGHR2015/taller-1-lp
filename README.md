# Taller 1: Lenguajes de Programación

## Descripción
Este programa, desarrollado en **Racket**, consiste en una aplicación interactiva por consola orientada al procesamiento de cadenas de texto aplicando principios del paradigma funcional. 

El sistema valida que la entrada del usuario no contenga caracteres numericos, gestionando los flujos de error (en este caso contener numeros) mediante el uso de excepciones personalizadas. El ciclo de ejecución se mantiene activo de forma continua y tolerante a fallos hasta recibir una instrucción explícita de finalización.

## Estructura de Archivos
```text
taller-1-lp/
├── src/
│   ├── main.rkt      
│   └── excepcion.rkt 
└── README.md
```

* `src/main.rkt`: Módulo principal. Orquesta el bucle de ejecución, gestiona la entrada/salida estándar (I/O) y contiene el bloque manejador de excepciones.
* `src/excepcion.rkt`: Módulo de utilidad. Define la estructura de la excepción personalizada y aloja la lógica de la función validadora de caracteres.

## Requisitos y Ejecución
* **Entorno:** Racket (Se recomienda el uso del IDE DrRacket).

**Instrucciones de uso:**
1. Ejecutar el archivo `src/main.rkt`.
2. Al iniciar, el sistema desplegará las siguientes instrucciones por consola:
   > Holaaa, diremos lo que escribiste pero no puedes escribir numeros

   > Si escribes numeros el programa tirara una excepcion personalizada

   > Si quieres terminar el codigo, escribe 'xao'
3. Ingresar las cadenas de texto según lo solicitado.

## Matriz de Entradas y Comportamiento del Sistema
El programa evalúa activamente cada línea proporcionada por el usuario, reaccionando según los siguientes escenarios de entrada:

* **Texto válido:** El sistema procesa la cadena eliminando los espacios en blanco de los extremos mediante `string-trim` y retorna el resultado concatenado (Ejemplo de salida: `aloo tu escribiste: [texto]`).
* **Texto con números:** La validación detecta el tipo de dato incorrecto, interrumpiendo el flujo secuencial para levantar la excepción personalizada. El error es notificado en consola y el sistema reanuda la solicitud de entrada sin finalizar el proceso.
* **Símbolos o caracteres especiales (ej. `@#$`):** Dado que la validación se centra en restringir valores numéricos, los símbolos son omitidos por la restricción y se imprimen en la respuesta estándar.
* **Entradas vacías o compuestas por espacios:** La función `string-trim` normaliza la entrada devolviendo una cadena vacía, entregando la respuesta estándar sin generar inestabilidad en el ciclo.
* **Comando de salida explícito:** Mediante la función `string-ci=?`, el sistema detecta la palabra clave `"xao"` (insensible a mayúsculas/minúsculas), finalizando limpiamente el bucle de ejecución.
* **Interrupción del flujo (EOF):** El sistema implementa `eof-object?` para capturar señales de fin de archivo (como `Ctrl+D`), permitiendo un cierre seguro sin colapsar el entorno de ejecución.

## Detalle de la Excepción Personalizada
Para aislar el error derivado del ingreso de caracteres numéricos y evitar la finalización abrupta del script, se implementó un manejo de errores basado en la siguiente estructura:

* **Nombre de la estructura:** `exn:fail:numero?`
* **Gatillo lógico:** La excepción es invocada explícitamente en la función `validar-entrada` cuando la iteración sobre los caracteres de la cadena retorna `#t` al ser evaluada por la función primitiva `char-numeric?`.
* **Componentes:** Hereda de la estructura base `exn:fail` de Racket. Incorpora un atributo adicional (`input`) diseñado para almacenar y exponer la cadena de texto exacta que provocó la falla.
* **Funcionamiento:** Dentro del archivo principal, la validación se ejecuta encapsulada en un formulario `with-handlers` acoplado al `let loop`. Al capturar el error, el manejador extrae el valor conflictivo mediante `exn:fail:numero-input`, imprime el reporte en consola y delega la continuidad invocando nuevamente a `(loop)`.
* **Objetivo:** Implementar un patrón de diseño tolerante a fallos que aisle discrepancias de tipado, proveyendo retroalimentación inmediata al usuario y garantizando la persistencia de la interfaz por terminal.