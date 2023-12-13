import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
part 'task.g.dart';

@collection
class Task {
  final Id? id;
  final String? tarefa;
  final String? descricao;
  final bool status;
  Task({
    this.id,
    this.tarefa,
    this.descricao,
    required this.status,
  });

  Task copyWith({
    ValueGetter<Id?>? id,
    ValueGetter<String?>? tarefa,
    ValueGetter<String?>? descricao,
    bool? status,
  }) {
    return Task(
      id: id?.call() ?? this.id,
      tarefa: tarefa?.call() ?? this.tarefa,
      descricao: descricao?.call() ?? this.descricao,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tarefa': tarefa,
      'descricao': descricao,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id']?.toInt(),
      tarefa: map['tarefa'],
      descricao: map['descricao'],
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, tarefa: $tarefa, descricao: $descricao, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Task &&
      other.id == id &&
      other.tarefa == tarefa &&
      other.descricao == descricao &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      tarefa.hashCode ^
      descricao.hashCode ^
      status.hashCode;
  }
}
