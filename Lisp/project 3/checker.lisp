;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  11.	Expression syntax checker:  A function which checks the syntax of a
;;             (possibly nested) list of expressions with numeric operands
;;             and binary infix operators (the operators are the actual words):
;;             plus, minus, times, dividedby.
;;  parameters:
;;       lst – list of expressions with numeric operations
;;  assumptions:


(defun checker (lst)
  (cond ((null lst)                     nil)
        ((not (token-check lst))       (append (error 1) (chekcer (cdr lst))))
        ((not ()))
        (t                              nil)
  )
)

;; wrong number of tokens in an expression
(defun token-check (lst)
  (cond ((null lst)           nil)
        ((= (length lst) 3))
        (t                    nil)
  )
)

;; operands not numeric
(defun not-numeric (num)
  (cond ((null num)            nil)
        ((numberp num))
        (t                     nil)
  )
)

;; invalid operator
(defun op-error (op)
  (cond ((null op)   nil)
        ((equal op 'plus))
        ((equal op 'minus))
        ((equal op 'times))
        ((equal op 'dividedby))
        (t           nil)
  )
)

(defun error (num)
  (cond ((null lst)   nil)
        ((= num 1)    '(wrong number of operands))
        ((= num 2)    '(operands not numeric))
        ((= num 3)    '(invalid operator ))
  )
)

;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------

;; Examples of top-level function:
; true, valid             (checker  '(7 plus 11))  ==>  T
; true, valid             (checker  '(25 minus (17 times 12)))  ==>  T
; wrong number of operand (checker '(-4 plus))  ==>  nil
; operands not numeric    (checker '(-4 plus (cat minus dog)))  ==>  nil
; invalid operator “+”    (checker '((7 + 3) minus 12))  ==>  nil
; operands not numeric    (checker '(-4 plus (cat minus dog)))  ==>  nil
