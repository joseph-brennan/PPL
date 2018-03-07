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

(defun checker)

;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------

(checker '())               ;; empty lists  0

(checker '(5))              ;; single element 5

(checker '(-2 0 1 1))       ;; results 0
