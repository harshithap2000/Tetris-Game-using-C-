# Tetris-game-OOP-project
## ABSTRACT

Tetris , a tile-matching video game, created by a Russian software engineer Alexey Pajitnov
is built on simple rules and has a Guinness world record for the most ported video game title.
Tetris is primarily composed of a field of play during which pieces of various geometric
forms, called "tetriminos", descend from the highest of the sector . During this descent, the
player can move the pieces laterally and rotate them until they touch the rock bottom of the
sector or land on a bit that had been placed before it. The player can neither hamper the
falling pieces nor stop them, but can accelerate them in most versions.

The main objective of the game is to complete levels by clearing a set number of lines. The
more lines cleared the higher the point values. As players complete more levels, the
difficulty of the game increases.
In this project, we built the game by implementing object oriented tools through C++.
## Chapter 1
## INTRODUCTION

### 1.1 BACKGROUND:
The history of games dates to the traditional human past. Games are an integral part of all cultures and are one
among the oldest sorts of human social interaction. Games are formalized expressions of play which permit people
to travel beyond immediate imagination and direct physical activity.
### 1.2 BRIEF HISTORY OF GAMING:
The history of video games goes back to the 1980's , when Alexey Pajitnov imagined a game consisting of a
descent of random pieces that the player would turn to fill rows. He scaled down the number of pieces to seven
variants called tetrominoes after twelve different shape variations would needlessly complicate the game.Alexey
Pajitnov designed the field and pieces of the game using spaces and brackets.Once the horizontal lines completed
he decided to delete them since it completed quickly. This early version of tetris had no scoring system or
levels.Pajitnov presented the game to his colleagues which became popular quickly. It permeated the offices
within the Academy of Sciences and within a couple of weeks it reached Moscow Institute with a computer. Since
the game was quite addictive, his friend Vladimir Pokhilko requested the game to be banned from the Medical
Institute to restore productivity.
Pajitnov sought to adapt Tetris to the IBM pc , which had a better quality display than the Electronika 60. Pajitnov
recruited Vadim Gerasimov,a 16-year-old high school student who was known for his computer skills.Pajitnov
had met Gerasimov before through a mutual acquaintance, and they had worked together on previous
games.Gerasimov adapted Tetris to the IBM PC over the course of a couple of weeks, incorporating color and a
scoreboard.
### 1.2 RESEARCH MOTIVATION:
Just the result of a small brainstorming evening where we decided to use the knowledge gained during class into
something fun.
### 1.3 OBJECTIVE

This project aims to: -

* bind together data and functions that operate on them so that no other part of the
code can access this data except that function
* implement object oriented programming concepts
* learn how to design C++ classes for code reuse
* learn the syntax and semantics of the C++ programming language.
* understand how C++ improves C with object-oriented features.

### 1.4 ORGANIZATION OF THE REPORT:
The following provides the roadmap for remainder of the report:
Chapter 2: Presents a brief overview/working of the proposed area of interest that you have undertaken.
Highlight the application of the technology/concept used, advantage and disadvantage of the technology/concept
chosen,
Chapter 3: This chapter Proposes the technology/application/concept in detail. This chapter highlights the
detailed real-time application/case study of the concept
Chapter 4: Conclusion and Future work
## CHAPTER 2 
## OVERVIEW OF THE PROGRAM 
### 2.1 INTRODUCTION 
The purpose of this chapter is to investigate and highlight some significant research 
accomplishments in ‘Tetris' game application, with more emphasis on the existing algorithm of gaming applications and some basic concepts of File handling techniques aiming for storage of scores. 
The rest of this chapter is organized as follows: Section 2.2 provides a brief course of the program. Section 2.3 gives the Flow Diagram. Finally Section 2.4 highlights the concepts used in the program. 
### 2.1.1 COURSE OF THE PROGRAM 
The entire code is divided into simple 5 modules: Timer, an examination, conversion, eliminate , new block generation 
* Timer 
After the game runs the core and sets the delay value, the timer checks the game's check, elimination, and new block generation logic every time the delay value is reached. 


