;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  5.	Sort by recency: Takes a word and a list of words.
;;                If the word is not in the list, it is added at the beginning
;;                of the list. If the word is in the list, its position is
;;                changed to be first in the list. In both cases, the word
;;                most recently added is now at the front of the list.
;;  parameters:
;;       lst – list of words
;;       word - the word to make recent
;;  assumptions:
;;       1. The incoming list has no duplicates.

(defun make-recent (word lst)
  (cond ((null lst)               nil)
        ((equal word (car lst))  (cons word (rest-lst word (cdr lst))))
        (t                       (cons word (rest-lst word lst)))
  )
)

(defun rest-lst (word lst)
  (cond ((null lst)    nil)
        ((equal word (car lst))   (rest-lst word (cdr lst)))
        (t                       (cons (car lst) (rest-lst word (cdr lst))))
  )
)

;;  test plan for make recent:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; empty list           (make-recent 'cat '())              ()
;; found at front (make-recent 'dog '(dog cat bird))   (dog cat bird)
;; middle of lst  (make-recent 'cat '(dog cat bird))   (cat dog bird)
