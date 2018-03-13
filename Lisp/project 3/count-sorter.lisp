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

(defun is-almost-sorted (lst)
  (cond ((null lst)        nil)
        (())

  )
)

(defun count-inversions (lst)
  (cond ((null lst)       0)
        (())
  )
)

;;  test plan for adder:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; empy list  (count-inversions '())          0
;;            (is-almost-sorted '()))        nil
;; single element  (is-almost-sorted '(4))   nil
;;                 (count-inversions '(4))    0
;; is sorted   (is-almost-sorted  '(1 2 3 4)) nil
;; 