* An Examination 
 The inspection mainly checks two things: 1 is to check whether the current block is landing and 2 is to check the line that constitutes the elimination. 
* Elimination 
 When the field value of one line is not 0, the elimination line is formed, and the elimination 10

logic is described by checkline. 
* New block generation 
The new block generation is nothing more than random shuffling of pieces and converting the piece location to coordinates. 
## CHAPTER 3 
## REAL TIME APPLICATIONS 
A file is nothing but a source of storing information permanently in the form of a sequence of bytes on a disk. The contents of a file are not volatile like the C compiler memory. The various operations available like creating a file, opening a file, reading a file or manipulating data inside a file is referred to as file handling. 
There is a time when the output generated by compiling and running the program does not serve the purpose. If we want to check the output of the program several times, it becomes a tedious task to compile and run the same program multiple times. This is where file handling comes into play. Here are some of the following reasons behind the popularity of file handling: 
* Reusability: It helps in preserving the data or information generated after running the program. ● Large storage capacity: Using files, you need not worry about the problem of storing data in bulk. 
* Saves time: There are certain programs that require a lot of input from the user. You can easily access any part of the code with the help of certain commands. 
* Portability: You can easily transfer the contents of a file from one computer system to another without having to worry about the loss of data. 
## CHAPTER 4 
## IMPLEMENTATION 
### 4.1 Header Files included: 
1. #include <iostream>: iostream stands for standard input-output stream. This header file contains definitions to objects like cin, cout, cerr etc. 
2. #include <conio.h> :The conio stands for Console-Input-Output. The conio.h is a non-standard header file used in C and C++ programming.. This file contains console input-output functions which are mostly used by MS-DOS compilers. 
3. #include <iomanip>:iomanip is a library that is used to manipulate the output of C++ programs. 4. #include <vector>:Vectors are the same as dynamic arrays with the ability to resize itself automatically when an element is inserted or deleted, with their storage being handled automatically by the container. Vector elements are placed in contiguous storage so that they can be accessed and traversed using iterators. In vectors, data is inserted at the end. Inserting at the end takes differential time, as sometimes there may be a need of extending the array. Removing the last element takes only constant time because no resizing happens. Inserting and erasing at the beginning or in the middle is linear in time. 
5. #include <random> :This header introduces random number generation facilities. This library allows to produce random numbers using combinations of generators and distributions. 
a. Generators: Objects that generate uniformly distributed numbers. 
b. Distributions: Objects that transform sequences of numbers generated by a generator into sequences of numbers that follow a specific random variable distribution, such as uniform, Normal or Binomial. 
6. #include<fstream.h>: We use the header file <fstream> ofstream: It represents output Stream and this is used for writing in files. ifstream: It represents input Stream and this is used for reading from files. fstream: It represents both output Stream and input Stream. So it can read from files and write to files. 
In this mini project we have implemented a files concept.perform file I/O, you must include the header <fstream> in your program. It defines several classes, including ifstream, ofstream, and fstream. These classes are derived from istream, ostream, and iostream, respectively. 
In C++, you open a file by linking it to a stream. Before you can open a file, you must first obtain a stream. There are three types of streams: input, output, and input/output. 
· To create an input stream, you must declare the stream to be of class ifstream. 
· To create an output stream, you must declare it as class ofstream. 
· Streams that will be performing both input and output operations must be declared as class fstream. 
Once you have created a stream, one way to associate it with a file is by using open( ). This function is a member of each of the three stream classes. 
## CHAPTER 5 
## CONCLUSION 
Our aim during this project was to make a Tetris game using Object Oriented concepts.. The Tetris game is built on C++ programming language and we have applied what we learned in this course, and we are able to apply this techniques in this project. 
This project gives us a basic idea of file handling concept and real time programming.Being Object oriented C++ opens a wide passageway of possibilities. Narrowing the available options to achieve the required goal and implementing the concepts taught in regular classes to make our project was immensely encouraging. 
