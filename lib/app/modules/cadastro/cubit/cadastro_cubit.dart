import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/repository/task_repository.dart';

part 'cadastro_state.dart';

class CadastroCubit extends Cubit<CadastroState> {

  final TaskRepository _repository;
  CadastroCubit({required TaskRepository repository}) : _repository = repository, super(CadastroInitial());

  void createTask({required Task task}) async{
    final create = await _repository.createTask(task);
    if(create){
      emit(CadastroLoaded());
      // emit(CadastroError(erro: 'Erro ao cadastrar'));
    }
  }
}
