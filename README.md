# 99 Bottles of OOP by Sandi Metz

## Chapter 1 - Rediscovering Simplicity

### Making the Code Clear

In order to be comprehensible code needs to expose the problem's domain. If that doesn't occur, probably the code was hard to write and will be hard to change. In order to reflect the domain, it has to answer the following questions:

*** Domain Questions ***

  1. How many verse variants are there?
  2. Which verses are most alike? In what way?
  3. Which verses are most different? In what way?
  4. What is the rule to determine which verse should be sung next?

*** Cost/Value Questions ***

  1. How difficult was it to write?
  2. How hard is it to understand?
  3. How expensive will it be to change?

### Naming Methods

  Even a code that respects the DRY principle may force you to make changes in
several places. Naming your methods with the wrong abstractions may force those
changes. To avoid that, methods should not be named after what they do but after
what they mean (the concept/abstraction they represent).

> 💡 Methods should be named after what they represent in the context of your domain.

### Knowing When to Stop

  Assuming too much without having the whole context may lead you to write
unnecessary complex code. It's important to know when your code is *good enough*
for now and stop abstracting do to lack of present knowledge and postpone it
until you know enough to make better choices. Recovering from an incorrect
abstraction will be much harder than dealing with the current duplication.

### Metrics

  1. SLOC: Source Lines of Code. It measures code volume but lacks answers on
  quality and efficiency.

  2. Cyclomatic Complexity: Identifies code that is difficult to test or maintain.
  It does it by counting the number of execution paths. It maps all routes of every
  conditional. A deeply nested method scores high and therefore is low quality code.
  It can be used to:

    * compare code
    * limit acceptable complexity
    * test coverage

  3. ABC: Assignments, Branches and Conditions. This metric measures variable
  assignment and message sends, that Cyclomatic Complexity fails to do.

    * Assignments: counts variable assignments
    * Branches: function calls and message sends (branches of control)
    * Conditions: counts conditional logic

  A nifty ABC-ish tool for ruby is [Flog](https://ruby.sadi.st/Flog.html).

## Chapter 2 - Test Driving Shameless Green

  The TDD (Test Driven Development) mantra says code should be produced by
following a reg/green/refactor cycle.

> “Quick Green excuses all sins.“ - Kent Beck

  The above phrase means that by using TDD you should concentrate on writing the
simplest piece of code possible to get the test to pass. The focus should be on
maximum understandability instead of changeability.

  Tolerating some duplication is fine as long as the benefit of understandability
is still relevant. Premature usage of the DRY principle may lead to incorrect
abstractions that will hide and make harder to comprehend the context as a whole
due to the indirections.

> 💡 The use of case implies that the condition tested remains the same. If/elsif
  means that each condition varies in a meaningful way.
