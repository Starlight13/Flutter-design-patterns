import 'package:design_patterns/widget/design_pattern/abstract_factory/abstract_factory_widget.dart';
import 'package:design_patterns/widget/design_pattern/adapter/adapter_widget.dart';
import 'package:design_patterns/widget/design_pattern/builder/builder_widget.dart';
import 'package:design_patterns/widget/design_pattern/composite/composite_widget.dart';
import 'package:design_patterns/widget/design_pattern/decorator/decorator_widget.dart';
import 'package:design_patterns/widget/design_pattern/factory_method/factory_method_widget.dart';
import 'package:design_patterns/widget/design_pattern/flyweight/flyweight_widget.dart';
import 'package:design_patterns/widget/design_pattern/memento/memento_widget.dart';
import 'package:design_patterns/widget/design_pattern/observer/observer_widget.dart';
import 'package:design_patterns/widget/design_pattern/prototype/prototype_widget.dart';
import 'package:design_patterns/widget/design_pattern/proxy/proxy_widget.dart';
import 'package:design_patterns/widget/design_pattern/singleton/singleton_widget.dart';
import 'package:design_patterns/widget/design_pattern/strategy/strategy_widget.dart';
import 'package:flutter/material.dart';

class DesignPatternWidgetFactory {
  static Widget createWidget(String id) {
    switch (id) {
      case 'singleton':
        return const SingletonWidget();
      case 'abstract_factory':
        return const AbstractFactoryWidget();
      case 'factory_method':
        return const FactoryMethodWidget();
      case 'builder':
        return const BuilderWidget();
      case 'flyweight':
        return const FlyweightWidget();
      case 'proxy':
        return const ProxyPatternWidget();
      case 'composite':
        return const CompositeWidget();
      case 'decorator':
        return const DecoratorWidget();
      case 'adapter':
        return const AdapterWidget();
      case 'strategy':
        return const StrategyWidget();
      case 'memento':
        return const MementoWidget();
      case 'prototype':
        return const PrototypeWidget();
      case 'observer':
        return const ObserverWidget();
    }
    return const Center(
      child: Text('Unknown design pattern'),
    );
  }
}
