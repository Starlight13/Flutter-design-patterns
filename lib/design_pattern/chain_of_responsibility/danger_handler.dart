import 'package:design_patterns/design_pattern/chain_of_responsibility/handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/pet_request.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/status.dart';

class DangerHandler extends Handler {
  @override
  String get name => 'Danger handler';

  @override
  bool canHandle(PetRequest petRequest) => !petRequest.ignoreDanger;

  @override
  Future<bool> handle(PetRequest petRequest) async {
    if (canHandle(petRequest)) {
      status.value = Loading();
      await Future.delayed(const Duration(seconds: 1), () {});
      if (petRequest.dog.dangerLevel < 3) {
        status.value = Success();
      } else {
        status.value = Failure(errorMessage: 'Too dangerous');
        return false;
      }
    }
    return super.handle(petRequest);
  }
}
