import 'package:design_patterns/design_pattern/chain_of_responsibility/dog.dart';

class PetRequest {
  final bool ignoreCuteness;
  final bool ignoreDanger;
  final Dog dog;

  PetRequest({
    required this.dog,
    required this.ignoreCuteness,
    required this.ignoreDanger,
  });
}
