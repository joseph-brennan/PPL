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
  (cond ((null lst)
         nil)
        ;; checks that there is a valid input
        ((not (token-check lst))
         ;; specililzed error message
         (error-statement 1))

        ;; checks to see if its a nested list
        ((listp (car lst))
         ;; recursevely checks the inner list
         (checker (car lst)))

        ;; checks valid number in expected location
        ((not (not-numeric (car lst)))
          ;; specililzed error message
         (error-statement 2))

        ;; checks for the know math operations
        ((not (op-error (car (cdr lst))))
         ;; specililzed error message
         (append (error-statement 3) (list (car (cdr lst)))))

        ;; checks for nested list in second oprand
        ((listp (car (cdr (cdr lst))))
         ;; recursevely checks in inner list
         (checker (car (cdr (cdr lst)))))

        ;; checks the second operand is a number
        ((not (not-numeric (car (cdr (cdr lst)))))
         (error-statement 2))

        ;; the string is a valid and true math function
        (t
         (append (error-statement ()) '(true)))
  )
)

;; wrong number of tokens in an expression
(defun token-check (lst)
  (cond ((null lst)           nil)

        ;; checks the length of the list
        ((= (length lst) 3))

        (t                    nil)
  )
)

;; operands not numeric
(defun not-numeric (num)
  (cond ((null num)            nil)
        ;; checks if its a number
        ((numberp num))

        (t                     nil)
  )
)

;; invalid operator
(defun op-error (op)
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
  (cond ((null num)   '(valid))
        ((not (numberp num))       nil)

        ((= num 1)    '(wrong number of operands))

        ((= num 2)    '(operands not numeric))

        ((= num 3)    '(invalid operator))

        (t                   '(valid))

  )
)

;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; number checks         (not-numeric 4)           t
;;                       (not-numeric '4)          t
;;                       (not-numeric  'plus)     nil

;; op-code checks        (op-error 'plus)          t
;;                       (op-error 'minus)         t
;;                       (op-error 5)              nil

;; token-check           (token-check '(a b c))        t
;;                       (token-check '(1 plus 2))     t
;;                       (token-check '(1 2))         nil

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
