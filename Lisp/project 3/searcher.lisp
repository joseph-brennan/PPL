;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  1.	Search.  A function that receives an integer and a list.
;;               The list will have a mix of integers, characters, and words,
;;               and may have nested lists.
;;               The function returns a count of how many times the
;;               integer value is found.
;;  parameters:
;;       lst – a list of numbers, characters, and words
;;       num - an integer wanting to find
;;  assumptions:

(defun searcher (num lst)
  (cond ((null lst)        0)
        ;; if the current is a list
        ((listp (car lst))
         ;; inner recussion that adds each of inner to rest of outer
         (+ (searcher num (car lst))
            (searcher num (cdr lst))))

        ;; if current is a number and is what we are searching for
        ((and (numberp (car lst))
              (= num (car lst)))
         ;; add to the count and check rest of list
         (+ 1 (searcher num (cdr lst))))

        ;; else check the rest of the list
        (t
         (searcher num (cdr lst)))
  )
)


;;  test plan for searcher:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;;checking only numbers    (searcher 4 '(1 2 3 4 5))          1
;;checking neseted list  (searcher 8 '(1 2 '(dog cat bat) 5)) 0
;;
