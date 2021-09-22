# AutoLISP Lesson 1

## Introduction

### Goals for this lesson

- Learn how to automate repetative tasks in AutoCAD using a script.
- Take scripting to the next level by making a custom AutoCAD command using AutoLISP.

### What you will need for this lesson:

- AutoCAD, any version
- Text Editor. Any will do, you can use Notepad, Notepad++, Microsoft Word, Visual Studio, VSCode, or the VLIDE editor that comes with AutoCAD.  If you are going to get serious, I recommend VSCode, which is what I am using.  Best of all, VSCode is free and can be installed without admin privileges!

## Scripts

- Scripts are a text file with the `.scr` file extension.
- They contain the text that you would type in the command line to perform a task in AutoCAD.

### Pros

- Easy to write.
- Can `bscript` to apply the script to multiple files.
- Automates simple repetitive tasks.

### Cons

- Limited to the command line, no dialog boxes or mouse clicks.
- Can't take user input, they run from beginning to end the same way every time.
- Can't make new AutoCAD commands, they must be run with the script command.

### Tutorial

We are going to make a script that 

## LISP Programming

### Quick Background on LISP

- The name LISP comes from **LIS**t **P**rocessor.  Lists are an important feature of LISP, but we won't be discussing them until a future lesson.
- LISP was the second ever *high level* programming language and was invented in 1958.  FORTRAN was the first, invented the year before.
- Decendants of the original LISP language include AutoLISP, Common Lisp, Scheme, Clojure, and many others.

### Pros

- Can make new AutoCAD commands.
- Can take user input to do different things depending on them.
- Can build in logic to make decisions.
- Can be used to automate more complicated tasks.
- Behaves like most programming languages, so it is a good starting point to learn general programming concepts.
- Can be used directly on the command line or in scripts.

### Cons

- Must run in AutoCAD, it can't be used to make commands in Revit or a stand-alone applications.

