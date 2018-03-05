;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  6.	Enforce an upper limit: A function that receives a number
;;                          (an upper limit) and a list. The list may have
;;                          nested lists. The function produces a new list in
;;                          which all values originally over the limit are
;;                          replaced by the limit.

;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The limit will be a number.

  < Lisp code here >

;;  test plan for adder:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
