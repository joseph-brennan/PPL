;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  1.	Search.  A function that receives an integer and a list.
;;               The list will have a mix of integers, characters, and words,
;;               and may have nested lists.
;;               The function returns a count of how many times the
;;               integer value is found.
;;  parameters:
;;       lst – a list of numbers, characters, and words
;;       num - an integer
;;  assumptions:

(defun searcher (num lst)
  (cond ((null lst)    result)
        ((= num (car lst))    (+ result 1)(searcher (cdr lst)))
        ((list (car lst))     (cdr (car lst)))
  )
)


;;  test plan for searcher:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(searcher (4 '(1 2 3 4 5)))
(searcher (8 '(1 2 '(dog cat bat) 5)))
