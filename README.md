<h1 align="left">
  99 Bottles of OOP
  <sub><br />Sandi Metz</sub>
</h1>

<img
  alt="99 Bottles of OOP"
  width="45%"
  align="right"
  src="https://user-images.githubusercontent.com/4058722/108829391-e3b14a80-75a6-11eb-8b49-9ebf54dab410.jpg"
/>
<br />

<p align="left">
  <img
    alt="Ruby Version"
    src="https://img.shields.io/badge/ruby-2.7.0-ab1501?style=for-the-badge&logo=ruby"
  />
  <img
    alt="Minitest Version"
    src="https://img.shields.io/badge/minitest-5.4-ab1501?style=for-the-badge"
  />
  <br />
</p>

<p align="left">
  <a href="#bookmark-about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#floppy_disk-dependencies">Dependencies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#link-links">Links</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#black_nib-notes">Notes</a>
</p>
<br />

## :bookmark: About

  * Object Oriented Design
  * SOLID Principles
  * Managing dependencies
  * Organizing interfaces
  * Duck Typing
  * Code Smells
  * Refactoring Techniques
  * Test Design

## :floppy_disk: Dependencies

-  [Ruby](https://www.ruby-lang.org/) - v2.7.0
-  [Minitest](https://github.com/seattlerb/minitest) - v5.4

## :link: Links

- [Practical Object Oriented Design in Ruby](https://sandimetz.com/99bottles-sample-ruby)


## :black_nib: Notes

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

## Chapter 4

  Liskov principle says every subclass should be substitutable by its superclass.
That can be extended to duck types. When a duck plays a role, it has to implement
every rule of that role. It has to be consistent and predictable.

  "Liskov prohibits you from doing anything that would force the sender of a message
to test the returned result in order to know how to behave."- Sandi Metz

## Chapter 5

  In this chapter the non object oriented approach of the flocked five methods,
that obsess over the number argument, know the conditions and supply behavior
(known as Primitive Obsession) is substituted for a message send to the
BottleNumber class.

  💡 "As an OO practitioner, when you see a conditional, the hairs on your neck should
stand up. Its very presence ought to offend your sensibilities. You should feel
entitled to send  messages to objects, and look for a way to write code that allows
you to do so. The above pattern means that objects are missing, and suggests that
subsequent refactorings are needed to reveal them. Be on the lookout for this code
shape, as it implies that there’s more to be done." - Sandi Metz.

  💡 "Manageable OO applications consist of pools of small objects that collaborate
to accomplish tasks. [...] However, there’s a big difference between a conditional
that selects the correct object and one that supplies behavior. The first is
acceptable and generally unavoidable. The second suggests that you are missing
objects in your domain." - Sandi Metz.

  💡 "Obsessing on a primitive results in code that passes built-in types around
and supplies behavior for them." - Sandi Metz

  Primitive Obsession should be cured with Extract Class recipe. The logic should
be extracted to an object to be used in place of the primitive.

### Immutability

  Immutable objects are ones that do not change. In a functional world when a cup
of coffee is empty it does not get refilled, it actually gets replaced by a new
cup of coffee already full. As everything in life it comes with costs and benefits.
The benefit of never mutating objects is that those objects are highly stable and
predictable. The cost is that creating a new object every time it needs change may
affect performance.

### Caching

  A cache is a local copy of something stored elsewhere. Saving a local copy of
the results of an expensive operation, or caching it, increases the speed of your
application, and lower costs.
  Caching is easy, figuring out when update is needed is not. Sometimes the cache
management is so complicated that is not worth the trouble.

## Chapter 6

  💡 "Data Clump is defined as the situation in which several (three or more)
data fields routinely occur together." - Sandi Metz

  The Switch Statement code smell may be cured with the following recipes:

  1. Replace Conditional with State/Strategy
    Uses composition to disperse conditions branches into smaller objects,
    selected and plugged back in at runtime.

  2. Replace Conditional with Polymorphism
    Uses inheritance to create a superclass that holds the default (false branch)
    and adds subclasses for the true branches, also selected and plugged back in
    at runtime.

  *** Replace Conditional with Polymorphism Recipe ***

    1. Create a subclass to stand in for the value upon which you switch.
      a. Copy one method that switches on that value into the subclass.
      b. In the subclass, remove everything but the true branch of the conditional.
        i. At this point, create a factory if it does not yet exist, and
        ii. Add this subclass to the factory if not yet included.

      c. In the superclass, remove everything but the false branch of the conditional.
      d. Repeat steps a-c until all methods that switch on the value are dispersed.

    2. Iterate until a subclass exists for every different value upon which you switch.

  💡 "Make the change easy (warning: this may be hard), then make the easy change"
  — Kent Beck

## Chapter 7

  Factories don't know how to do stuff, instead they know how to choose who does.
Breaking that knowledge apart is object oriented programming.

  Factories vary along these dimensions and each has its trade-offs:

    1. The factory can be open to new variants or closed.
    2. The logic that chooses a variant can be owned by the factory or by the variant.
    3. The factory can be responsible for knowing/figuring out which classes are
       eligible to be manufactured or the variants can volunteer themselves.

## Chapter 8

  A technique that may be a little risky but that is quite efficient is Wishful
Thinking. It was used in this example to reveal the lyrics method in BottleVerse.
That was done by asking the class Bottles what does she want.

💡 "Isolating variants often requires that you invert dependencies, and an excellent
  technique for inverting dependencies is to inject them. This section isolated
  the BottleVerse variant and then inverted the dependency by injecting
  BottleVerse as a player of the verse template role." - Sandi Metz

  Train wrecks generate code that is tightly coupled, have large contexts and
therefore is hard to reuse. That is a violation of the Law of Demeter that states:

  a) objects that are passed in as arguments to the method
  b) objects that are directly available to self

## Chapter 9

  Tests are not only meant to check the correctness of the code. They also serve
as documentation and disclose coupling reusability issues. They should be easy
to create simple and intention revealing.
  Unit tests may require other objects to collaborate, but they address only the
unit of interest. Integration tests are meant to prove that groups of objects
collaborate with each other correctly. They test the entire chain of behavior.
  General approach should be to create unit tests for every class, that test the
public API. And that should be started on the smallest, simplest, most untangled
object.

  💡 100% test coverage == 100% of the code should be exercised during unit tests
    100% test coverage != 100% of the public methods should have their own personal tests

  Tests that are too much coupled to implementation details should be omitted.
While all code needs to be tested, some tests aren’t worth writing.

  💡 "Object oriented programming rule that prohibits the use of pattern names in
   class names. [...] Class names should reflect concepts in your domain, not the
   patterns used to create them."

  When designed with the following features, object-oriented code can interact
with new and unanticipated variants without having to change:

  1. Variants are isolated.
    They’re usually isolated in some kind of object, often a new class.

  2. Variant selection is isolated.
    Selection happens in factories, which may be as simple as isolated conditionals
    that choose a class.

  3. Message senders and receivers are loosely coupled.
    This is commonly accomplished by injecting dependencies.

  4. Variants are interchangeable.
    Message senders treat injected objects as equivalent players of identical roles.
