;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;; 3.	Remove negatives: A function that receives a list of integers
;;                      and returns a list with all negative values removed.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:


(defun remove-negatives (lst)
  (cond ((null lst)          nil)
        ;; if its a list
        ((listp (car lst))
         (cons (remove-negatives (car lst))
               (remove-negatives (cdr lst))))

        ;; if a possive number keep it in the list
        ((<= 0 (car lst))   (cons (car lst) (remove-negatives (cdr lst))))

        ;; its a negitive number so skip it
        (t                  (remove-negatives (cdr lst)))
  )
)
;;  test plan for remove negative:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; nothing to remove        (remove-negatives '(1 2 3 4))        (1 2 3 4)
;; removes half the list    (remove-negatives '(1 -1 2 -3 -4 7))    (1 7)
;; removes everything       (remove-negatives '(-1 -3 -2 -5))       ()
;; empty list               (remove-negatives '())                  ()
;; nested                   (remove-negatives '(-1 2 (4 5 6)))      (2 (4 5 6))
