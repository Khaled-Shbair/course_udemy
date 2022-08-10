abstract class States {}

class NewsInitialsState extends States {}

class NewBottomNavState extends States {}

class LoadingState extends States {}
class SuccessState extends States {}

class ErrorState extends States {
  final String error;

  ErrorState(this.error);
}
