# taller-1-lp
##  Descripción

Este programa desarrollado en **Racket** permite al usuario ingresar texto por consola y devuelve un mensaje con la entrada procesada.

El sistema valida que la entrada contenga **solo letras**.
Si el usuario ingresa números, se lanza una **excepción personalizada** sin detener la ejecución del programa.

El programa se ejecuta en un ciclo continuo hasta que el usuario escribe `"xao"` o se detecta fin de archivo.
## Requisitos

* Tener instalado **Racket**
* Editor recomendado: **DrRacket**
---

## Ejecución

1. Abrir el archivo `main.rkt`
2. Ejecutar el programa
3. Ingresar texto cuando se solicite

---

## Uso del Programa

Al iniciar, se mostrarán instrucciones:

```
Holaaa, diremos lo que escribiste pero solo letras
Si escribes numeros el programa tirara una excepcion personalizada
Si quieres terminar el codigo, escribe 'xao'
```

Luego podrás ingresar texto:

```
Ingresa un texto: hola
Resultado: aloo tu escribiste: hola
```


 # Dependencias
(require "excepcion.rkt")

Se importa el archivo excepcion.rkt, que contiene:

La función validar-entrada
La excepción personalizada exn: fail: numero?

##  Funcionalidades

* Lectura de texto desde consola
* Valida la entrada usando validar-entrada.
* Validación de entrada (solo letras)
  Si la entrada es válida:
  Elimina espacios en blanco con string-trim.
  Retorna un mensaje concatenado con el texto ingresado.
* Manejo de excepciones personalizadas
* Ejecución en bucle hasta salida del usuario
* Manejo de errores generales
Posibles errores:
Si contiene números → lanza una excepción personalizada.

* Función: procesar →  (define (procesar entrada) → (validar-entrada entrada) → (string-append "aloo tu escribiste: " (string-trim entrada)))

* Función:  main → (define (main) → Funcionalidad general → Controla la ejecución del programa e interacción con el usuario.

### Mensajes iniciales
(displayln "Holaaa, diremos lo que escribiste pero solo letras")
(displayln "Si escribes numeros el programa tirara una excepcion personalizada")
(displayln "Si quieres terminar el codigo, escribe 'xao'")

Se muestran instrucciones al usuario.

## Bucle principal (loop)
### Repetición del ciclo
(loop)

El programa vuelve a pedir entrada indefinidamente hasta que el usuario salga.
* Ejecución del programa
(main)

Se inicia la ejecución llamando a la función principal.
(let loop ()

Se crea un bucle recursivo que:

Solicita entrada al usuario
Procesa el texto
Maneja errores
Se repite hasta que el usuario decida salir

### Lectura de entrada

(display "Ingresa un texto: ")
(flush-output)
(define entrada (read-line))
Muestra el prompt
Lee una línea desde la consola

##  Manejo de Errores

Excepción personalizada

Si el usuario ingresa números:

```
Ingresa un texto: hola123
[Excepcion personalizada] Error: solo se permiten letras
Entrada recibida: hola123
```

El programa continúa ejecutándose.

---

### Error general

Cualquier otro error es capturado para evitar que el programa se cierre inesperadamente.

---

## Finalización

El programa termina cuando el usuario escribe:

```
xao
```

o cuando se detecta fin de archivo.

---

##  Conceptos Aplicados

* Programación funcional
* Manejo de excepciones en Racket
* Recursividad (bucle con `let loop`)
* Validación de entrada
* Separación de responsabilidades (módulos)


---
##  Posibles mejoras

* Permitir más tipos de validación (símbolos, espacios, etc.)
* Interfaz gráfica
* Historial de entradas del usuario
* Tests automatizados

---
