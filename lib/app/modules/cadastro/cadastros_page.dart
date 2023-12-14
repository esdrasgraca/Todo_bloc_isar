import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/modules/cadastro/cubit/cadastro_cubit.dart';

class CadastrosPage extends StatefulWidget {
  final CadastroCubit controller;
  const CadastrosPage({super.key, required this.controller});

  @override
  State<CadastrosPage> createState() => _CadastrosPageState();
}

class _CadastrosPageState extends State<CadastrosPage> {
  final tarefaEC = TextEditingController();
  final descricaoEC = TextEditingController();
  bool checked = false;

  @override
  void dispose() {
    tarefaEC.dispose();
    descricaoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CadastroCubit, CadastroState>(
      listener: (context, state){
        if(state is CadastroLoaded ) {
          Navigator.of(context).pop(true);
        }
        
        if(state is CadastroError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.erro ?? '')));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(),
                TextFormField(
                  controller: tarefaEC,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: descricaoEC,
                ),
                const SizedBox(
                  height: 40,
                ),
                Checkbox(
                    value: checked,
                    onChanged: (val) {
                      setState(() {
                        checked = (val ?? false);
                      });
                    }),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.controller.createTask(
                        task: Task(
                            tarefa: tarefaEC.text,
                            descricao: descricaoEC.text,
                            status: checked));
                  },
                  child: Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
