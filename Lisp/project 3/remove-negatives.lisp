;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;; 3.	Remove negatives: A function that receives a list of integers
;;                      and returns a list with all negative values removed.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:


(defun remove-negative (lst)
  (cond ((null lst)           nil)
        ((< (car lst) 0)     (deleter (lst)))
        ((>= (car lst) 0)    (remove-negative (cdr lst)))
  )
)

(defun deleter (lst)
  (remove-negative (cdr lst))
)

;;  test plan for remove negative:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(remove-negative '(1 2 3 4))
(remove-negative '(1 -1 2 -3 -4 7))
