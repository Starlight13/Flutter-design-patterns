import 'package:design_patterns/design_pattern/chain_of_responsibility/pet_request.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/status.dart';
import 'package:flutter/material.dart';

class Handler {
  Handler? next;

  final String name = 'Base handler';

  ValueNotifier<IStatus> status;

  bool canHandle(PetRequest petRequest) => true;

  Handler({this.next}) : status = ValueNotifier(Idle());

  Future<bool> handle(PetRequest petRequest) async {
    return await next?.handle(petRequest) ?? true;
  }

  void reset() {
    status.value = Idle();
    next?.reset();
  }
}
