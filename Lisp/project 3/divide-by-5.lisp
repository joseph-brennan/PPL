;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  2.	Divide by 5 counter: A function that receives a list of numbers,
;;                        and returns a count of how many are divisible by 5.
;;                        Uses a helper predicate function that returns true
;;                        if its numeric argument is evenly divisible by 5.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. no nested lists
;;       2. all list elements are integers
;;       3. list sum will not exceed maxint

(defun devide-by-5 (lst)
  (cond ((null lst)            0) ;; empty so zero returned
;;      case checks if it is divisible and adds to count if true
        ((moder (car lst))    (+ 1 (devide-by-5 (cdr lst))))
;;      else case where it isnt divisible so it moves on in list
        (t                    (devide-by-5 (cdr lst)))
  )
)

(defun moder (num)
  (cond ((null num)           nil)
;;      check that the mod is 0 so perfectly divisble
        ((= (mod num 5) 0))
;;      else case return false
        (t                    nil)
  )
)


;;  test plan for devide:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;;two mods          (devide-by-5 '(4 10 15 16))   2
;;no wrong answers  (devide-by-5 '(1 2 3 4))      0
