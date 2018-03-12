;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  6.	Enforce an upper limit: A function that receives a number
;;                          (an upper limit) and a list. The list may have
;;                          nested lists. The function produces a new list in
;;                          which all values originally over the limit are
;;                          replaced by the limit.

;;  parameters:
;;       lst – a list of numbers
;;       num - the upper limit int
;;  assumptions:
;;       1. The limit will be a number.

(defun enforce-limit (num lst)
  (cond ((null lst) nil)
        ((listp (car lst))                            (+ (enforce-limit num (car lst)) (enforce-limit num (cdr lst))))
        ((and (numberp (car lst)) (< num (car lst)))  (cons num (enforce-limit num (cdr lst))))
        (t                                            (cons (car lst)  (enforce-limit num (cdr lst))))
  )
)

;;  test plan for enforce-limit:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(enforce-limit 5 '(1 23 2 4 5))
(enforce-limit 1 '(1 2 3 4 5))
(enforce-limit 3 '(cat dog 3 5 8))
