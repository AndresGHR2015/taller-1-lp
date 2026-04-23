#lang racket

(provide exn:fail:numero
         exn:fail:numero?
         exn:fail:numero-input
         validar-entrada)     ;exportamo todo esto pa afuera

(struct exn:fail:numero exn:fail (input)) ;definimos nuestro nuevo error 
                                                        ;el cual hereda d exn:fail

(define (contiene-numeros? s)
  (for/or ([ch (in-string s)])    ;todo true si al menos uno es true
    (char-numeric? ch)))      ;verifica todos los elementos del string

(define (validar-entrada entrada)
  (when (contiene-numeros? entrada)
    (raise                            ;devolvemos excepcion si contiene numero
     (exn:fail:numero
      "Entrada invalida: se recibieron numeros en el string"
      (current-continuation-marks)    
      entrada))))
