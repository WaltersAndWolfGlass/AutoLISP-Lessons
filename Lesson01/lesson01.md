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