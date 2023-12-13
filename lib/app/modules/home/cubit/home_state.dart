part of 'home_cubit.dart';


sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {}
final class HomeLoaded extends HomeState {
  final List<Task>? tasks;
  
  HomeLoaded({
    this.tasks
  });
  
}
