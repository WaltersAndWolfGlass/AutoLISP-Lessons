# AutoLISP Lesson 1

## Introduction

### Goals for this lesson

- Learn how to automate repetative tasks in AutoCAD using a script.
- Take scripting to the next level by making a custom AutoCAD command using AutoLISP.

### What you will need for this lesson:

- AutoCAD, any version
- Text Editor. Any will do, you can use Notepad, Notepad++, Microsoft Word, Visual Studio, VSCode, or the VLIDE editor that comes with AutoCAD.  If you are going to get serious, I recommend VSCode, which is what I am using.  Best of all, VSCode is free and can be installed without admin privileges!

************

## Scripts

- Scripts are a text file with the `.scr` file extension.
- They contain the text that you would type in the command line to perform a task in AutoCAD.

### Tutorial

We are going to make a script to update the "Drawn By" text on a set of drawings.  All of the drawing files in the Drawings folder in this lesson are set to "X", and we want to make a script that will update this text to your initials on a single file.  Once this is done, we will use the `bscript` command to run that script on all of the files.

Script files are simple text files with the `.scr` file extension.  They contain all of the text that you would type out if you were typing everything into the command line.  Every letter, space, or enter key is identical in a script file to what you would do in AutoCAD.

When making a script file, I find it helpful to open up the AutoCAD file that I want to run the script file on, and then figure out exactly how to get what I want while only using the command line.  Things like dialog boxes or double-clicking on text to edit it are things that can't be done with a script.

For our task at hand, we want to pick a specific text object in paperspace and change its text to something else.  If I were doing this manually, I'd use my mouse to get the object in view and double-click it to edit the text--both of these don't work by using only the command line, so we will have to go a little old school.

One thing we can do is use AutoCAD's `change` command.  This command works entirely in the command line and gives us an option to change the text of a text entity if selected.  Try it for yourself!  You have to push enter a bunch of times to accept default values, but eventually it will ask you what you want the new text to be.  This is where we will put our initials in the script!

But how do we select the text object to change using only the command line?  Coordinates.  Yup, super old school.  Luckily for us, the text we want to change is *always* in the same place on every drawing, so if we find the coordinates of the text, then we should be able to put that in our script to select the text object to change!

Use the `ID` command in AutoCAD to get a coordinate point near the text object and write it down somewhere.  Then, with only the command line, figure out exactly what you have to type to change the text of the entity.  It should be something like the following:

    change(enter)
    theCoordinatesYouWroteDown(enter)
    (some number of enters)
    yourInitials(enter)

Now all you have to do is type all this out in a text file, save it with a `.scr` extension, and your script is completed!  To run it, you can use the `script` command in AutoCAD or you can simply drag the script file itself from file explorer and drop it into the AutoCAD drawing area.

Once you have verified that your script works, try using the `bscript` command to run it on all the files and verify that your initials are getting placed properly.  Congratulations!  You have written your first AutoCAD script!

### Pros

- Relatively easy to write.
- Can `bscript` to apply the script to multiple files.
- Automates simple repetitive tasks.

### Cons

- Limited to the command line, no dialog boxes or mouse clicks.
- Can't take user input, they run from beginning to end the same way every time.
- Can't make new AutoCAD commands, they must be run with the script command.

************

## LISP Programming

### Quick Background on LISP

- The name LISP comes from **LIS**t **P**rocessor.  Lists are an important feature of LISP, but we won't be discussing them until a future lesson.
- LISP was the second ever *high level* programming language and was invented in 1958.  FORTRAN was the first, invented the year before.
- Decendants of the original LISP language include AutoLISP, Common Lisp, Scheme, Clojure, and many others.

### Tutorial

Earlier, we made a script to replace the "Drawn By" text in a drawing with our initials.  But what if we needed it to do different things based on user input?  This time we are going to make a new AutoCAD command in AutoLISP called `NP` short for `NumberPage` which will ask for a page number and then update the sheet number text in paper space to match.

Like script files, LISP files are simple text files but this time with a `.lsp` extension.  Unlike scripts, they aren't just a copy of what you type out in the command line, but actual code interpreted by AutoCAD.  With LISP you can do everything you can do in scripts, plus a whole lot more.

For this exercise, we will make a whole new command.  I find it helpful to define what I want the command to do before writing anything.  What do I want it to ask the user for?  What is the end result?

This command will be called `NP` and I want it to ask the user one thing, "What is the page number?".  After that, the command will find the text in paperspace and change it to the given page number.

When you are first starting to write LISP code, it is extremely helpful to know that LISP can be written directly into AutoCAD's command line.  This is very useful to try out functions and see how they actually work.

All functions in AutoLISP are always in this form:

    (functionName argument1 argument2 ...)

