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
  (cond ((null lst)  t)
        (t          (cons (car lst) (cons (car lst) (untwin (cdr (cdr lst))))))
  )
)

;;  test plan for untwin:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(untwin '(a a b b c c))

(untwin '(1 1 2 3 3))
