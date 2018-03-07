;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  5.	Sort by recency: Takes a word and a list of words.
;;                 If the word is not in the list, it is added at the beginning
;;                 of the list. If the word is in the list, its position is
;;                 changed to be first in the list. In both cases, the word
;;                 most recently added is now at the front of the list.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The incoming list has no duplicates.

(defun make-recent)

;;  test plan for make recent:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
