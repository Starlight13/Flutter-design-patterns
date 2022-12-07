import 'package:design_patterns/data/model/design_pattern.dart';

final List<DesignPattern> designPatternsList = [
  DesignPattern(
    'singleton',
    title: 'Singleton',
    description: 'Creating a single instance of an object',
    patternClassName: PatternClassName.creational,
  ),
  DesignPattern(
    'builder',
    title: 'Builder',
    description: 'Creating complex objects step-by-step',
    patternClassName: PatternClassName.creational,
  ),
  DesignPattern(
    'abstract_factory',
    title: 'Abstract factory',
    description: 'Creating different object of the same object family',
    patternClassName: PatternClassName.creational,
  ),
  DesignPattern(
    'factory_method',
    title: 'Factory method',
    description: 'Defer object instantiation to subclasses',
    patternClassName: PatternClassName.creational,
  ),
  DesignPattern(
    'prototype',
    title: 'Prototype',
    description: 'Copy existing objects without depending on their classes',
    patternClassName: PatternClassName.creational,
  ),
  DesignPattern(
    'flyweight',
    title: 'Flyweight',
    description: 'Reduce RAM consumption',
    patternClassName: PatternClassName.structural,
  ),
  DesignPattern(
    'proxy',
    title: 'Proxy',
    description: 'Substitute another object',
    patternClassName: PatternClassName.structural,
  ),
  DesignPattern(
    'composite',
    title: 'Composite',
    description: 'Deal with complex objects organized in a tree',
    patternClassName: PatternClassName.structural,
  ),
  DesignPattern(
    'decorator',
    title: 'Decorator',
    description: 'Attach new behaviors to objects',
    patternClassName: PatternClassName.structural,
  ),
  DesignPattern(
    'adapter',
    title: 'Adapter',
    description: 'Allow objects with incompatible interfaces to collaborate',
    patternClassName: PatternClassName.structural,
  ),
  DesignPattern(
    'strategy',
    title: 'Strategy',
    description: 'Create a family of interchangeable algorithms',
    patternClassName: PatternClassName.behavioral,
  ),
  DesignPattern(
    'memento',
    title: 'Memento',
    description: 'Save and restore the previous state of an object',
    patternClassName: PatternClassName.behavioral,
  ),
  DesignPattern(
    'observer',
    title: 'Observer',
    description: 'Subscription mechanism to notify multiple objects '
        'of observed object events',
    patternClassName: PatternClassName.behavioral,
  ),
];
