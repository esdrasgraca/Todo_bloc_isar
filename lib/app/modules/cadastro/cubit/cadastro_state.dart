part of 'cadastro_cubit.dart';

@immutable
sealed class CadastroState {}

final class CadastroInitial extends CadastroState {}
final class CadastroLoading extends CadastroState {}
final class CadastroLoaded extends CadastroState {}
final class CadastroError extends CadastroState {
  final String? erro;

  CadastroError({ this.erro});
}
