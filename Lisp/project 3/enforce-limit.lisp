;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  6.	Enforce an upper limit: A function that receives a number
;;                          (an upper limit) and a list. The list may have
;;                          nested lists. The function produces a new list in
;;                          which all values originally over the limit are
;;                          replaced by the limit.

;;  parameters:
;;       lst – a list of numbers
;;       num - the upper limit int
;;  assumptions:
;;       1. The limit will be a number.

(defun enforce-limit (num lst)
  (cond ((null lst) nil)
        ;; if its a list
        ((listp (car lst))
         (cons (enforce-limit num (car lst)) (enforce-limit num (cdr lst))))
        ;; else if its a number and its larger then the limit
        ((and (numberp (car lst)) (< num (car lst)))
         ;; replace it with the limit value
         (cons num (enforce-limit num (cdr lst))))
        ;; else its an atom or not greater than limit so keep it
        (t
         (cons (car lst)  (enforce-limit num (cdr lst))))
  )
)

;;  test plan for enforce-limit:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;;only one change (enforce-limit 5 '(1 23 2 4 5))    (1 5 2 4 5)
;;no chnages      (enforce-limit 1 '(1 2 3 4 5))     (1 2 3 4 5)
;;contains words  (enforce-limit 3 '(cat dog 3 5 8))  (cat dog 3 5 5)
;; nested         (enforce-limit 4 '(1 24  5 6 () (5 6 7)))

; Examples:
; (enforce-limit 5 '(6 2 kitty 5 -16))  ==>  (5 2 kitty 5 -16)
; (enforce-limit 8 '(1 66 2 kitty -16))  ==>  (1 8 2 kitty -16)
; (enforce-limit 33 '((20 (35 9) 7 100 2 () 2)))  ==>  (20 (33 9) 7 33 2 () 2)
