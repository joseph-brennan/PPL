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
        ;; if what you want is the already the first
        ;; add it to the front then hand off the rest of the list
        ((equal word (car lst))  (cons word (rest-lst word (cdr lst))))
        ;; its not the first element so make it first
        ;; hand off the whole list
        (t                       (cons word (rest-lst word lst)))
  )
)

;; takes after knowning word is the front of the list
(defun rest-lst (word lst)
  (cond ((null lst)    nil)
        ;; remove the old occurnece of the word
        ((equal word (car lst))  (rest-lst word (cdr lst)))
        ;; add every other element to the list in orginal order
        (t                       (cons (car lst) (rest-lst word (cdr lst))))
  )
)

;;  test plan for make recent:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; empty list           (make-recent 'cat '())              ()
;; found at front (make-recent 'dog '(dog cat bird))   (dog cat bird)
;; middle of lst  (make-recent 'cat '(dog cat bird))   (cat dog bird)
