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
    (cond ((null lst)    nil)
          ;; if current is an atom make it a list
          ((atom lst)   (list lst))
          ;; I know they are are lists so append recursevely
          ;; the flatten element to the rest of the flattened list
          (t            (append (flatten (car lst)) (flatten (cdr lst))))
    )
)

;;  test plan for flatten:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------

;; empty list              (flatten ())                             nil
;; nothing to flatten  (flatten '(day night))                   (day night)
;;so many (flatten '(a b (high low) () (e (f (deep) h))))   (a b high low e f deep h)
;; deep list      (flatten '((((hi) bye))))                 (hi bye)
