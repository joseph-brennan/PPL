;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  8.	Twin.  Receives a list and doubles all elements.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1.  The list is not nested.

(defun Twin (lst)
  (cond ((null lst)   t)
        (t           (cons (car lst) (cons (car lst) (twin (cdr lst)))))
  )
)

;;  test plan for twin:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(twin '(dog 2 cat))

(twin '(3 3 4))

(twin '(one two three))
