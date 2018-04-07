;;;;  Joey Brennan – CS 3210 – Fall 2016
;;  ============================
;;  extra credit:	It receives a list that is supposed to be a Lisp-like
;;           function call.  Your function checks that a) the first item in
;;           the list is a valid function name, and b) it has the right
;;           number of arguments.
;;  parameters:
;;       call –  a list of valid functions and the number of parameters they require
;;       check - the function call to be checked
;;  assumptions:
;;         1. It does not check argument types.

(defun check-call (call check)
  (cond ((or (null check) (null call)) nil)

        ((equal (car (car call)) (car check))
         (count-args (cdr check) (car (cdr (car call)))))

        (t
         (check-call (cdr call) check))
  )
)

;; lst the verified function that exists which is now checked
;; with the count of how many arguement that partual one takes
(defun count-args (lst count)
 (= (length lst) count))


;;  test plan for checker:
;;  category / description		data		expected result
                 ;;  ----------------------------------------------------------------------------------------------------
;; pass test (check-call test1 '(stuff 33 lst (a b c) 101))   t
;;           (check-call test1 '(thing))                      t
;;           (check-call test1 '(fun lst (hi bye)))           t

;; false test (check-call '((pal 1)) '(stuff 33 lst (a b c) 99)) nil
;;            (check-call test1 '(flapdoodle lst count))         nil
;;            (check-call test1 '(not-here test check (a b c)))  nil

;; valid count     (count-args '(1 2 3 4) 4)                       t
;; invalid count   (count-args '(a b c d) 2)                       nil

(setf test1
  '((stuff 4) (blob 1) (thing 0) (flapdoodle 3) (thingie 1) (junk 3) (func 2) (fn 0) (calc 4) (fun 2)))
