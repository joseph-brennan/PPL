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
     ;; check if there is a clump       add to count of clumps and remove clump
        ((clump (car lst) (cdr lst))     (+ 1 (matchan (car lst) (cdr lst))))
        ;; else no clump checking rest of lst
        (t                               (count-clumps (cdr lst)))
  )
)

;; removes every part of the clump after verifying that it is a clump
(defun matchan (val lst)
  (cond ((null lst)                               (count-clumps lst))
;; different cases are needed because of how the comparison works
        ;; if atom type and apart of clump remove it
        ((and (atom val) (equal val (car lst)))   (matchan val (cdr lst)))
        ;; if number and same as rest of clump remove
        ((and (numberp val) (= val (car lst)))    (matchan val (cdr lst)))
        ;; else end of clump return to parent program
        (t                                        (count-clumps lst))
  )
)

;; verifying that there is a clump
(defun clump (val lst)
  (cond ((null lst)                                 nil)
        ;; atom check returns true if clump
        ((and (atom val) (equal val (car lst)))     t)
        ;; number check for clump
        ((and (numberp val) (= val (car lst)))      t)
        ;; no clump found
        (t                                          nil)
  )
)

;;  test plan for count groups:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; zero clumps        (count-clumps '(1 2 3))              0
;; one clump        (count-clumps '(12 12 1 25))           1
;; one clump words (count-clumps '(echo echo is this on))  1
