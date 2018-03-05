;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  10.	Flatten: Receives a list of arbitrary depth, and returns a list
;;               containing all the same elements, in the same order, but now
;;               at the top level.
;;             Note that flattening an embedded NIL removes it.
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
