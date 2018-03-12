;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;; 3.	Remove negatives: A function that receives a list of integers
;;                      and returns a list with all negative values removed.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:


(defun remove-negatives (lst)
  (cond ((null lst)         nil)
        ((<= 0 (car lst))  (remove-negatives (cdr lst)))
        ((> 0 (car lst))   (negative-gone (lst)))
  )
)

(defun negative-remove (lst)
  (remove-negatives (cdr lst))
)

;;  test plan for remove negative:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(my-remove-negatives '(1 2 3 4))
(my-remove-negatives '(1 -1 2 -3 -4 7))
