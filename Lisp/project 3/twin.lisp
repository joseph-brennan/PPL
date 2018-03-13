;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  8.	Twin.  Receives a list and doubles all elements.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1.  The list is not nested.

(defun Twin (lst)
  (cond ((null lst)   nil)
        ;; adds two of the current element to the list
        (t           (cons (car lst) (cons (car lst) (twin (cdr lst)))))
  )
)

;;  test plan for twin:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;;double both atom and number  (twin '(dog 2 cat))  (dog dog 2 2 cat cat)
;;only numbers                  (twin '(3 3 4))         (3 3 3 3 4 4)
;;only atoms              (twin '(one two three)) (one one two two three three)