The open parenthesis says that you are starting the function, then you give the function name, and then arguments to that function if any.

For example, addition in AutoLISP is done like this:

    (+ 1 2)

The function name is plus, and I am giving it two numbers, 1 and 2.  This function returns the answer 3.  Try this in the command line!  If you type this in the command line and hit enter, you should see a 3 pop up.  That is AutoCAD executing a LISP function and telling you what the result is!

Try some of these other functions one at a time... can you figure out what they do?

    (- 6 1)
    (* 2 3)
    (/ 4 2)
    (cos 0)
    (sin pi)
    (strcase "upper")

One of the functions we will need is `getstring`. This function tells AutoCAD to display a prompt of your choosing on the command line and to get text back from the user.  We use this in the code to ask the user for the page number.  It is typically used like this:

    (getstring "What is the text?")

You must enclose your prompt text in double quotes (") to tell LISP that this is a text argument and not some function names or variable names or something else.  This is called a string in many languages, including LISP.  That's why this function is called `getstring` because you are getting a string of text from the user.

It's great that you are getting a string from the user, but what do you do with it?  Usually you save user inputs into variables like this:

    (setq variableName value)

The function here is `setq` (function names are always after the open parenthesis), short for **set** e**q**ual.  The argument `variableName` is some descriptive variable name and `value` is a number, string, or another piece of data.  You can name your variables whatever you want, but I prefer longer, descriptive names because they help you remember what kind of value the variable holds.

We are going to write LISP code like this:

    (setq pageNumber (getstring "Enter the page number: "))

Every function in LISP has a "result".  In the case of the `getstring` function, the result is the string inputted by the user.  We are taking this result and "saving" it into the variable named `pageNumber`.  Try this out in the command line!  You should see the page number you type in pop out onto the command line after you type it.  

To verify that the variable holds the value you think it does, type this in the command line:

    !pageNumber

This is not LISP code, but it is a way for you to see the value of a LISP variable from the command line.  

The last important piece of the code is the `command` function, which is written like this:

    (command argument1 argument2 ...)

The `command` function takes any number of arguments and simply relays them to the AutoCAD command line.

For example, you could run this in the command line:

    (command "line" "0,0" "10,10" "")

You should get a line running from 0,0 to 10,10 on the current layer.  This LISP function put all of those arguments onto the command line as if you were typing them out yourself!  

We are going to use this function in our code like this:

    (command "change" "31.3125,0.75" "" "" "" "" "" pageNumber)

This tells AutoCAD to start the change command, then pick some point, then hit enter for each of the `""` in code, then put in the value of our variable `pageNumber`.  Notice, when we use the variable, we don't use the double quotes.  We want LISP to see this as the value of our `pageNumber` variable and not the text "pageNumber".

We are going to put all of these functions into a `defun` function, which is short for **de**fine **fun**ction, like this:

    (defun myFunctionName () ...)

This statement defines a new function with the name `myFunctionName`.  Running this function will execute all of the functions that come after the `()` in order.  You can name your functions however you like, but if you start the name out with `c:`, that tells AutoCAD that you want this function to act like a brand new AutoCAD command!  We are going to write the code like this:

    (defun c:np ()
        (setq pageNumber 
            (getstring "Enter the page number: ")
        )
        (command "change" "31.3125,0.75" "" "" "" "" "" pageNumber)
    )

The indenting in the above code is purely for looks and makes no difference in how your code runs.  It does make it a lot more readable however and you should strive to keep your code easier to read to help you and others understand what is going on.

After you execute this function, AutoCAD will now know what you want to do when you call the `NP` command and you can try running that in the command line now.  Once you get to this stage though, it is much easier to put your LISP code into a text file with the `.lsp` extension so that AutoCAD can run it from there.

To get AutoCAD to always load your `.lsp` file whenever it starts up or opens a new drawing, you should use the `APPLOAD` command and add your `.lsp` file to the "Startup Suite" there.  That way, any functions or commands that you create will always be available.

Congratulations!  You are now a LISP programmer!

### Pros

- Can make new AutoCAD commands.
- Can take user input to do different things depending on them.
- Can build in logic to make decisions.
- Can be used to automate more complicated tasks.
- Behaves like most programming languages, so it is a good starting point to learn general programming concepts.
- Can be used directly on the command line or in scripts.

### Cons

- Must run in AutoCAD, it can't be used to make commands in other applications like Revit or to make a new stand-alone application.

************

## Discussion Topics

- How can we run our new LISP command across a series of drawings?
- How can we make our LISP command more robust and less prone to error?  Does it work in model space?  Does it work if the UCS is different?  Does it work if you are zoomed in?
- How can we make our LISP command automatically number pages sequentially?