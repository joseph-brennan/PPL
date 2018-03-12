;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  2.	Divide by 5 counter: A function that receives a list of numbers,
;;                          and returns a count of how many are divisible by 5.
;;                          Uses a helper predicate function that returns true
;;                          if its numeric argument is evenly divisible by 5.
;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. no nested lists
;;       2. all list elements are integers
;;       3. list sum will not exceed maxint

(defun devide-by-5 (lst)
  (cond ((null lst)            0)
        ((moder (car lst))    (+ 1 (devide-by-5 (cdr lst))))
        (t                    (devide-by-5 (cdr lst)))
  )
)

(defun moder (lst)
  (cond ((= (mod lst 5) 0)     t)
        (t                    nil)
  )
)


;;  test plan for devide:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(devide-by-5 '(4 10 15 16))
(devide-by-5 '(1 2 3 4))
