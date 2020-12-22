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

Some of Kent Beck's "Green Bar Patterns" that describe ways to make tests pass:

  1. Fake It ("Til You Make It")
  2. Obvious Implementation
  3. Triangulate

  The idea is that by taking very tiny steps and writing the simplest code possible
just to make the test green, will incrementally reveal the correct implementation.
Skipping steps may lead to mistakes that will cascade to the next tests.
  Triangulate, is described as a way to "conservatively drive abstraction with
tests". Multiple tests should be written at once and the code should be thought
to pass all the tests. This should lead you to the correct abstraction.

  Test should be completely ignorant about the object in test. Each method should
be tested in isolation of every other, as if they didn't exist.

> 💡 Tests are the place for concretion, not abstractions, those belong in code.

  The attempt to dry out the code by using abstractions in the test, force you
to mirror the object under test knowledge. That couples both objects, making the
test prone to break unnecessarily in every detail change or even return false
positives.

## Chapter 3 - Unearthing Concepts

  Implementing a new requirement is more than simply adjusting the new code to
accomplish the feature. Before touching the code, it's necessary to determine if
the code is open to receive that new addition. The Open/Closed (the O in SOLID)
principle should be applied:

> 💡 Open/Closed: Objects should be open for extension and closed for modification.

  Code is open to a new requirement when you can meet that new requirement without
changing existing code. In case it is not open, then it needs to be refactored in
order to become open and then the addition should follow. Refactoring and additions
should not overlap.
  The following chart steps will help achieving the open state:

                +-------------+                      +--------------+
                |             | Yes                  |   Make the   |
      --------->| is it open? |--------------------->|    change    |
      |         |             |              ^       +--------------+
      |         +------+------+              |
      |                | No                  |
      |                |                     |
      |                v                     |
      |        +---------------+             |
      |        |  Do you know  | Yes  +------------+
      |        |  how to make  |----->|  Make it   |
      |        |   it open?    |      |    open    |
      |        +---------------+      +------------+
      |                | No
      |                |
      |                v
      |        +-------+---------+
      |        | Remove the      |
      ---------| easiest to fix/ |
               | best understood |
               | code smell      |
               +-----------------+

  While refactoring it's important not to take several steps at a time. That will
help unearth abstractions along with very explicit errors in the tests.
  If the abstraction is hard to find then concentrating on removing code smells
may lead in that way. And those should be removed by following the `Flocking Rules`

*** Flocking Rules ***

    1) Select thing that are most alike
    2) Find the smallest difference between them
    3) Make the simplest that will remive that difference
      a) Parse the new code
      b) Parse and execute it
      c) Parse, execute and use its results
      d) Delete unused code

    * For now, change only one line at a time.
    * Run the tests after every change.
    * If the tests fail, undo and make a better change

> 💡 The focus here is encapsulating the concept that varies, a theme of many
design patterns. - Gang of Four

"Difference holds the key to understanding. If two concrete examples represent
the same abstraction and they contain a difference, that difference must represent
a smaller abstraction within the larger one. If you can name the difference,
you’ve identified that smaller abstraction." - Sandi Metz
