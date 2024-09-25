abstract class CommonState {}

// Define common states
class MainInitial extends CommonState {}
class MainLoading extends CommonState {}
class MainError extends CommonState {
  final String message;
  MainError(this.message);
}
