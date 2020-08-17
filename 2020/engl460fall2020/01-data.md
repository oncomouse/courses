---
layout: default
title: "ENGL 460 – What is Data?"
---

# Overview

This reading will introduce you to the idea of data, as a computer sees it. We will be discussing:

1. Definitions of data
1. Why data matters to writing
1. Different forms of data on a computer
1. How writing becomes data

# Definitions of Data

## Variables

Without getting a lot of technical detail, computers store data in memory in fixed locations. So, if I say to the computer "Here, hold all this data for me," the computer will place the data I provide it in a particular part of its memory. Later, when I come back to the computer, I can say things such as "Hey, remember that data I gave you? Update it for me" or "Give me back that data I gave you."

How the computer stores data in memory is not something most people want to know anything about. When we interact with a computer to open a document we are editing or to change a spreadsheet or even to play a different song, we don't want to have to care about where this data lives. At a basic level, mostly out of our sight, this data is managed by what are called "variables" in computer programming. It's a term for a named location in memory. We don't need to know where it is and usually we don't want to know. File names on your computer, along with folders, are ways of defining variables: it's a term for a location with meaningful data in it.

# Forms of Data

Data comes in many different forms on a computer, however, we can diferentiate a few basic kinds of data. Roughly speaking, data can be divided into:

1. Scalar types
1. Compound types

## Scalar data

"Scalar" is a term from algebra that refers to single values. The simplest kind of scalar data to a computer would be a number. Things like `9` or `14.5` are numerical scalars. Because numbers are very important to computers, `9` is a type of numerical scalar called an "Integer" (it doesn't have any fracational data) while `14.5` would be a "Float" (or floating point number, that does have a fractional value).

There are other kinds of scalar values for computers, but they all ultimately derive from numbers. 

A popular type of scalar in computer programming is called a "boolean." booleans can either be `true` or `false` and are used to represent the results of tests (the question "Is 14 greater than 9?" would be represented in a computers as a boolean scalar, which would be `true`) and to make decisions (computer programs are largely about making decisions based on the truth or falsehood of a set of conditions).

However, in early computer programming languages that did not recognize a boolean as a unique kind of data, `1` and `0` can also be used to represent `true` and `false` (with `1` being `true` and `0` being `false`). This is what I mean about scalars ultimately being numbers. Truth and falsehood in computers are just a bunch of `1`s and `0`s.

## Compound Data

How do we represent, say, a variable that changes over time using a scalar? We could create new variables each time the variable changes, but what if our data changes often? How would we look at it all in one place?

This is where compound data enters into the picture. Compound data represents collections of data, pieces of information we have chosen to link together, for whatever reason.

### List Compound Data

Imagine we are cooking a pot roast. It takes a while, and we're lazy. We have a [probe thermometer](https://images-na.ssl-images-amazon.com/images/I/61mFSRa7LbL._AC_SL1500_.jpg) stuck into the roast that is also connected via Bluetooth to our phone. Our phone will read the temperature of the roast every 30 seconds or so until the temperature reads 145°F for a certain number of times in a row. When it reaches that threshold, our phone will signal that our roast is cooked.

If the phone records every temperature reading in one variable (one place in memory), we would have what is generally referred to as a "list" of data. Lists are sequential data, meaning they represent a sequence of values, in this case the list of temperatures read by our thermometer as our roast cooked.

<figure>
	<img src="./images/data-temp.gif" alt="Simulation of a thermometer measuring the temperature of a roast">
	<figcaption>Simulation of a thermometer measuring the temperature of a roast</figcaption>
</figure>

Lists are the most common compound data type on a computer. Many things can be represented as lists. We could have a list of boolean values representing a number of coin flips, with `true` equal to heads and `false` equal to tails.

Being sequential, the only thing we know about each individual piece of data in a list is where it is in the list, this is called an index. If I have a list that has four temperature values, it might look like this `[105.6, 105.7, 105.4, 105.9]` if we were to draw a human-readable representation of the list as the computer sees it (the computer will see the list very differently). Thinking about lists as sequences, we can say that `105.6` is at index `0`, `105.7` is at index `1`, `105.4` is at index `2`, and `105.9` is at index `3`. Why start with index `0`? Because computers are just like that.

But the index of each piece of data and the data itself are all we know about each element of a list.

That said, we can still do a lot of things with lists. For instance, we can sort them from lowest to highest or highest to lowest. We could also filter a list, removing elements we don't want.

Everyday examples of lists include things such as data on a pedometer or other fitness trackers, stock prices recorded througout the day, or anything else that evolves in sequence.

Lists can also contain other lists, making them multidimensional. Spreadsheets are examples of multidimensional lists, with each row (or column) being a list and each cell within the list being an entry in that list.

As we'll see below, lists are also important to how we represent text as data.

### Dictionary Compound Data

A "dictionary" is the second common type of compound data. Think about how a print dictionary works. You need to look up the meaning of the word. You go to the word's entry in the dictionary. You find the entry on the page. You read the definition.

If we can abstract from this example and think in terms of data, a printed dictionary is a structure for associating two pieces of information: a word and a definition. It also provides a convenients means of finding entries by alphabetizing entries for us.



# Why Data Matters to Writing

<figure>
	<img src="./images/data-cursive.gif" alt="Writing in Cursive">
	<figcaption>Writing in Cursive</figcaption>
</figure>

<figure>
	<img src="./images/data-print.gif" alt="Writing in Print">
	<figcaption>Writing in Print</figcaption>
</figure>

# Plain Text: Writing as Data

# Data as Writing
