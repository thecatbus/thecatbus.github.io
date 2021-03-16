---
title: Think like a DFA
author: Parth
tags: logic
---
A page stolen from Tom Forster's book, here is a neat way to think about recursively enumerable languages (i.e. the languages recognised by a Deterministic Finite Automaton). Suppose you are sitting in a cabin in the middle of the forest, and are being sent an infinite stream of symbols. Every time you see a new symbol, you are supposed to flip a switch saying whether or not the string received _so far_ is in the language $L$.

Tired, you wish to take a break and let your assistant take over. How much information about the string you have seen so far do you need to convey to the assistant, so that they can continue operating the switch? The least amount of information you could get away with passing on gives the number of states in the smallest DFA which recognises $L$.

<!--more-->
