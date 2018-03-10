;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  10.	Flatten: Receives a list of arbitrary depth, and returns a list
;;               containing all the same elements, in the same order, but now
;;               at the top level.
;;             Note that flattening an embedded NIL removes it.
;;  parameters:
;;       lst – list of arbitrary depth
;;  assumptions:

(defun flatten (lst)
  (cond (???                  t)
        ((atom (car lst))           (cons (car lst) (flatten (cdr lst))))
        ((list (car lst))           (append (car lst) (flatten (cdr lst))))
  )
)

;;  test plan for flatten:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------

(flatten ())
(flatten '(day night))
(flatten '(a b (high low) () (e (f (deep) h))))
