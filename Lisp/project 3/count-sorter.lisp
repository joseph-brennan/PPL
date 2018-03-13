;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  7.	Almost sorted: A function that receives a list of numbers and returns
;;            true or nil for whether the list is almost sorted in ascending
;;            order. An almost sorted list is one in which the number of
;;            inversions is 0.2n or less
;;            (n being the number of elements in the list).
;;            An inversion is a pair of adjacent values in the wrong order.
;;            Completely sorted lists (no inversions) are considered to not
;;            be almost sorted. Wite a separate function to count inversions.
;;
;;   Lisp note: arithmetic computations are done with integers, unless at
;;   least one operand is real; integer division produces a rational number.
;;
;;   parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The list contains no duplicates.

(defun is-almost-sorted (lst)
  (cond ((null lst)                                         nil)
        ;; list is perfectly sorted
        ((= (count-inversions lst) 0)                       nil)

        ;; compare length to number of inversions
        ((< (count-inversions lst) (* 0.2 (length lst)))   t)

        ;; falls outside being almost sorted
        (t                                                  nil)
  )
)

(defun count-inversions (lst)
  (cond ((null lst)                      0)
        ;; else if it contains only one element
        ((not (car (cdr lst)))           0)

        ;; else if its properly sorted
        ((< (car lst) (car (cdr lst)))  (count-inversions (cdr lst)))

        ;; else its not sorted so increase count
        (t                              (+ 1 (count-inversions (cdr lst))))
  )
)

;;  test plan for adder:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; empy list         (count-inversions '())              0
;;                   (is-almost-sorted '())             nil

;; single element    (is-almost-sorted '(9))            nil
;;                   (count-inversions '(7))             0

;; is sorted         (is-almost-sorted  '(1 2 3 4))     nil
;; off by one        (is-almost-sorted  '(1 3 2 4 6))    t

;;                   (count-inversions '(1 2 3 5 4 6))   1

;; off by two        (is-almost-sorted '(2 1 3 5 4 8))   nil
;;                   (count-inversions  '(2 1 3 5 4 8))  2

;; Examples, inversions:
;;larger list        (count-inversions '(1 2 3 5 4 6 7 8))  ==>  1
;;all wrong          (count-inversions '(5 4 3 2 1))  ==>  4

;;Examples, almost sorted:
;;is sorted          (is-almost-sorted '(11 22 33 44 55))  ==>  nil
;;off by one         (is-almost-sorted '(1 2 4 3 5 6))  ==>  T	(true)
