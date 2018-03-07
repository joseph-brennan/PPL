;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;; 3.	Remove negatives: A function that receives a list of integers
;;                      and returns a list with all negative values removed.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. no nested lists
;;       2. all list elements are integers
;;       3. list sum will not exceed maxint

(defun remove-negative)

;;  test plan for remove negative:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
