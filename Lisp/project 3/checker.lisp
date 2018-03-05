;;  Joey Brennan – CS 3210 – Fall 2016
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

  < Lisp code here >

;;  test plan for adder:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
