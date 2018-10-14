# Proj1

## Problem Statement

An interesting problem in arithmetic with deep implications to elliptic curve theory is the problem of finding perfect squares that are sums of consecutive squares.  

A classic example is the Pythagorean identity:  
```
3^2 + 4^2 = 5^2 
```
A more interesting
example is Lucas‘ Square Pyramid:
```
1^2 +2^2 +...+24^2 =70^2
```

The goal of this first project is to use Elixir and the actor model to build a good solution to this problem that runs well on multi-core machines.

## Installation

After unzipping the project, cd into the root directory:

```bash
cd proj1
```

Run proj1.exs with two command line arguments N and k

The program finds all k consecutive numbers starting at 1 and upto N, such that the sum of squares is a perfect square. 

```bash
mix run proj1.exs 1000000 4
```