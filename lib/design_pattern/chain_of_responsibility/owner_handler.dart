import 'package:design_patterns/design_pattern/chain_of_responsibility/handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/pet_request.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/status.dart';

class OwnerHandler extends Handler {
  @override
  String get name => 'Owner handler';

  @override
  Future<bool> handle(PetRequest petRequest) async {
    if (canHandle(petRequest)) {
      status.value = Loading();
      await Future.delayed(const Duration(seconds: 1), () {});
      if (petRequest.dog.isPet) {
        status.value = Failure(errorMessage: 'Ask the owner');
        return false;
      } else {
        status.value = Success();
      }
    }
    return super.handle(petRequest);
  }
}
