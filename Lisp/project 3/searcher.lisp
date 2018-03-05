;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  1.	Search.  A function that receives an integer and a list.
;;               The list will have a mix of integers, characters, and words,
;;               and may have nested lists.
;;               The function returns a count of how many times the
;;               integer value is found.
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
