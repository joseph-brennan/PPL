;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  4. Count groups:  Given a list, count the number of groups
;;                   (a group is two or more identical adjacent items).
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. the list contains no nested lists

(defun count-clumps (lst)
  (cond ((null lst)                       0)

        ((clump (car lst) (cdr lst))     (+ 1 (matchan (car lst) (cdr lst))))

        (t                               (count-clumps (cdr lst)))
  )
)

(defun matchan (val lst)
  (cond ((null lst)                               (count-clumps lst))

        ((and (atom val) (equal val (car lst)))   (matchan val (cdr lst)))

        ((and (numberp val) (= val (car lst)))    (matchan val (cdr lst)))

        (t                                        (count-clumps lst))
  )
)

(defun clump (val lst)
  (cond ((null lst)                                 nil)

        ((and (atom val) (equal val (car lst)))     t)

        ((and (numberp val) (= val (car lst)))      t)

        (t                                          nil)
  )
)

;;  test plan for count groups:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; zero clumps        (count-clumps '(1 2 3))              0
;; one clump        (count-clumps '(12 12 1 25))           1
;; one clump words (count-clumps '(echo echo is this on))  1
