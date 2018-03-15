;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  9.	Untwin:  Receives a list which may have paired (equal) elements,
;;               and removes one of each pair.
;;               Pairs are defined as adjacent equal values
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The list is not nested,
;;       2.  no more than two identical elements will be adjacent.

(defun Untwin (lst)
  (cond ((null lst)  nil)
        ;; last one in the list is single
        ((not (car (cdr lst)))
         (cons (car lst) (untwin (cdr lst))))

        ;; if there is a twin
        ((equal (car lst) (car (cdr lst)))
         ;; add it to the new list and skip its twin
         (cons (car lst) (untwin (cdr (cdr lst)))))

        ;; else it doesnt have a twin so move on
        (t
         (cons (car lst) (untwin (cdr lst))))
  )
)

;;  test plan for untwin:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; checking letters      (untwin '(a a b b c c))   (a b c)

;; tricky singles        (untwin '(a b b c c))     (a b c)
;;                       (untwin '(a a b c c))     (a b c)
;;                       (untwin '(a a b b c))     (a b c)

;;checking numbers       (untwin '(1 1 2 3 3))     (1 2 3)
;;                       (untwin '(1 2 2 3))       (1 2 3)
;;                       (untwin '(1 2 3))         (1 2 3)
;;                       (untwin '(1 1 2 2 3))     (1 2 3)

;;numbers and atom  (untwin '( 1 2 3 a b c c 2 3 3))        (1 2 3 a b c 2 3 3)
;; atoms & numbers (untwin '(cat cat dog 1 3 3 4 5 5 dog))  (CAT DOG 1 3 4 5 DOG)
