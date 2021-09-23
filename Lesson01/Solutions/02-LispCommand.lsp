; This is a command to change the page number on a standard 
; WW drawing sheet.  

; All text after a semi-colon (;) are treated as comments 
; in AutoLISP.  This means they are not to be interpreted
; as code at all, so you can write anything you want.

(defun c:np () 
; The defun function is short for DEfine FUNction.  It 
; allows us to define functions that we, or AutoCAD can call
; by name any time.  The name of this function is "c:np",
; which is a shortcut that tells AutoCAD to treat this 
; function as a command named NP. Ignore the open and close
; parenthesis for now.  We will discuss them another day,
; but they are required and must be included.

  (setq pageNumber 
  ; The setq function is short for SET eQual, and is commonly
  ; used to assign a value to a variable.  Here, we are
  ; creating a variable named "pageNumber" and assigning it 
  ; the result of the next function.

        (getstring "Enter the page number:")
        ; The getstring function is a function to prompt the
        ; AutoCAD user for a string value.  String values are
        ; any sequence of text.  The words in quotes are
        ; another string value that we are giving to the 
        ; getstring function to tell it what we want to say
        ; in the command line when this function is executed.
        ; Whatever the user types in response to the getstring
        ; function gets saved into the variable "pageNumber".

  )
  ; This closing parenthesis closes the setq function above.
  ; In LISP, all opening parenthesis must be closed at some
  ; point, which signals the end of that function.  This is one
  ; of the major pain points for people learning LISP, 
  ; forgetting to close parenthesis.

  (command "change" "31.3125,0.75" "" "" "" "" "" pageNumber)
  ; The command function simply passes all of the arguments
  ; given to it into the command line.  Here, we want the 
  ; "change" command to be executed on the command line, then
  ; the coordinate value, then a series of enters (two double 
  ; quotes is shorthand for "just hit enter"), and finally the
  ; page number we stored in the variable "pageNumber".  This
  ; part of the code is very similar to the script we wrote
  ; earlier.

  (princ)
  ; This princ function is commonly added to all functions that
  ; are used as AutoCAD commands to prevent extra LISP function
  ; text from showing up on the command line which might confuse
  ; a user.

)
; This closing parenthesis closes the defun function at the start
; of this file.