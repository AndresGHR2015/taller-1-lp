#lang racket

(require "excepcion.rkt")         ;definimos que este archivo importara la excepcion 

(define (procesar entrada)        ;definimos una funcion que validara cn nuestra excepcion la entrada
  (validar-entrada entrada)       
  (string-append "aloo tu escribiste: " (string-trim entrada)))

(define (main)                    ;aca inicimos cn el main
  (displayln "Holaaa, diremos lo que escribiste pero no puedes escribir numeros")
  (displayln "Si escribes numeros el programa tirara una excepcion personalizada")
  (displayln "Si quieres terminar el codigo, escribe 'xao'")
  (newline)
  (let loop ()                    ;establecemos un ciclo que no parara hasta que le digamos xao
    (display "Ingresa un texto: ")
    (flush-output)
    (define entrada (read-line))  
    (cond                 
      [(or (eof-object? entrada) (string-ci=? entrada "xao"))     ;si es EndOfFile o xao
       (displayln "Fin del programa")]        ;si es el caso, fin del programa
      [else
       (with-handlers ([exn:fail:numero?      ;si no es xao, aca capturaremos la excepcion sin botar el codigo
                        (lambda (e)           
                          (printf "[Excepcion personalizada] ~a~n" (exn-message e))
                            (printf "Entrada recibida: ~a~n" (exn:fail:numero-input e))
                          (loop))]            ;vuelve a pedir un elemento con el loop
                       [exn:fail?             ;aca en caso hubiera otro error (ma que nada humano)
                        (lambda (e)
                            (printf "[Error general] ~a~n" (exn-message e))
                          (loop))])           ;vuelve a pedir un elemento con el loop
         (define resultado (procesar entrada))      ;aca recien validamos la entrada con la funcion
                (printf "Resultado: ~a~n" resultado)    ;si no se devuelve al fail, aca imprimimos
         (loop))])))                                ;seguimos con el loop aca

(main)
