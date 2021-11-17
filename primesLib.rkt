#lang typed/racket

; Export Funtions
(provide get-primes generate-sequence Naturals)

;;------------------------------------------------------
;;  Public functions and Types
;
(define-type Naturals (Listof Natural))

;; Get a List of Primes from the Sequence
;
(: get-primes : Naturals -> Naturals)
(define (get-primes nums)
  (get-primes-aux nums (list)))


;; Create sequence
;
(: generate-sequence : Natural -> Naturals)
(define (generate-sequence num)
  (let (                            ; Local variables
        [ONE : Natural 1]
        [TWO : Natural 2]
        )
    (range TWO (+ ONE num))
    )
  )

  
;;------------------------------------------------------
;;  Private functions
;

;; Helper function to Get Primes
;
(: get-primes-aux : Naturals Naturals -> Naturals )
(define (get-primes-aux lst rst)
   (if (null? lst)
       rst
       (get-primes-aux (remove-factors lst)  (add-prime lst rst ))))

;; remove all divisibles from the sequence
;
(: remove-factors : Naturals -> Naturals )
(define (remove-factors lst)
  (filter
   (λ ([n : Natural])
     (positive? (modulo n (car lst)))) lst))

;; Add a prime number to the List
;
(: add-prime : Naturals Naturals -> Naturals )
(define (add-prime lst rst)
  (append rst (list (car lst))))