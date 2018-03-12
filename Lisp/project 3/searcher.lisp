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
  (cond ((null lst)                                     0)

        ((listp (car lst))                             (+ (searcher num (car lst)) (searcher num (cdr lst))))

        ((and (numberp (car lst)) (= num (car lst)))   (+ 1 (searcher num (cdr lst))))

        (t                                             (searcher num (cdr lst)))
  )
)


;;  test plan for searcher:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(searcher 4 '(1 2 3 4 5))
(searcher 8 '(1 2 '(dog cat bat) 5))
