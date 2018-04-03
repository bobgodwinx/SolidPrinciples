# SOLID Principles

This is a Focus on SOLID Principles but from `Swift` point of view. Contributions are welcomed. 

## Contents:
- [Single Responisibility](#Single-Responsibility)
- [Open Closed](#Open-Closed)

### Single-Responsibility

So the Gang of Four laid the first foundation of OOP design patterns more than 2 decades ago, it’s outdated in my opinion. But it could still be useful when adhering to clean code. This very first principle states that a class should do only one job! Yes this is the meaning of single responsibility and there is no need to sugar coat it. “A class = performs one operation” simple and stupid. 

Please see complete [article](https://medium.com/@bobgodwinx/solid-principles-part-1-f3d11b3159f0) on medium. <br />
The example code is also available on [Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/SingleResponsibility.playground/Contents.swift)

### Open-Closed

The Open Closed principle enforces a rule that a class can be easily extended but at the same time forbids any modification to it’s self. This principle highly draws it’s traits from the Decorator & Strategy pattern. The Decorator allows extension of behaviour dynamically or statically during runtime. It is often referred to as “the alternative to subclassing”, while the Strategy allows implementation of different algorithms interchangeable within the same family.

Please see complete [article](https://medium.com/@bobgodwinx/solid-principles-part-2-a22d4c8ed906) on medium. <br />
The example code is also available on [Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/OpenClosed.playground/Contents.swift)

### Liskov Substitution 

So the Liskov substitution principle states that all derived class should be substitutable for it’s original base class. What this means in practice is that a subclass should always be interchangeable for it’s super class. The main purpose of this principle is to guarantee semantic interoperability within the types hierarchy
Please see complete [article](https://medium.com/@bobgodwinx/solid-principles-part-3-43aad943b056) on medium. <br />
The example code is also available on [Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/LiskovSubstitution.playground/Contents.swift)
