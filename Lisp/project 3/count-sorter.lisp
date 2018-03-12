;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  7.	Almost sorted: A function that receives a list of numbers and returns
;;              true or nil for whether the list is almost sorted in ascending
;;              order. An almost sorted list is one in which the number of
;;              inversions is 0.2n or less
;;              (n being the number of elements in the list).
;;              An inversion is a pair of adjacent values in the wrong order.
;;              Completely sorted lists (no inversions) are considered to not
;;              be almost sorted. Write a separate function to count inversions.
;;
;;   Lisp note: arithmetic computations are done with integers, unless at
;;      least one operand is real; integer division produces a rational number.
;;
;;   parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The list contains no duplicates.

(defun count-sorter (lst)
  (cond ()

  )
)

;;  test plan for adder:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
    ;;  empty list				( )	   	       0
    ;;  list with 1 element		(6)		       6
    ;;  list sums to zero & duplicates	(-2 1 0 1)	       0
