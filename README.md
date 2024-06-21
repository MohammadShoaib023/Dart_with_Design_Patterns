
###Design Patterns in Dart


This repository provides examples of common design patterns implemented in Dart. Design patterns are reusable solutions to common software design problems that have been refined over time. They help developers create software that is more maintainable, flexible, and scalable.

##Creational Patterns
1. Factory Method
Intent: Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.

Example: Creating furniture (chairs and coffee tables) using different factories for Victorian and Modern styles.

Factory Method Example in Dart
2. Abstract Factory
Intent: Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

Example: Creating furniture factories that produce chairs and coffee tables of related styles (Victorian and Modern).

Abstract Factory Example in Dart
3. Builder
Intent: Separate the construction of a complex object from its representation, allowing the same construction process to create different representations.

Example: Building complex objects step by step, like creating a meal with specific items.

Builder Example in Dart
4. Singleton
Intent: Ensure a class has only one instance and provide a global point of access to it.

Example: Creating a single configuration manager or logger instance that is globally accessible.

Singleton Example in Dart
5. Prototype
Intent: Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

Example: Cloning objects like shapes or documents to create new instances quickly.

Prototype Example in Dart
Structural Patterns
6. Adapter
Intent: Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.

Example: Adapting square pegs to fit into round holes by creating an adapter that translates the interface.

Adapter Example in Dart
7. Bridge
Intent: Decouple an abstraction from its implementation so that the two can vary independently.

Example: Connecting different shapes (abstraction) with different rendering devices (implementation).

Bridge Example in Dart
8. Composite
Intent: Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.

Example: Creating nested structures like file systems where files and directories can be treated uniformly.

Composite Example in Dart
9. Decorator
Intent: Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.

Example: Adding new features (like colors or borders) to shapes without modifying their classes directly.

Decorator Example in Dart
10. Facade
Intent: Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.

Example: Creating a simplified interface to a complex system like a video processing framework.

Facade Example in Dart
11. Flyweight
Intent: Use sharing to support large numbers of fine-grained objects efficiently.

Example: Managing large numbers of objects with shared intrinsic state, like managing properties of trees in a forest.

Flyweight Example in Dart
12. Proxy
Intent: Provide a surrogate or placeholder for another object to control access to it.

Example: Controlling access to sensitive objects like bank accounts through a proxy that manages permissions.

Proxy Example in Dart
Behavioral Patterns
13. Chain of Responsibility
Intent: Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.

Example: Processing requests through a chain of handlers, where each handler decides whether to process the request or pass it to the next handler.

Chain of Responsibility Example in Dart
14. Command
Intent: Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations.

Example: Implementing operations (like file operations) as command objects that can be queued, logged, or undone.

Command Example in Dart
15. Interpreter
Intent: Given a language, define a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language.

Example: Implementing a parser that interprets expressions in a custom query language.

Interpreter Example in Dart
16. Iterator
Intent: Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

Example: Creating iterators to traverse collections like lists or trees without exposing their internal structure.

Iterator Example in Dart
17. Mediator
Intent: Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly and allows their interaction to vary independently.

Example: Implementing chat rooms where users communicate through a mediator object that manages message broadcasting.

Mediator Example in Dart
18. Memento
Intent: Without violating encapsulation, capture and externalize an object's internal state so that the object can be restored to this state later.

Example: Implementing undo mechanisms by saving and restoring the state of objects.

Memento Example in Dart
19. Observer
Intent: Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

Example: Implementing event listeners or subscriptions where multiple objects (observers) react to changes in a subject.

Observer Example in Dart
20. State
Intent: Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.

Example: Implementing a state machine where an object's behavior changes based on its internal state.


21. Strategy
Intent: Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

Example: Implementing sorting algorithms that can be switched dynamically based on client requirements.

Strategy Example in Dart
22. Template Method
Intent: Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing its structure.

Example: Creating a template for building houses where specific construction steps can vary.

Template Method Example in Dart
23. Visitor
Intent: Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

Example: Implementing operations (like calculations) on elements of a complex object structure without modifying those elements.

