// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_datas.dart';

// ignore_for_file: type=lint
class $ChatsTableTable extends ChatsTable
    with TableInfo<$ChatsTableTable, ChatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ChatType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<ChatType>($ChatsTableTable.$convertertype);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<int> targetId = GeneratedColumn<int>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedColumn<int> unread = GeneratedColumn<int>(
    'unread',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    sourceId,
    targetId,
    unread,
    content,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chats';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(
        _unreadMeta,
        unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $ChatsTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_id'],
      )!,
      unread: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ChatsTableTable createAlias(String alias) {
    return $ChatsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ChatType, int, int> $convertertype =
      const EnumIndexConverter<ChatType>(ChatType.values);
}

class ChatsTableData extends DataClass implements Insertable<ChatsTableData> {
  /// 会话标识
  final int id;

  /// 会话类型
  final ChatType type;

  /// 会话发起：用户标识/群组标识
  final int sourceId;

  /// 会话接收：用户标识/群组标识
  final int targetId;

  /// 会话未读
  final int unread;

  /// 消息内容
  final String content;

  /// 创建时间：会话创建
  final int createdAt;

  /// 修改时间：最后消息
  final int? updatedAt;
  const ChatsTableData({
    required this.id,
    required this.type,
    required this.sourceId,
    required this.targetId,
    required this.unread,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<int>($ChatsTableTable.$convertertype.toSql(type));
    }
    map['source_id'] = Variable<int>(sourceId);
    map['target_id'] = Variable<int>(targetId);
    map['unread'] = Variable<int>(unread);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    return map;
  }

