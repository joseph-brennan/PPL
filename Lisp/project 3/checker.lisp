;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  11.	Expression syntax checker:  A function which checks the syntax of a
;;              (possibly nested) list of expressions with numeric operands
;;              and binary infix operators (the operators are the actual words):
;;              plus, minus, times, dividedby.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. no nested lists
;;       2. all list elements are integers
;;       3. list sum will not exceed maxint

(defun checker (lst)
  (cond
  )
)

;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------

;; Examples of top-level function:
; (checker  '(7 plus 11))  ==>  T			(true, valid)
; (checker  '(25 minus (17 times 12)))  ==>  T		(true, valid)
; (checker  '(-4 plus))  ==>  nil				(wrong number of operands)
; (checker  '(-4 plus (cat minus dog)))  ==>  nil	(operands not numeric)
; (checker  '((7 + 3) minus 12))  ==>  nil	    	(invalid operator “+”)
; (checker  '(-4 plus (cat minus dog)))  ==>  nil   	(operands not numeric)
