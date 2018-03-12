;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  4. Count groups:  Given a list, count the number of groups
;;                   (a group is two or more identical adjacent items).
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. the list contains no nested lists

(defun count-clumps (lst)
  (cond ((null lst)             0)
        ((and (atom (car lst)) (clump (car lst) (cdr lst)))      (+ 1 (matcha (car lst) (cdr lst))))
        ((and (numberp (car lst)) (clump (car lst) (cdr lst)))   (+ 1 (matchn (car lst) (cdr lst))))
        (t                                                        (count-clumps (cdr lst)))
  )
)

(defun matchan (val lst)
  (cond ((null lst)                               (count-clumps lst))
        ((and (atom val) (equal val (car lst)))   (matchan at (cdr lst)))
        ((and (numberp val) (= val (car lst)))    (matchan val (cdr lst)))
        (t                                        (count-clumps lst))))

(defun matcha (at lst)
  (cond ((null lst)                (count-clumps lst))
        ((equal at (car lst))      (matcha at (cdr lst)))
        (t                         (count-clumps lst))
  )
)

(defun matchn (num lst)
  (cond ((null lst)          (count-clumps lst))
        ((= num (car lst))   (matchn num (cdr lst)))
        (t                   (count-clumps lst))
  )
)

(defun clump (val lst)
  (cond ((null lst)     nil)
        ((and (atom val) (equal val (car lst)))     t)
        ((and (numberp val) (= val (car lst)))      t)
        (t                                          nil)
  )
)

;;  test plan for count groups:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(count-clumps '(1 2 3))
(count-clumps '(12 12 1 25))
(count-clumps '(echo echo is this on))
