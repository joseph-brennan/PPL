(defun add1 (lst)
  (cond ((null lst) 0)
        ((numberp (car lst))
         (+ (car lst) (add1 (cdr lst))))
        (t
          (add1 (cdr lst)))))

(add1 '(4 3 2 1))

(defun add2 (lst)
  (cond ((all-nums lst)
         (add1 lst))
        (t nil)))

(add1 '(1 4 3 2))

(defun all-nums (lst)
  (cond ((null lst) t)
        ((numberp (car lst))
         (all-nums(cdr lst)))
        (t
          nil)))



(defun add3 (lst)
  (cond ((null lst)             0)
        ((numberp (car lst))   (+ (car lst) (add3 (cdr lst))))
        ((atom (car lst))      (add3 (cdr lst)))
        (t                     (+ (add3 (car lst)) (add3 (cdr lst))))))


(add3 '(1 2 3 4))

(defun num-nested-lists (lst)
  (cond ((null lst)             0)
        ((lstp (car lsp))      (+ 1 (num-nested-lists (cdr lst))))
        (t                     (num-nested-lists (cdr lst)))))



(defun get-nested-lists (lst)
  (cond ((null lst)              nil)
        ((lstp (car lst))       ((append (car lst) (get-nested-lists (cdr lst)))))
        (t                      (get-nested-lists (cdr lst)))))
