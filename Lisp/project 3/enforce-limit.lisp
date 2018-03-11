;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  6.	Enforce an upper limit: A function that receives a number
;;                          (an upper limit) and a list. The list may have
;;                          nested lists. The function produces a new list in
;;                          which all values originally over the limit are
;;                          replaced by the limit.

;;  parameters:
;;       lst – a list of numbers
;;  assumptions:
;;       1. The limit will be a number.

(defun enfuorce-limit (num lst))

;;  test plan for emfuorce limit:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
(enfuource-limit (5 '(1 23 2 4 5)))
(enfuorce-limit (1 '(1 2 3 4 5)))
(enfuorce-limit (3 '(cat dog 3 5 8)))