  ChatsTableCompanion toCompanion(bool nullToAbsent) {
    return ChatsTableCompanion(
      id: Value(id),
      type: Value(type),
      sourceId: Value(sourceId),
      targetId: Value(targetId),
      unread: Value(unread),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ChatsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatsTableData(
      id: serializer.fromJson<int>(json['id']),
      type: $ChatsTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      targetId: serializer.fromJson<int>(json['targetId']),
      unread: serializer.fromJson<int>(json['unread']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<int>(
        $ChatsTableTable.$convertertype.toJson(type),
      ),
      'sourceId': serializer.toJson<int>(sourceId),
      'targetId': serializer.toJson<int>(targetId),
      'unread': serializer.toJson<int>(unread),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  ChatsTableData copyWith({
    int? id,
    ChatType? type,
    int? sourceId,
    int? targetId,
    int? unread,
    String? content,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
  }) => ChatsTableData(
    id: id ?? this.id,
    type: type ?? this.type,
    sourceId: sourceId ?? this.sourceId,
    targetId: targetId ?? this.targetId,
    unread: unread ?? this.unread,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ChatsTableData copyWithCompanion(ChatsTableCompanion data) {
    return ChatsTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      unread: data.unread.present ? data.unread.value : this.unread,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatsTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('unread: $unread, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    sourceId,
    targetId,
    unread,
    content,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatsTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.sourceId == this.sourceId &&
          other.targetId == this.targetId &&
          other.unread == this.unread &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChatsTableCompanion extends UpdateCompanion<ChatsTableData> {
  final Value<int> id;
  final Value<ChatType> type;
  final Value<int> sourceId;
  final Value<int> targetId;
  final Value<int> unread;
  final Value<String> content;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  const ChatsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.targetId = const Value.absent(),
    this.unread = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChatsTableCompanion.insert({
    this.id = const Value.absent(),
    required ChatType type,
    required int sourceId,
    required int targetId,
    this.unread = const Value.absent(),
    required String content,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : type = Value(type),
       sourceId = Value(sourceId),
       targetId = Value(targetId),
       content = Value(content);
  static Insertable<ChatsTableData> custom({
    Expression<int>? id,
    Expression<int>? type,
    Expression<int>? sourceId,
    Expression<int>? targetId,
    Expression<int>? unread,
    Expression<String>? content,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (sourceId != null) 'source_id': sourceId,
      if (targetId != null) 'target_id': targetId,
      if (unread != null) 'unread': unread,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChatsTableCompanion copyWith({
    Value<int>? id,
    Value<ChatType>? type,
    Value<int>? sourceId,
    Value<int>? targetId,
    Value<int>? unread,
    Value<String>? content,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
  }) {
    return ChatsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      unread: unread ?? this.unread,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $ChatsTableTable.$convertertype.toSql(type.value),
      );
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<int>(targetId.value);
    }
    if (unread.present) {
      map['unread'] = Variable<int>(unread.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('unread: $unread, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChatsInfosTableTable extends ChatsInfosTable
    with TableInfo<$ChatsInfosTableTable, ChatsInfosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsInfosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<int> chatId = GeneratedColumn<int>(
    'chat_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<InfoType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<InfoType>($ChatsInfosTableTable.$convertertype);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<int> targetId = GeneratedColumn<int>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedColumn<bool> unread = GeneratedColumn<bool>(
    'unread',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("unread" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sourcedAtMeta = const VerificationMeta(
    'sourcedAt',
  );
  @override
  late final GeneratedColumn<int> sourcedAt = GeneratedColumn<int>(
    'sourced_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    chatId,
    type,
    sourceId,
    targetId,
    content,
    unread,
    sourcedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chats_infos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatsInfosTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_id')) {
      context.handle(
        _chatIdMeta,
        chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(
        _unreadMeta,
        unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta),
      );
    }
    if (data.containsKey('sourced_at')) {
      context.handle(
        _sourcedAtMeta,
        sourcedAt.isAcceptableOrUnknown(data['sourced_at']!, _sourcedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatsInfosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatsInfosTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      chatId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chat_id'],
      )!,
      type: $ChatsInfosTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      unread: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}unread'],
      )!,
      sourcedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sourced_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ChatsInfosTableTable createAlias(String alias) {
    return $ChatsInfosTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<InfoType, int, int> $convertertype =
      const EnumIndexConverter<InfoType>(InfoType.values);
}

class ChatsInfosTableData extends DataClass
    implements Insertable<ChatsInfosTableData> {
  /// 消息标识
  final int id;

  /// 所属会话
  final int chatId;

  /// 消息类型
  final InfoType type;

  /// 发送人员
  final int sourceId;

  /// 接收人员
  final int targetId;

  /// 消息内容
  final String content;

  /// 消息未读
  final bool unread;

  /// 发送时间
  final int sourcedAt;

  /// 接收时间
  final int? createdAt;

  /// 修改时间
  final int? updatedAt;
  const ChatsInfosTableData({
    required this.id,
    required this.chatId,
    required this.type,
    required this.sourceId,
    required this.targetId,
    required this.content,
    required this.unread,
    required this.sourcedAt,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chat_id'] = Variable<int>(chatId);
    {
      map['type'] = Variable<int>(
        $ChatsInfosTableTable.$convertertype.toSql(type),
      );
    }
    map['source_id'] = Variable<int>(sourceId);
    map['target_id'] = Variable<int>(targetId);
    map['content'] = Variable<String>(content);
    map['unread'] = Variable<bool>(unread);
    map['sourced_at'] = Variable<int>(sourcedAt);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<int>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    return map;
  }

  ChatsInfosTableCompanion toCompanion(bool nullToAbsent) {
    return ChatsInfosTableCompanion(
      id: Value(id),
      chatId: Value(chatId),
      type: Value(type),
      sourceId: Value(sourceId),
      targetId: Value(targetId),
      content: Value(content),
      unread: Value(unread),
      sourcedAt: Value(sourcedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ChatsInfosTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatsInfosTableData(
      id: serializer.fromJson<int>(json['id']),
      chatId: serializer.fromJson<int>(json['chatId']),
      type: $ChatsInfosTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      targetId: serializer.fromJson<int>(json['targetId']),
      content: serializer.fromJson<String>(json['content']),
      unread: serializer.fromJson<bool>(json['unread']),
      sourcedAt: serializer.fromJson<int>(json['sourcedAt']),
      createdAt: serializer.fromJson<int?>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatId': serializer.toJson<int>(chatId),
      'type': serializer.toJson<int>(
        $ChatsInfosTableTable.$convertertype.toJson(type),
      ),
      'sourceId': serializer.toJson<int>(sourceId),
      'targetId': serializer.toJson<int>(targetId),
      'content': serializer.toJson<String>(content),
      'unread': serializer.toJson<bool>(unread),
      'sourcedAt': serializer.toJson<int>(sourcedAt),
      'createdAt': serializer.toJson<int?>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  ChatsInfosTableData copyWith({
    int? id,
    int? chatId,
    InfoType? type,
    int? sourceId,
    int? targetId,
    String? content,
    bool? unread,
    int? sourcedAt,
    Value<int?> createdAt = const Value.absent(),
    Value<int?> updatedAt = const Value.absent(),
  }) => ChatsInfosTableData(
    id: id ?? this.id,
    chatId: chatId ?? this.chatId,
    type: type ?? this.type,
    sourceId: sourceId ?? this.sourceId,
    targetId: targetId ?? this.targetId,
    content: content ?? this.content,
    unread: unread ?? this.unread,
    sourcedAt: sourcedAt ?? this.sourcedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ChatsInfosTableData copyWithCompanion(ChatsInfosTableCompanion data) {
    return ChatsInfosTableData(
      id: data.id.present ? data.id.value : this.id,
      chatId: data.chatId.present ? data.chatId.value : this.chatId,
      type: data.type.present ? data.type.value : this.type,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      content: data.content.present ? data.content.value : this.content,
      unread: data.unread.present ? data.unread.value : this.unread,
      sourcedAt: data.sourcedAt.present ? data.sourcedAt.value : this.sourcedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatsInfosTableData(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('content: $content, ')
          ..write('unread: $unread, ')
          ..write('sourcedAt: $sourcedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    chatId,
    type,
    sourceId,
    targetId,
    content,
    unread,
    sourcedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatsInfosTableData &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.type == this.type &&
          other.sourceId == this.sourceId &&
          other.targetId == this.targetId &&
          other.content == this.content &&
          other.unread == this.unread &&
          other.sourcedAt == this.sourcedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChatsInfosTableCompanion extends UpdateCompanion<ChatsInfosTableData> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<InfoType> type;
  final Value<int> sourceId;
  final Value<int> targetId;
  final Value<String> content;
  final Value<bool> unread;
  final Value<int> sourcedAt;
  final Value<int?> createdAt;
  final Value<int?> updatedAt;
  const ChatsInfosTableCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.type = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.targetId = const Value.absent(),
    this.content = const Value.absent(),
    this.unread = const Value.absent(),
    this.sourcedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChatsInfosTableCompanion.insert({
    this.id = const Value.absent(),
    required int chatId,
    required InfoType type,
    required int sourceId,
    required int targetId,
    required String content,
    this.unread = const Value.absent(),
    required int sourcedAt,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : chatId = Value(chatId),
       type = Value(type),
       sourceId = Value(sourceId),
       targetId = Value(targetId),
       content = Value(content),
       sourcedAt = Value(sourcedAt);
  static Insertable<ChatsInfosTableData> custom({
    Expression<int>? id,
    Expression<int>? chatId,
    Expression<int>? type,
    Expression<int>? sourceId,
    Expression<int>? targetId,
    Expression<String>? content,
    Expression<bool>? unread,
    Expression<int>? sourcedAt,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chat_id': chatId,
      if (type != null) 'type': type,
      if (sourceId != null) 'source_id': sourceId,
      if (targetId != null) 'target_id': targetId,
      if (content != null) 'content': content,
      if (unread != null) 'unread': unread,
      if (sourcedAt != null) 'sourced_at': sourcedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChatsInfosTableCompanion copyWith({
    Value<int>? id,
    Value<int>? chatId,
    Value<InfoType>? type,
    Value<int>? sourceId,
    Value<int>? targetId,
    Value<String>? content,
    Value<bool>? unread,
    Value<int>? sourcedAt,
    Value<int?>? createdAt,
    Value<int?>? updatedAt,
  }) {
    return ChatsInfosTableCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      type: type ?? this.type,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      content: content ?? this.content,
      unread: unread ?? this.unread,
      sourcedAt: sourcedAt ?? this.sourcedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<int>(chatId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $ChatsInfosTableTable.$convertertype.toSql(type.value),
      );
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<int>(targetId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (unread.present) {
      map['unread'] = Variable<bool>(unread.value);
    }
    if (sourcedAt.present) {
      map['sourced_at'] = Variable<int>(sourcedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsInfosTableCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('content: $content, ')
          ..write('unread: $unread, ')
          ..write('sourcedAt: $sourcedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MatesTableTable extends MatesTable
    with TableInfo<$MatesTableTable, MatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<int> targetId = GeneratedColumn<int>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nickname,
    sourceId,
    targetId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mates';
  @override
  VerificationContext validateIntegrity(
    Insertable<MatesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MatesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MatesTableTable createAlias(String alias) {
    return $MatesTableTable(attachedDatabase, alias);
  }
}

class MatesTableData extends DataClass implements Insertable<MatesTableData> {
  /// 好友标识
  final int id;

  /// 目标昵称
  final String nickname;

  /// 当前用户
  final int sourceId;

  /// 目标用户
  final int targetId;

  /// 添加时间
  final int createdAt;
  const MatesTableData({
    required this.id,
    required this.nickname,
    required this.sourceId,
    required this.targetId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nickname'] = Variable<String>(nickname);
    map['source_id'] = Variable<int>(sourceId);
    map['target_id'] = Variable<int>(targetId);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  MatesTableCompanion toCompanion(bool nullToAbsent) {
    return MatesTableCompanion(
      id: Value(id),
      nickname: Value(nickname),
      sourceId: Value(sourceId),
      targetId: Value(targetId),
      createdAt: Value(createdAt),
    );
  }

  factory MatesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MatesTableData(
      id: serializer.fromJson<int>(json['id']),
      nickname: serializer.fromJson<String>(json['nickname']),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      targetId: serializer.fromJson<int>(json['targetId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nickname': serializer.toJson<String>(nickname),
      'sourceId': serializer.toJson<int>(sourceId),
      'targetId': serializer.toJson<int>(targetId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  MatesTableData copyWith({
    int? id,
    String? nickname,
    int? sourceId,
    int? targetId,
    int? createdAt,
  }) => MatesTableData(
    id: id ?? this.id,
    nickname: nickname ?? this.nickname,
    sourceId: sourceId ?? this.sourceId,
    targetId: targetId ?? this.targetId,
    createdAt: createdAt ?? this.createdAt,
  );
  MatesTableData copyWithCompanion(MatesTableCompanion data) {
    return MatesTableData(
      id: data.id.present ? data.id.value : this.id,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MatesTableData(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nickname, sourceId, targetId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MatesTableData &&
          other.id == this.id &&
          other.nickname == this.nickname &&
          other.sourceId == this.sourceId &&
          other.targetId == this.targetId &&
          other.createdAt == this.createdAt);
}

class MatesTableCompanion extends UpdateCompanion<MatesTableData> {
  final Value<int> id;
  final Value<String> nickname;
  final Value<int> sourceId;
  final Value<int> targetId;
  final Value<int> createdAt;
  const MatesTableCompanion({
    this.id = const Value.absent(),
    this.nickname = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.targetId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MatesTableCompanion.insert({
    this.id = const Value.absent(),
    required String nickname,
    required int sourceId,
    required int targetId,
    required int createdAt,
  }) : nickname = Value(nickname),
       sourceId = Value(sourceId),
       targetId = Value(targetId),
       createdAt = Value(createdAt);
  static Insertable<MatesTableData> custom({
    Expression<int>? id,
    Expression<String>? nickname,
    Expression<int>? sourceId,
    Expression<int>? targetId,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nickname != null) 'nickname': nickname,
      if (sourceId != null) 'source_id': sourceId,
      if (targetId != null) 'target_id': targetId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MatesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nickname,
    Value<int>? sourceId,
    Value<int>? targetId,
    Value<int>? createdAt,
  }) {
    return MatesTableCompanion(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<int>(targetId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatesTableCompanion(')
          ..write('id: $id, ')
          ..write('nickname: $nickname, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MinesTableTable extends MinesTable
    with TableInfo<$MinesTableTable, MinesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    avatar,
    username,
    nickname,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mines';
  @override
  VerificationContext validateIntegrity(
    Insertable<MinesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MinesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MinesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $MinesTableTable createAlias(String alias) {
    return $MinesTableTable(attachedDatabase, alias);
  }
}

class MinesTableData extends DataClass implements Insertable<MinesTableData> {
  /// 我的标识
  final int id;

  /// 我的头像
  final String? avatar;

  /// 我的账号
  final String username;

  /// 我的密码
  final String nickname;

  /// 登录时间
  final int createdAt;

  /// 修改时间
  final int? updatedAt;
  const MinesTableData({
    required this.id,
    this.avatar,
    required this.username,
    required this.nickname,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['username'] = Variable<String>(username);
    map['nickname'] = Variable<String>(nickname);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    return map;
  }

  MinesTableCompanion toCompanion(bool nullToAbsent) {
    return MinesTableCompanion(
      id: Value(id),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      username: Value(username),
      nickname: Value(nickname),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory MinesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MinesTableData(
      id: serializer.fromJson<int>(json['id']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      username: serializer.fromJson<String>(json['username']),
      nickname: serializer.fromJson<String>(json['nickname']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'avatar': serializer.toJson<String?>(avatar),
      'username': serializer.toJson<String>(username),
      'nickname': serializer.toJson<String>(nickname),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  MinesTableData copyWith({
    int? id,
    Value<String?> avatar = const Value.absent(),
    String? username,
    String? nickname,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
  }) => MinesTableData(
    id: id ?? this.id,
    avatar: avatar.present ? avatar.value : this.avatar,
    username: username ?? this.username,
    nickname: nickname ?? this.nickname,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  MinesTableData copyWithCompanion(MinesTableCompanion data) {
    return MinesTableData(
      id: data.id.present ? data.id.value : this.id,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      username: data.username.present ? data.username.value : this.username,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MinesTableData(')
          ..write('id: $id, ')
          ..write('avatar: $avatar, ')
          ..write('username: $username, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, avatar, username, nickname, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MinesTableData &&
          other.id == this.id &&
          other.avatar == this.avatar &&
          other.username == this.username &&
          other.nickname == this.nickname &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MinesTableCompanion extends UpdateCompanion<MinesTableData> {
  final Value<int> id;
  final Value<String?> avatar;
  final Value<String> username;
  final Value<String> nickname;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  const MinesTableCompanion({
    this.id = const Value.absent(),
    this.avatar = const Value.absent(),
    this.username = const Value.absent(),
    this.nickname = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MinesTableCompanion.insert({
    this.id = const Value.absent(),
    this.avatar = const Value.absent(),
    required String username,
    required String nickname,
    required int createdAt,
    this.updatedAt = const Value.absent(),
  }) : username = Value(username),
       nickname = Value(nickname),
       createdAt = Value(createdAt);
  static Insertable<MinesTableData> custom({
    Expression<int>? id,
    Expression<String>? avatar,
    Expression<String>? username,
    Expression<String>? nickname,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (avatar != null) 'avatar': avatar,
      if (username != null) 'username': username,
      if (nickname != null) 'nickname': nickname,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MinesTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? avatar,
    Value<String>? username,
    Value<String>? nickname,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
  }) {
    return MinesTableCompanion(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MinesTableCompanion(')
          ..write('id: $id, ')
          ..write('avatar: $avatar, ')
          ..write('username: $username, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TeamsTableTable extends TeamsTable
    with TableInfo<$TeamsTableTable, TeamsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentIdMeta = const VerificationMeta(
    'currentId',
  );
  @override
  late final GeneratedColumn<int> currentId = GeneratedColumn<int>(
    'current_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, avatar, currentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teams';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeamsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('current_id')) {
      context.handle(
        _currentIdMeta,
        currentId.isAcceptableOrUnknown(data['current_id']!, _currentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_currentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      currentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_id'],
      )!,
    );
  }

  @override
  $TeamsTableTable createAlias(String alias) {
    return $TeamsTableTable(attachedDatabase, alias);
  }
}

class TeamsTableData extends DataClass implements Insertable<TeamsTableData> {
  /// 群组标识
  final int id;

  /// 群组名称
  final String name;

  /// 群组头像
  final String? avatar;

  /// 群组所属: 对应`users`用户标识
  final int currentId;
  const TeamsTableData({
    required this.id,
    required this.name,
    this.avatar,
    required this.currentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['current_id'] = Variable<int>(currentId);
    return map;
  }

  TeamsTableCompanion toCompanion(bool nullToAbsent) {
    return TeamsTableCompanion(
      id: Value(id),
      name: Value(name),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      currentId: Value(currentId),
    );
  }

  factory TeamsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      currentId: serializer.fromJson<int>(json['currentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'avatar': serializer.toJson<String?>(avatar),
      'currentId': serializer.toJson<int>(currentId),
    };
  }

  TeamsTableData copyWith({
    int? id,
    String? name,
    Value<String?> avatar = const Value.absent(),
    int? currentId,
  }) => TeamsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    avatar: avatar.present ? avatar.value : this.avatar,
    currentId: currentId ?? this.currentId,
  );
  TeamsTableData copyWithCompanion(TeamsTableCompanion data) {
    return TeamsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      currentId: data.currentId.present ? data.currentId.value : this.currentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('currentId: $currentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, avatar, currentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatar == this.avatar &&
          other.currentId == this.currentId);
}

class TeamsTableCompanion extends UpdateCompanion<TeamsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> avatar;
  final Value<int> currentId;
  const TeamsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.currentId = const Value.absent(),
  });
  TeamsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.avatar = const Value.absent(),
    required int currentId,
  }) : name = Value(name),
       currentId = Value(currentId);
  static Insertable<TeamsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? avatar,
    Expression<int>? currentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (currentId != null) 'current_id': currentId,
    });
  }

  TeamsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? avatar,
    Value<int>? currentId,
  }) {
    return TeamsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      currentId: currentId ?? this.currentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (currentId.present) {
      map['current_id'] = Variable<int>(currentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('currentId: $currentId')
          ..write(')'))
        .toString();
  }
}

class $TeamsUsersTableTable extends TeamsUsersTable
    with TableInfo<$TeamsUsersTableTable, TeamsUsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamsUsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RoleType, int> role =
      GeneratedColumn<int>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<RoleType>($TeamsUsersTableTable.$converterrole);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teamId,
    userId,
    role,
    avatar,
    nickname,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teams_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeamsUsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamsUsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamsUsersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      role: $TeamsUsersTableTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}role'],
        )!,
      ),
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $TeamsUsersTableTable createAlias(String alias) {
    return $TeamsUsersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RoleType, int, int> $converterrole =
      const EnumIndexConverter<RoleType>(RoleType.values);
}

class TeamsUsersTableData extends DataClass
    implements Insertable<TeamsUsersTableData> {
  /// 主键标识：对应服务端的关联标识
  final int id;

  /// 群组标识
  final int teamId;

  /// 成员标识
  final int userId;

  /// 成员角色
  final RoleType role;

  /// 群员头像
  final String avatar;

  /// 群员昵称
  final String nickname;

  /// 加入时间
  final int createdAt;

  /// 修改时间
  final int? updatedAt;
  const TeamsUsersTableData({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.role,
    required this.avatar,
    required this.nickname,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['team_id'] = Variable<int>(teamId);
    map['user_id'] = Variable<int>(userId);
    {
      map['role'] = Variable<int>(
        $TeamsUsersTableTable.$converterrole.toSql(role),
      );
    }
    map['avatar'] = Variable<String>(avatar);
    map['nickname'] = Variable<String>(nickname);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    return map;
  }

  TeamsUsersTableCompanion toCompanion(bool nullToAbsent) {
    return TeamsUsersTableCompanion(
      id: Value(id),
      teamId: Value(teamId),
      userId: Value(userId),
      role: Value(role),
      avatar: Value(avatar),
      nickname: Value(nickname),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TeamsUsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamsUsersTableData(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int>(json['teamId']),
      userId: serializer.fromJson<int>(json['userId']),
      role: $TeamsUsersTableTable.$converterrole.fromJson(
        serializer.fromJson<int>(json['role']),
      ),
      avatar: serializer.fromJson<String>(json['avatar']),
      nickname: serializer.fromJson<String>(json['nickname']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int>(teamId),
      'userId': serializer.toJson<int>(userId),
      'role': serializer.toJson<int>(
        $TeamsUsersTableTable.$converterrole.toJson(role),
      ),
      'avatar': serializer.toJson<String>(avatar),
      'nickname': serializer.toJson<String>(nickname),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  TeamsUsersTableData copyWith({
    int? id,
    int? teamId,
    int? userId,
    RoleType? role,
    String? avatar,
    String? nickname,
    int? createdAt,
    Value<int?> updatedAt = const Value.absent(),
  }) => TeamsUsersTableData(
    id: id ?? this.id,
    teamId: teamId ?? this.teamId,
    userId: userId ?? this.userId,
    role: role ?? this.role,
    avatar: avatar ?? this.avatar,
    nickname: nickname ?? this.nickname,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  TeamsUsersTableData copyWithCompanion(TeamsUsersTableCompanion data) {
    return TeamsUsersTableData(
      id: data.id.present ? data.id.value : this.id,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      userId: data.userId.present ? data.userId.value : this.userId,
      role: data.role.present ? data.role.value : this.role,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamsUsersTableData(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('avatar: $avatar, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teamId,
    userId,
    role,
    avatar,
    nickname,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamsUsersTableData &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.userId == this.userId &&
          other.role == this.role &&
          other.avatar == this.avatar &&
          other.nickname == this.nickname &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TeamsUsersTableCompanion extends UpdateCompanion<TeamsUsersTableData> {
  final Value<int> id;
  final Value<int> teamId;
  final Value<int> userId;
  final Value<RoleType> role;
  final Value<String> avatar;
  final Value<String> nickname;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  const TeamsUsersTableCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.userId = const Value.absent(),
    this.role = const Value.absent(),
    this.avatar = const Value.absent(),
    this.nickname = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TeamsUsersTableCompanion.insert({
    this.id = const Value.absent(),
    required int teamId,
    required int userId,
    required RoleType role,
    required String avatar,
    required String nickname,
    required int createdAt,
    this.updatedAt = const Value.absent(),
  }) : teamId = Value(teamId),
       userId = Value(userId),
       role = Value(role),
       avatar = Value(avatar),
       nickname = Value(nickname),
       createdAt = Value(createdAt);
  static Insertable<TeamsUsersTableData> custom({
    Expression<int>? id,
    Expression<int>? teamId,
    Expression<int>? userId,
    Expression<int>? role,
    Expression<String>? avatar,
    Expression<String>? nickname,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (userId != null) 'user_id': userId,
      if (role != null) 'role': role,
      if (avatar != null) 'avatar': avatar,
      if (nickname != null) 'nickname': nickname,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TeamsUsersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? teamId,
    Value<int>? userId,
    Value<RoleType>? role,
    Value<String>? avatar,
    Value<String>? nickname,
    Value<int>? createdAt,
    Value<int?>? updatedAt,
  }) {
    return TeamsUsersTableCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      nickname: nickname ?? this.nickname,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(
        $TeamsUsersTableTable.$converterrole.toSql(role.value),
      );
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsUsersTableCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('avatar: $avatar, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    avatar,
    username,
    nickname,
    phone,
    email,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  /// 用户标识
  final int id;

  /// 用户头像
  final String? avatar;

  /// 用户账号
  final String username;

  /// 用户昵称
  final String nickname;

  /// 用户手机
  final String? phone;

  /// 用户邮箱
  final String? email;

  /// 注册时间
  final int createdAt;
  const UsersTableData({
    required this.id,
    this.avatar,
    required this.username,
    required this.nickname,
    this.phone,
    this.email,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['username'] = Variable<String>(username);
    map['nickname'] = Variable<String>(nickname);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      username: Value(username),
      nickname: Value(nickname),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      createdAt: Value(createdAt),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<int>(json['id']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      username: serializer.fromJson<String>(json['username']),
      nickname: serializer.fromJson<String>(json['nickname']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'avatar': serializer.toJson<String?>(avatar),
      'username': serializer.toJson<String>(username),
      'nickname': serializer.toJson<String>(nickname),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  UsersTableData copyWith({
    int? id,
    Value<String?> avatar = const Value.absent(),
    String? username,
    String? nickname,
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    int? createdAt,
  }) => UsersTableData(
    id: id ?? this.id,
    avatar: avatar.present ? avatar.value : this.avatar,
    username: username ?? this.username,
    nickname: nickname ?? this.nickname,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    createdAt: createdAt ?? this.createdAt,
  );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      username: data.username.present ? data.username.value : this.username,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('avatar: $avatar, ')
          ..write('username: $username, ')
          ..write('nickname: $nickname, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, avatar, username, nickname, phone, email, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.avatar == this.avatar &&
          other.username == this.username &&
          other.nickname == this.nickname &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> id;
  final Value<String?> avatar;
  final Value<String> username;
  final Value<String> nickname;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<int> createdAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.avatar = const Value.absent(),
    this.username = const Value.absent(),
    this.nickname = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    this.avatar = const Value.absent(),
    required String username,
    required String nickname,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    required int createdAt,
  }) : username = Value(username),
       nickname = Value(nickname),
       createdAt = Value(createdAt);
  static Insertable<UsersTableData> custom({
    Expression<int>? id,
    Expression<String>? avatar,
    Expression<String>? username,
    Expression<String>? nickname,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (avatar != null) 'avatar': avatar,
      if (username != null) 'username': username,
      if (nickname != null) 'nickname': nickname,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? avatar,
    Value<String>? username,
    Value<String>? nickname,
    Value<String?>? phone,
    Value<String?>? email,
    Value<int>? createdAt,
  }) {
    return UsersTableCompanion(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('avatar: $avatar, ')
          ..write('username: $username, ')
          ..write('nickname: $nickname, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDatas extends GeneratedDatabase {
  _$DriftDatas(QueryExecutor e) : super(e);
  $DriftDatasManager get managers => $DriftDatasManager(this);
  late final $ChatsTableTable chatsTable = $ChatsTableTable(this);
  late final $ChatsInfosTableTable chatsInfosTable = $ChatsInfosTableTable(
    this,
  );
  late final $MatesTableTable matesTable = $MatesTableTable(this);
  late final $MinesTableTable minesTable = $MinesTableTable(this);
  late final $TeamsTableTable teamsTable = $TeamsTableTable(this);
  late final $TeamsUsersTableTable teamsUsersTable = $TeamsUsersTableTable(
    this,
  );
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final DriftModel driftModel = DriftModel(this as DriftDatas);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    chatsTable,
    chatsInfosTable,
    matesTable,
    minesTable,
    teamsTable,
    teamsUsersTable,
    usersTable,
  ];
}

typedef $$ChatsTableTableCreateCompanionBuilder =
    ChatsTableCompanion Function({
      Value<int> id,
      required ChatType type,
      required int sourceId,
      required int targetId,
      Value<int> unread,
      required String content,
      Value<int> createdAt,
      Value<int?> updatedAt,
    });
typedef $$ChatsTableTableUpdateCompanionBuilder =
    ChatsTableCompanion Function({
      Value<int> id,
      Value<ChatType> type,
      Value<int> sourceId,
      Value<int> targetId,
      Value<int> unread,
      Value<String> content,
      Value<int> createdAt,
      Value<int?> updatedAt,
    });

class $$ChatsTableTableFilterComposer
    extends Composer<_$DriftDatas, $ChatsTableTable> {
  $$ChatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ChatType, ChatType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatsTableTableOrderingComposer
    extends Composer<_$DriftDatas, $ChatsTableTable> {
  $$ChatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatsTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $ChatsTableTable> {
  $$ChatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChatType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<int> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<int> get unread =>
      $composableBuilder(column: $table.unread, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ChatsTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $ChatsTableTable,
          ChatsTableData,
          $$ChatsTableTableFilterComposer,
          $$ChatsTableTableOrderingComposer,
          $$ChatsTableTableAnnotationComposer,
          $$ChatsTableTableCreateCompanionBuilder,
          $$ChatsTableTableUpdateCompanionBuilder,
          (
            ChatsTableData,
            BaseReferences<_$DriftDatas, $ChatsTableTable, ChatsTableData>,
          ),
          ChatsTableData,
          PrefetchHooks Function()
        > {
  $$ChatsTableTableTableManager(_$DriftDatas db, $ChatsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<ChatType> type = const Value.absent(),
                Value<int> sourceId = const Value.absent(),
                Value<int> targetId = const Value.absent(),
                Value<int> unread = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => ChatsTableCompanion(
                id: id,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                unread: unread,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required ChatType type,
                required int sourceId,
                required int targetId,
                Value<int> unread = const Value.absent(),
                required String content,
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => ChatsTableCompanion.insert(
                id: id,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                unread: unread,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $ChatsTableTable,
      ChatsTableData,
      $$ChatsTableTableFilterComposer,
      $$ChatsTableTableOrderingComposer,
      $$ChatsTableTableAnnotationComposer,
      $$ChatsTableTableCreateCompanionBuilder,
      $$ChatsTableTableUpdateCompanionBuilder,
      (
        ChatsTableData,
        BaseReferences<_$DriftDatas, $ChatsTableTable, ChatsTableData>,
      ),
      ChatsTableData,
      PrefetchHooks Function()
    >;
typedef $$ChatsInfosTableTableCreateCompanionBuilder =
    ChatsInfosTableCompanion Function({
      Value<int> id,
      required int chatId,
      required InfoType type,
      required int sourceId,
      required int targetId,
      required String content,
      Value<bool> unread,
      required int sourcedAt,
      Value<int?> createdAt,
      Value<int?> updatedAt,
    });
typedef $$ChatsInfosTableTableUpdateCompanionBuilder =
    ChatsInfosTableCompanion Function({
      Value<int> id,
      Value<int> chatId,
      Value<InfoType> type,
      Value<int> sourceId,
      Value<int> targetId,
      Value<String> content,
      Value<bool> unread,
      Value<int> sourcedAt,
      Value<int?> createdAt,
      Value<int?> updatedAt,
    });

class $$ChatsInfosTableTableFilterComposer
    extends Composer<_$DriftDatas, $ChatsInfosTableTable> {
  $$ChatsInfosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chatId => $composableBuilder(
    column: $table.chatId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<InfoType, InfoType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sourcedAt => $composableBuilder(
    column: $table.sourcedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatsInfosTableTableOrderingComposer
    extends Composer<_$DriftDatas, $ChatsInfosTableTable> {
  $$ChatsInfosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chatId => $composableBuilder(
    column: $table.chatId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourcedAt => $composableBuilder(
    column: $table.sourcedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatsInfosTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $ChatsInfosTableTable> {
  $$ChatsInfosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chatId =>
      $composableBuilder(column: $table.chatId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<InfoType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<int> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<bool> get unread =>
      $composableBuilder(column: $table.unread, builder: (column) => column);

  GeneratedColumn<int> get sourcedAt =>
      $composableBuilder(column: $table.sourcedAt, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ChatsInfosTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $ChatsInfosTableTable,
          ChatsInfosTableData,
          $$ChatsInfosTableTableFilterComposer,
          $$ChatsInfosTableTableOrderingComposer,
          $$ChatsInfosTableTableAnnotationComposer,
          $$ChatsInfosTableTableCreateCompanionBuilder,
          $$ChatsInfosTableTableUpdateCompanionBuilder,
          (
            ChatsInfosTableData,
            BaseReferences<
              _$DriftDatas,
              $ChatsInfosTableTable,
              ChatsInfosTableData
            >,
          ),
          ChatsInfosTableData,
          PrefetchHooks Function()
        > {
  $$ChatsInfosTableTableTableManager(
    _$DriftDatas db,
    $ChatsInfosTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatsInfosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatsInfosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatsInfosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> chatId = const Value.absent(),
                Value<InfoType> type = const Value.absent(),
                Value<int> sourceId = const Value.absent(),
                Value<int> targetId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<bool> unread = const Value.absent(),
                Value<int> sourcedAt = const Value.absent(),
                Value<int?> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => ChatsInfosTableCompanion(
                id: id,
                chatId: chatId,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                content: content,
                unread: unread,
                sourcedAt: sourcedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int chatId,
                required InfoType type,
                required int sourceId,
                required int targetId,
                required String content,
                Value<bool> unread = const Value.absent(),
                required int sourcedAt,
                Value<int?> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => ChatsInfosTableCompanion.insert(
                id: id,
                chatId: chatId,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                content: content,
                unread: unread,
                sourcedAt: sourcedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatsInfosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $ChatsInfosTableTable,
      ChatsInfosTableData,
      $$ChatsInfosTableTableFilterComposer,
      $$ChatsInfosTableTableOrderingComposer,
      $$ChatsInfosTableTableAnnotationComposer,
      $$ChatsInfosTableTableCreateCompanionBuilder,
      $$ChatsInfosTableTableUpdateCompanionBuilder,
      (
        ChatsInfosTableData,
        BaseReferences<
          _$DriftDatas,
          $ChatsInfosTableTable,
          ChatsInfosTableData
        >,
      ),
      ChatsInfosTableData,
      PrefetchHooks Function()
    >;
typedef $$MatesTableTableCreateCompanionBuilder =
    MatesTableCompanion Function({
      Value<int> id,
      required String nickname,
      required int sourceId,
      required int targetId,
      required int createdAt,
    });
typedef $$MatesTableTableUpdateCompanionBuilder =
    MatesTableCompanion Function({
      Value<int> id,
      Value<String> nickname,
      Value<int> sourceId,
      Value<int> targetId,
      Value<int> createdAt,
    });

class $$MatesTableTableFilterComposer
    extends Composer<_$DriftDatas, $MatesTableTable> {
  $$MatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MatesTableTableOrderingComposer
    extends Composer<_$DriftDatas, $MatesTableTable> {
  $$MatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MatesTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $MatesTableTable> {
  $$MatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<int> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MatesTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $MatesTableTable,
          MatesTableData,
          $$MatesTableTableFilterComposer,
          $$MatesTableTableOrderingComposer,
          $$MatesTableTableAnnotationComposer,
          $$MatesTableTableCreateCompanionBuilder,
          $$MatesTableTableUpdateCompanionBuilder,
          (
            MatesTableData,
            BaseReferences<_$DriftDatas, $MatesTableTable, MatesTableData>,
          ),
          MatesTableData,
          PrefetchHooks Function()
        > {
  $$MatesTableTableTableManager(_$DriftDatas db, $MatesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<int> sourceId = const Value.absent(),
                Value<int> targetId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => MatesTableCompanion(
                id: id,
                nickname: nickname,
                sourceId: sourceId,
                targetId: targetId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nickname,
                required int sourceId,
                required int targetId,
                required int createdAt,
              }) => MatesTableCompanion.insert(
                id: id,
                nickname: nickname,
                sourceId: sourceId,
                targetId: targetId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MatesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $MatesTableTable,
      MatesTableData,
      $$MatesTableTableFilterComposer,
      $$MatesTableTableOrderingComposer,
      $$MatesTableTableAnnotationComposer,
      $$MatesTableTableCreateCompanionBuilder,
      $$MatesTableTableUpdateCompanionBuilder,
      (
        MatesTableData,
        BaseReferences<_$DriftDatas, $MatesTableTable, MatesTableData>,
      ),
      MatesTableData,
      PrefetchHooks Function()
    >;
typedef $$MinesTableTableCreateCompanionBuilder =
    MinesTableCompanion Function({
      Value<int> id,
      Value<String?> avatar,
      required String username,
      required String nickname,
      required int createdAt,
      Value<int?> updatedAt,
    });
typedef $$MinesTableTableUpdateCompanionBuilder =
    MinesTableCompanion Function({
      Value<int> id,
      Value<String?> avatar,
      Value<String> username,
      Value<String> nickname,
      Value<int> createdAt,
      Value<int?> updatedAt,
    });

class $$MinesTableTableFilterComposer
    extends Composer<_$DriftDatas, $MinesTableTable> {
  $$MinesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MinesTableTableOrderingComposer
    extends Composer<_$DriftDatas, $MinesTableTable> {
  $$MinesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MinesTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $MinesTableTable> {
  $$MinesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MinesTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $MinesTableTable,
          MinesTableData,
          $$MinesTableTableFilterComposer,
          $$MinesTableTableOrderingComposer,
          $$MinesTableTableAnnotationComposer,
          $$MinesTableTableCreateCompanionBuilder,
          $$MinesTableTableUpdateCompanionBuilder,
          (
            MinesTableData,
            BaseReferences<_$DriftDatas, $MinesTableTable, MinesTableData>,
          ),
          MinesTableData,
          PrefetchHooks Function()
        > {
  $$MinesTableTableTableManager(_$DriftDatas db, $MinesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MinesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MinesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MinesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => MinesTableCompanion(
                id: id,
                avatar: avatar,
                username: username,
                nickname: nickname,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                required String username,
                required String nickname,
                required int createdAt,
                Value<int?> updatedAt = const Value.absent(),
              }) => MinesTableCompanion.insert(
                id: id,
                avatar: avatar,
                username: username,
                nickname: nickname,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MinesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $MinesTableTable,
      MinesTableData,
      $$MinesTableTableFilterComposer,
      $$MinesTableTableOrderingComposer,
      $$MinesTableTableAnnotationComposer,
      $$MinesTableTableCreateCompanionBuilder,
      $$MinesTableTableUpdateCompanionBuilder,
      (
        MinesTableData,
        BaseReferences<_$DriftDatas, $MinesTableTable, MinesTableData>,
      ),
      MinesTableData,
      PrefetchHooks Function()
    >;
typedef $$TeamsTableTableCreateCompanionBuilder =
    TeamsTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> avatar,
      required int currentId,
    });
typedef $$TeamsTableTableUpdateCompanionBuilder =
    TeamsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> avatar,
      Value<int> currentId,
    });

class $$TeamsTableTableFilterComposer
    extends Composer<_$DriftDatas, $TeamsTableTable> {
  $$TeamsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentId => $composableBuilder(
    column: $table.currentId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TeamsTableTableOrderingComposer
    extends Composer<_$DriftDatas, $TeamsTableTable> {
  $$TeamsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentId => $composableBuilder(
    column: $table.currentId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeamsTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $TeamsTableTable> {
  $$TeamsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<int> get currentId =>
      $composableBuilder(column: $table.currentId, builder: (column) => column);
}

class $$TeamsTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $TeamsTableTable,
          TeamsTableData,
          $$TeamsTableTableFilterComposer,
          $$TeamsTableTableOrderingComposer,
          $$TeamsTableTableAnnotationComposer,
          $$TeamsTableTableCreateCompanionBuilder,
          $$TeamsTableTableUpdateCompanionBuilder,
          (
            TeamsTableData,
            BaseReferences<_$DriftDatas, $TeamsTableTable, TeamsTableData>,
          ),
          TeamsTableData,
          PrefetchHooks Function()
        > {
  $$TeamsTableTableTableManager(_$DriftDatas db, $TeamsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<int> currentId = const Value.absent(),
              }) => TeamsTableCompanion(
                id: id,
                name: name,
                avatar: avatar,
                currentId: currentId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> avatar = const Value.absent(),
                required int currentId,
              }) => TeamsTableCompanion.insert(
                id: id,
                name: name,
                avatar: avatar,
                currentId: currentId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TeamsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $TeamsTableTable,
      TeamsTableData,
      $$TeamsTableTableFilterComposer,
      $$TeamsTableTableOrderingComposer,
      $$TeamsTableTableAnnotationComposer,
      $$TeamsTableTableCreateCompanionBuilder,
      $$TeamsTableTableUpdateCompanionBuilder,
      (
        TeamsTableData,
        BaseReferences<_$DriftDatas, $TeamsTableTable, TeamsTableData>,
      ),
      TeamsTableData,
      PrefetchHooks Function()
    >;
typedef $$TeamsUsersTableTableCreateCompanionBuilder =
    TeamsUsersTableCompanion Function({
      Value<int> id,
      required int teamId,
      required int userId,
      required RoleType role,
      required String avatar,
      required String nickname,
      required int createdAt,
      Value<int?> updatedAt,
    });
typedef $$TeamsUsersTableTableUpdateCompanionBuilder =
    TeamsUsersTableCompanion Function({
      Value<int> id,
      Value<int> teamId,
      Value<int> userId,
      Value<RoleType> role,
      Value<String> avatar,
      Value<String> nickname,
      Value<int> createdAt,
      Value<int?> updatedAt,
    });

class $$TeamsUsersTableTableFilterComposer
    extends Composer<_$DriftDatas, $TeamsUsersTableTable> {
  $$TeamsUsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get teamId => $composableBuilder(
    column: $table.teamId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RoleType, RoleType, int> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TeamsUsersTableTableOrderingComposer
    extends Composer<_$DriftDatas, $TeamsUsersTableTable> {
  $$TeamsUsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get teamId => $composableBuilder(
    column: $table.teamId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeamsUsersTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $TeamsUsersTableTable> {
  $$TeamsUsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get teamId =>
      $composableBuilder(column: $table.teamId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RoleType, int> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TeamsUsersTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $TeamsUsersTableTable,
          TeamsUsersTableData,
          $$TeamsUsersTableTableFilterComposer,
          $$TeamsUsersTableTableOrderingComposer,
          $$TeamsUsersTableTableAnnotationComposer,
          $$TeamsUsersTableTableCreateCompanionBuilder,
          $$TeamsUsersTableTableUpdateCompanionBuilder,
          (
            TeamsUsersTableData,
            BaseReferences<
              _$DriftDatas,
              $TeamsUsersTableTable,
              TeamsUsersTableData
            >,
          ),
          TeamsUsersTableData,
          PrefetchHooks Function()
        > {
  $$TeamsUsersTableTableTableManager(
    _$DriftDatas db,
    $TeamsUsersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamsUsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamsUsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamsUsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teamId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<RoleType> role = const Value.absent(),
                Value<String> avatar = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> updatedAt = const Value.absent(),
              }) => TeamsUsersTableCompanion(
                id: id,
                teamId: teamId,
                userId: userId,
                role: role,
                avatar: avatar,
                nickname: nickname,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teamId,
                required int userId,
                required RoleType role,
                required String avatar,
                required String nickname,
                required int createdAt,
                Value<int?> updatedAt = const Value.absent(),
              }) => TeamsUsersTableCompanion.insert(
                id: id,
                teamId: teamId,
                userId: userId,
                role: role,
                avatar: avatar,
                nickname: nickname,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TeamsUsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $TeamsUsersTableTable,
      TeamsUsersTableData,
      $$TeamsUsersTableTableFilterComposer,
      $$TeamsUsersTableTableOrderingComposer,
      $$TeamsUsersTableTableAnnotationComposer,
      $$TeamsUsersTableTableCreateCompanionBuilder,
      $$TeamsUsersTableTableUpdateCompanionBuilder,
      (
        TeamsUsersTableData,
        BaseReferences<
          _$DriftDatas,
          $TeamsUsersTableTable,
          TeamsUsersTableData
        >,
      ),
      TeamsUsersTableData,
      PrefetchHooks Function()
    >;
typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      Value<String?> avatar,
      required String username,
      required String nickname,
      Value<String?> phone,
      Value<String?> email,
      required int createdAt,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      Value<String?> avatar,
      Value<String> username,
      Value<String> nickname,
      Value<String?> phone,
      Value<String?> email,
      Value<int> createdAt,
    });

class $$UsersTableTableFilterComposer
    extends Composer<_$DriftDatas, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$DriftDatas, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (
            UsersTableData,
            BaseReferences<_$DriftDatas, $UsersTableTable, UsersTableData>,
          ),
          UsersTableData,
          PrefetchHooks Function()
        > {
  $$UsersTableTableTableManager(_$DriftDatas db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => UsersTableCompanion(
                id: id,
                avatar: avatar,
                username: username,
                nickname: nickname,
                phone: phone,
                email: email,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                required String username,
                required String nickname,
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                required int createdAt,
              }) => UsersTableCompanion.insert(
                id: id,
                avatar: avatar,
                username: username,
                nickname: nickname,
                phone: phone,
                email: email,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (
        UsersTableData,
        BaseReferences<_$DriftDatas, $UsersTableTable, UsersTableData>,
      ),
      UsersTableData,
      PrefetchHooks Function()
    >;

class $DriftDatasManager {
  final _$DriftDatas _db;
  $DriftDatasManager(this._db);
  $$ChatsTableTableTableManager get chatsTable =>
      $$ChatsTableTableTableManager(_db, _db.chatsTable);
  $$ChatsInfosTableTableTableManager get chatsInfosTable =>
      $$ChatsInfosTableTableTableManager(_db, _db.chatsInfosTable);
  $$MatesTableTableTableManager get matesTable =>
      $$MatesTableTableTableManager(_db, _db.matesTable);
  $$MinesTableTableTableManager get minesTable =>
      $$MinesTableTableTableManager(_db, _db.minesTable);
  $$TeamsTableTableTableManager get teamsTable =>
      $$TeamsTableTableTableManager(_db, _db.teamsTable);
  $$TeamsUsersTableTableTableManager get teamsUsersTable =>
      $$TeamsUsersTableTableTableManager(_db, _db.teamsUsersTable);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
}
