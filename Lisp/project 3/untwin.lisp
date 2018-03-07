;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  9.	Untwin:  Receives a list which may have paired (equal) elements,
;;               and removes one of each pair.
;;               Pairs are defined as adjacent equal values
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The list is not nested,
;;          no more than two identical elements will be adjacent.

(defun Untwin)

;;  test plan for untwin:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
