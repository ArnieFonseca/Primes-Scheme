#lang typed/racket

(require "primesLib.rkt")

;; Constant
;
(: LIMIT Natural)
(define LIMIT 20)

(: ORIG-MSG : String)
(define ORIG-MSG  "~nDisplay Original List: ~n ~A ~n")

(: PRIMES-MSG : String)
(define PRIMES-MSG  "~nDisplay Primes List: ~n ~A ~n")

;-----------------------------------
;; Define the Sequence
;
(: numbers Naturals )
(define numbers(generate-sequence LIMIT))


;-----------------------------------
;; Main program
;
(: main : -> Void)
(define (main)
  (define primes (get-primes numbers))

  (printf ORIG-MSG numbers) 
  (printf PRIMES-MSG primes)  
  )

(main)
