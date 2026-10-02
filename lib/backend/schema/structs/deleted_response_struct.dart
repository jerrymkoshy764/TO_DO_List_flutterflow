// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeletedResponseStruct extends BaseStruct {
  DeletedResponseStruct({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
    bool? isDeleted,
    String? deletedOn,
  })  : _id = id,
        _todo = todo,
        _completed = completed,
        _userId = userId,
        _isDeleted = isDeleted,
        _deletedOn = deletedOn;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "todo" field.
  String? _todo;
  String get todo => _todo ?? '';
  set todo(String? val) => _todo = val;

  bool hasTodo() => _todo != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "deletedOn" field.
  String? _deletedOn;
  String get deletedOn => _deletedOn ?? '';
  set deletedOn(String? val) => _deletedOn = val;

  bool hasDeletedOn() => _deletedOn != null;

  static DeletedResponseStruct fromMap(Map<String, dynamic> data) =>
      DeletedResponseStruct(
        id: castToType<int>(data['id']),
        todo: data['todo'] as String?,
        completed: data['completed'] as bool?,
        userId: castToType<int>(data['userId']),
        isDeleted: data['isDeleted'] as bool?,
        deletedOn: data['deletedOn'] as String?,
      );

  static DeletedResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? DeletedResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'todo': _todo,
        'completed': _completed,
        'userId': _userId,
        'isDeleted': _isDeleted,
        'deletedOn': _deletedOn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'todo': serializeParam(
          _todo,
          ParamType.String,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'deletedOn': serializeParam(
          _deletedOn,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeletedResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeletedResponseStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        todo: deserializeParam(
          data['todo'],
          ParamType.String,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        deletedOn: deserializeParam(
          data['deletedOn'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeletedResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeletedResponseStruct &&
        id == other.id &&
        todo == other.todo &&
        completed == other.completed &&
        userId == other.userId &&
        isDeleted == other.isDeleted &&
        deletedOn == other.deletedOn;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, todo, completed, userId, isDeleted, deletedOn]);
}

DeletedResponseStruct createDeletedResponseStruct({
  int? id,
  String? todo,
  bool? completed,
  int? userId,
  bool? isDeleted,
  String? deletedOn,
}) =>
    DeletedResponseStruct(
      id: id,
      todo: todo,
      completed: completed,
      userId: userId,
      isDeleted: isDeleted,
      deletedOn: deletedOn,
    );
