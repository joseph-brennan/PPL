;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  4. Count groups:  Given a list, count the number of groups
;;                   (a group is two or more identical adjacent items).
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. the list contains no nested lists

(defun count-clumps)

;;  test plan for count groups:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
