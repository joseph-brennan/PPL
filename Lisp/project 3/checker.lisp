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
  (cond ((null lst)         nil)
        ;; checks that there is a valid input
        ((not (valid-token lst))
         ;; specialized error message
         (append (error-statement 1) lst))

        ;; the first is a nested list
        ((listp (car lst))
         ;; append the result of the nested to the result of the rest
         ;; replacing the now checked nested with defualt 1
         (append (checker (car lst)) (cons 1 (checker (cdr lst)))))

        ;; checks valid number in expected location
        ((not (valid-numeric (car lst)))
          ;; specialized error message
         (append (error-statement 2) (car lst)))

        ;; checks for the known math operations
        ((not (is-valid-op (car (cdr lst))))
         ;; specialized error message
         (append (error-statement 3) (list (car (cdr lst)))))

         ;; checks to see if its a nested list
        ((listp (car (cdr (cdr lst))))
          ;; recursevely checks the inner list
          ;; we know its the last element so dont need the outer recusion
         (checker (car (cdr (cdr lst)))))

        ;; checks the second operand is a number
        ((not (valid-numeric (car (cdr (cdr lst)))))
         (append (error-statement 2) (car (cdr (cdr lst)))))

        ;; the string is a valid and true math function returns true
        (t               t)
  )
)

;; wrong number of tokens in an expression returns false
(defun valid-token (lst)
 ;; checks the length of the list
 (= (length lst) 3)

)

;; operands not numeric returns fasle
(defun valid-numeric (num)
;; checks if its a number
  (numberp num)
)

;; invalid operator
(defun is-valid-op (op)
  (cond ((null op)   nil)
        ;; check to make sure its an atom
        ((not (atom op))   nil)
   ;; check all the known math operations
        ((equal op 'plus))

        ((equal op 'minus))

        ((equal op 'times))

        ((equal op 'dividedby))

        (t           nil)
  )
)

(defun error-statement (num)
  (cond ((null num)   nil)
        ((not (numberp num))       nil)

        ((= num 1)    '(wrong number of operands))

        ((= num 2)    '(operand is not numeric))

        ((= num 3)    '(invalid operator))
  )
)

;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; number checks         (valid-numeric 4)           t
;;                       (valid-numeric '4)          t
;;                       (valid-numeric  'plus)     nil

;; op-code checks        (is-valid-op 'plus)          t
;;                       (is-valid-op 'minus)         t
;;                       (is-valid-op 5)              nil

;; valid-token           (valid-token '(a b c))        t
;;                       (valid-token '(1 plus 2))     t
;;                       (valid-token '(1 2))         nil

;; error                 (error-statement 1)   (wrong number of operands)
;;                       (error-statement 2)   (operands not numeric)
;;                       (error-statement 3)   (invalid operator)
;;                       (error-statement 4)   (valid)

;; Examples of top-level function:
;; true, valid             (checker  '(7 plus 11))  ==>  T
;; true, valid             (checker  '(25 minus (17 times 12)))  ==>  T
;; wrong number of operand (checker '(-4 plus))  ==>  nil
;; operands not numeric    (checker '(-4 plus (cat minus dog)))  ==>  nil
;; invalid operator "+"    (checker '((7 + 3) minus 12))  ==>  nil
;; operands not numeric    (checker '(-4 plus (cat minus dog)))  ==>  nil
;; invalid operation "-"   (checker  '(25 - (17 plus 12)))
;; invalid operation "plu" (checker  '(25 minus (17 plu 12)))   
