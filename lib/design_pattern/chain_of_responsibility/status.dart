abstract class IStatus {}

class Idle implements IStatus {}

class Loading implements IStatus {}

class Success implements IStatus {}

class Failure implements IStatus {
  final String errorMessage;

  Failure({required this.errorMessage});
}
