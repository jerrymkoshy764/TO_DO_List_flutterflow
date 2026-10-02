// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodolistStruct extends BaseStruct {
  TodolistStruct({
    List<TodosStruct>? todos,
    int? total,
    int? skip,
    int? limit,
  })  : _todos = todos,
        _total = total,
        _skip = skip,
        _limit = limit;

  // "todos" field.
  List<TodosStruct>? _todos;
  List<TodosStruct> get todos => _todos ?? const [];
  set todos(List<TodosStruct>? val) => _todos = val;

  void updateTodos(Function(List<TodosStruct>) updateFn) {
    updateFn(_todos ??= []);
  }

  bool hasTodos() => _todos != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "skip" field.
  int? _skip;
  int get skip => _skip ?? 0;
  set skip(int? val) => _skip = val;

  void incrementSkip(int amount) => skip = skip + amount;

  bool hasSkip() => _skip != null;

  // "limit" field.
  int? _limit;
  int get limit => _limit ?? 0;
  set limit(int? val) => _limit = val;

  void incrementLimit(int amount) => limit = limit + amount;

  bool hasLimit() => _limit != null;

  static TodolistStruct fromMap(Map<String, dynamic> data) => TodolistStruct(
        todos: getStructList(
          data['todos'],
          TodosStruct.fromMap,
        ),
        total: castToType<int>(data['total']),
        skip: castToType<int>(data['skip']),
        limit: castToType<int>(data['limit']),
      );

  static TodolistStruct? maybeFromMap(dynamic data) =>
      data is Map ? TodolistStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'todos': _todos?.map((e) => e.toMap()).toList(),
        'total': _total,
        'skip': _skip,
        'limit': _limit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'todos': serializeParam(
          _todos,
          ParamType.DataStruct,
          isList: true,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'skip': serializeParam(
          _skip,
          ParamType.int,
        ),
        'limit': serializeParam(
          _limit,
          ParamType.int,
        ),
      }.withoutNulls;

  static TodolistStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodolistStruct(
        todos: deserializeStructParam<TodosStruct>(
          data['todos'],
          ParamType.DataStruct,
          true,
          structBuilder: TodosStruct.fromSerializableMap,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        skip: deserializeParam(
          data['skip'],
          ParamType.int,
          false,
        ),
        limit: deserializeParam(
          data['limit'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TodolistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TodolistStruct &&
        listEquality.equals(todos, other.todos) &&
        total == other.total &&
        skip == other.skip &&
        limit == other.limit;
  }

  @override
  int get hashCode => const ListEquality().hash([todos, total, skip, limit]);
}

TodolistStruct createTodolistStruct({
  int? total,
  int? skip,
  int? limit,
}) =>
    TodolistStruct(
      total: total,
      skip: skip,
      limit: limit,
    );
