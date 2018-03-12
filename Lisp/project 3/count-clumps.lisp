;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  4. Count groups:  Given a list, count the number of groups
;;                   (a group is two or more identical adjacent items).
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. the list contains no nested lists

(defun count-clumps (lst)
  (cond ((null lst)        0)
        (atom (car lst)         (+ 1 (count-clumps (cdr lst))))
        ((numberp (car lst))    (+ 1 (count-clumps (cdr lst))))
        (t                      (count-clumps (cdr lst)))
  )
)

;;  test plan for count groups:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(count-clumps '(1 2 3))
(count-clumps '(12 12 1 25))
(count-clumps '(echo echo is this on))
