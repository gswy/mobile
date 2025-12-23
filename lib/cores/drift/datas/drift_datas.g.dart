// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_datas.dart';

// ignore_for_file: type=lint
class $ChatsTableTable extends ChatsTable
    with TableInfo<$ChatsTableTable, ChatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _snMeta = const VerificationMeta('sn');
  @override
  late final GeneratedColumn<String> sn = GeneratedColumn<String>(
    'sn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageAtMeta = const VerificationMeta(
    'messageAt',
  );
  @override
  late final GeneratedColumn<int> messageAt = GeneratedColumn<int>(
    'message_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sn,
    id,
    type,
    sourceId,
    targetId,
    title,
    avatar,
    unread,
    message,
    messageAt,
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
    if (data.containsKey('sn')) {
      context.handle(_snMeta, sn.isAcceptableOrUnknown(data['sn']!, _snMeta));
    } else if (isInserting) {
      context.missing(_snMeta);
    }
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('unread')) {
      context.handle(
        _unreadMeta,
        unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta),
      );
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('message_at')) {
      context.handle(
        _messageAtMeta,
        messageAt.isAcceptableOrUnknown(data['message_at']!, _messageAtMeta),
      );
    } else if (isInserting) {
      context.missing(_messageAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sn};
  @override
  ChatsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatsTableData(
      sn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sn'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
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
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      unread: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      messageAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}message_at'],
      )!,
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
  final String sn;

  /// 自增标识
  final int? id;

  /// 会话类型
  final ChatType type;

  /// 我的标识
  final int sourceId;

  /// 对方标识
  final int targetId;

  /// 对方名称
  final String title;

  /// 对方头像: 可为空头像
  final String? avatar;

  /// 会话未读
  final int unread;

  /// 消息内容
  final String message;

  /// 最后时间
  final int messageAt;
  const ChatsTableData({
    required this.sn,
    this.id,
    required this.type,
    required this.sourceId,
    required this.targetId,
    required this.title,
    this.avatar,
    required this.unread,
    required this.message,
    required this.messageAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sn'] = Variable<String>(sn);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    {
      map['type'] = Variable<int>($ChatsTableTable.$convertertype.toSql(type));
    }
    map['source_id'] = Variable<int>(sourceId);
    map['target_id'] = Variable<int>(targetId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['unread'] = Variable<int>(unread);
    map['message'] = Variable<String>(message);
    map['message_at'] = Variable<int>(messageAt);
    return map;
  }

  ChatsTableCompanion toCompanion(bool nullToAbsent) {
    return ChatsTableCompanion(
      sn: Value(sn),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type: Value(type),
      sourceId: Value(sourceId),
      targetId: Value(targetId),
      title: Value(title),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      unread: Value(unread),
      message: Value(message),
      messageAt: Value(messageAt),
    );
  }

  factory ChatsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatsTableData(
      sn: serializer.fromJson<String>(json['sn']),
      id: serializer.fromJson<int?>(json['id']),
      type: $ChatsTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      targetId: serializer.fromJson<int>(json['targetId']),
      title: serializer.fromJson<String>(json['title']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      unread: serializer.fromJson<int>(json['unread']),
      message: serializer.fromJson<String>(json['message']),
      messageAt: serializer.fromJson<int>(json['messageAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sn': serializer.toJson<String>(sn),
      'id': serializer.toJson<int?>(id),
      'type': serializer.toJson<int>(
        $ChatsTableTable.$convertertype.toJson(type),
      ),
      'sourceId': serializer.toJson<int>(sourceId),
      'targetId': serializer.toJson<int>(targetId),
      'title': serializer.toJson<String>(title),
      'avatar': serializer.toJson<String?>(avatar),
      'unread': serializer.toJson<int>(unread),
      'message': serializer.toJson<String>(message),
      'messageAt': serializer.toJson<int>(messageAt),
    };
  }

  ChatsTableData copyWith({
    String? sn,
    Value<int?> id = const Value.absent(),
    ChatType? type,
    int? sourceId,
    int? targetId,
    String? title,
    Value<String?> avatar = const Value.absent(),
    int? unread,
    String? message,
    int? messageAt,
  }) => ChatsTableData(
    sn: sn ?? this.sn,
    id: id.present ? id.value : this.id,
    type: type ?? this.type,
    sourceId: sourceId ?? this.sourceId,
    targetId: targetId ?? this.targetId,
    title: title ?? this.title,
    avatar: avatar.present ? avatar.value : this.avatar,
    unread: unread ?? this.unread,
    message: message ?? this.message,
    messageAt: messageAt ?? this.messageAt,
  );
  ChatsTableData copyWithCompanion(ChatsTableCompanion data) {
    return ChatsTableData(
      sn: data.sn.present ? data.sn.value : this.sn,
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      title: data.title.present ? data.title.value : this.title,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      unread: data.unread.present ? data.unread.value : this.unread,
      message: data.message.present ? data.message.value : this.message,
      messageAt: data.messageAt.present ? data.messageAt.value : this.messageAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatsTableData(')
          ..write('sn: $sn, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('title: $title, ')
          ..write('avatar: $avatar, ')
          ..write('unread: $unread, ')
          ..write('message: $message, ')
          ..write('messageAt: $messageAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sn,
    id,
    type,
    sourceId,
    targetId,
    title,
    avatar,
    unread,
    message,
    messageAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatsTableData &&
          other.sn == this.sn &&
          other.id == this.id &&
          other.type == this.type &&
          other.sourceId == this.sourceId &&
          other.targetId == this.targetId &&
          other.title == this.title &&
          other.avatar == this.avatar &&
          other.unread == this.unread &&
          other.message == this.message &&
          other.messageAt == this.messageAt);
}

class ChatsTableCompanion extends UpdateCompanion<ChatsTableData> {
  final Value<String> sn;
  final Value<int?> id;
  final Value<ChatType> type;
  final Value<int> sourceId;
  final Value<int> targetId;
  final Value<String> title;
  final Value<String?> avatar;
  final Value<int> unread;
  final Value<String> message;
  final Value<int> messageAt;
  final Value<int> rowid;
  const ChatsTableCompanion({
    this.sn = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.targetId = const Value.absent(),
    this.title = const Value.absent(),
    this.avatar = const Value.absent(),
    this.unread = const Value.absent(),
    this.message = const Value.absent(),
    this.messageAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatsTableCompanion.insert({
    required String sn,
    this.id = const Value.absent(),
    required ChatType type,
    required int sourceId,
    required int targetId,
    required String title,
    this.avatar = const Value.absent(),
    this.unread = const Value.absent(),
    required String message,
    required int messageAt,
    this.rowid = const Value.absent(),
  }) : sn = Value(sn),
       type = Value(type),
       sourceId = Value(sourceId),
       targetId = Value(targetId),
       title = Value(title),
       message = Value(message),
       messageAt = Value(messageAt);
  static Insertable<ChatsTableData> custom({
    Expression<String>? sn,
    Expression<int>? id,
    Expression<int>? type,
    Expression<int>? sourceId,
    Expression<int>? targetId,
    Expression<String>? title,
    Expression<String>? avatar,
    Expression<int>? unread,
    Expression<String>? message,
    Expression<int>? messageAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sn != null) 'sn': sn,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (sourceId != null) 'source_id': sourceId,
      if (targetId != null) 'target_id': targetId,
      if (title != null) 'title': title,
      if (avatar != null) 'avatar': avatar,
      if (unread != null) 'unread': unread,
      if (message != null) 'message': message,
      if (messageAt != null) 'message_at': messageAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatsTableCompanion copyWith({
    Value<String>? sn,
    Value<int?>? id,
    Value<ChatType>? type,
    Value<int>? sourceId,
    Value<int>? targetId,
    Value<String>? title,
    Value<String?>? avatar,
    Value<int>? unread,
    Value<String>? message,
    Value<int>? messageAt,
    Value<int>? rowid,
  }) {
    return ChatsTableCompanion(
      sn: sn ?? this.sn,
      id: id ?? this.id,
      type: type ?? this.type,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      unread: unread ?? this.unread,
      message: message ?? this.message,
      messageAt: messageAt ?? this.messageAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sn.present) {
      map['sn'] = Variable<String>(sn.value);
    }
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (unread.present) {
      map['unread'] = Variable<int>(unread.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (messageAt.present) {
      map['message_at'] = Variable<int>(messageAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsTableCompanion(')
          ..write('sn: $sn, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetId: $targetId, ')
          ..write('title: $title, ')
          ..write('avatar: $avatar, ')
          ..write('unread: $unread, ')
          ..write('message: $message, ')
          ..write('messageAt: $messageAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InfosTableTable extends InfosTable
    with TableInfo<$InfosTableTable, InfosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InfosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snMeta = const VerificationMeta('sn');
  @override
  late final GeneratedColumn<String> sn = GeneratedColumn<String>(
    'sn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
      ).withConverter<InfoType>($InfosTableTable.$convertertype);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedColumn<bool> unread = GeneratedColumn<bool>(
    'unread',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("unread" IN (0, 1))',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageAtMeta = const VerificationMeta(
    'messageAt',
  );
  @override
  late final GeneratedColumn<int> messageAt = GeneratedColumn<int>(
    'message_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sn,
    clientId,
    type,
    userId,
    avatar,
    nickname,
    unread,
    status,
    message,
    messageAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'infos';
  @override
  VerificationContext validateIntegrity(
    Insertable<InfosTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sn')) {
      context.handle(_snMeta, sn.isAcceptableOrUnknown(data['sn']!, _snMeta));
    } else if (isInserting) {
      context.missing(_snMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
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
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(
        _unreadMeta,
        unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta),
      );
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('message_at')) {
      context.handle(
        _messageAtMeta,
        messageAt.isAcceptableOrUnknown(data['message_at']!, _messageAtMeta),
      );
    } else if (isInserting) {
      context.missing(_messageAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientId};
  @override
  InfosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InfosTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      sn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sn'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      type: $InfosTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      )!,
      unread: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}unread'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      messageAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}message_at'],
      )!,
    );
  }

  @override
  $InfosTableTable createAlias(String alias) {
    return $InfosTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<InfoType, int, int> $convertertype =
      const EnumIndexConverter<InfoType>(InfoType.values);
}

class InfosTableData extends DataClass implements Insertable<InfosTableData> {
  /// 消息标识（云端）
  final int? id;

  /// 会话标识
  final String sn;

  /// 消息标识（本地）
  final String clientId;

  /// 消息类型
  final InfoType type;

  /// 发送用户
  final int userId;

  /// 发送头像
  final String? avatar;

  /// 发送昵称
  final String nickname;

  /// 会话未读
  final bool unread;

  /// 消息状态
  final int status;

  /// 消息内容
  final String message;

  /// 最后时间
  final int messageAt;
  const InfosTableData({
    this.id,
    required this.sn,
    required this.clientId,
    required this.type,
    required this.userId,
    this.avatar,
    required this.nickname,
    required this.unread,
    required this.status,
    required this.message,
    required this.messageAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['sn'] = Variable<String>(sn);
    map['client_id'] = Variable<String>(clientId);
    {
      map['type'] = Variable<int>($InfosTableTable.$convertertype.toSql(type));
    }
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['nickname'] = Variable<String>(nickname);
    map['unread'] = Variable<bool>(unread);
    map['status'] = Variable<int>(status);
    map['message'] = Variable<String>(message);
    map['message_at'] = Variable<int>(messageAt);
    return map;
  }

  InfosTableCompanion toCompanion(bool nullToAbsent) {
    return InfosTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      sn: Value(sn),
      clientId: Value(clientId),
      type: Value(type),
      userId: Value(userId),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      nickname: Value(nickname),
      unread: Value(unread),
      status: Value(status),
      message: Value(message),
      messageAt: Value(messageAt),
    );
  }

  factory InfosTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InfosTableData(
      id: serializer.fromJson<int?>(json['id']),
      sn: serializer.fromJson<String>(json['sn']),
      clientId: serializer.fromJson<String>(json['clientId']),
      type: $InfosTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      userId: serializer.fromJson<int>(json['userId']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      nickname: serializer.fromJson<String>(json['nickname']),
      unread: serializer.fromJson<bool>(json['unread']),
      status: serializer.fromJson<int>(json['status']),
      message: serializer.fromJson<String>(json['message']),
      messageAt: serializer.fromJson<int>(json['messageAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'sn': serializer.toJson<String>(sn),
      'clientId': serializer.toJson<String>(clientId),
      'type': serializer.toJson<int>(
        $InfosTableTable.$convertertype.toJson(type),
      ),
      'userId': serializer.toJson<int>(userId),
      'avatar': serializer.toJson<String?>(avatar),
      'nickname': serializer.toJson<String>(nickname),
      'unread': serializer.toJson<bool>(unread),
      'status': serializer.toJson<int>(status),
      'message': serializer.toJson<String>(message),
      'messageAt': serializer.toJson<int>(messageAt),
    };
  }

  InfosTableData copyWith({
    Value<int?> id = const Value.absent(),
    String? sn,
    String? clientId,
    InfoType? type,
    int? userId,
    Value<String?> avatar = const Value.absent(),
    String? nickname,
    bool? unread,
    int? status,
    String? message,
    int? messageAt,
  }) => InfosTableData(
    id: id.present ? id.value : this.id,
    sn: sn ?? this.sn,
    clientId: clientId ?? this.clientId,
    type: type ?? this.type,
    userId: userId ?? this.userId,
    avatar: avatar.present ? avatar.value : this.avatar,
    nickname: nickname ?? this.nickname,
    unread: unread ?? this.unread,
    status: status ?? this.status,
    message: message ?? this.message,
    messageAt: messageAt ?? this.messageAt,
  );
  InfosTableData copyWithCompanion(InfosTableCompanion data) {
    return InfosTableData(
      id: data.id.present ? data.id.value : this.id,
      sn: data.sn.present ? data.sn.value : this.sn,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      type: data.type.present ? data.type.value : this.type,
      userId: data.userId.present ? data.userId.value : this.userId,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      unread: data.unread.present ? data.unread.value : this.unread,
      status: data.status.present ? data.status.value : this.status,
      message: data.message.present ? data.message.value : this.message,
      messageAt: data.messageAt.present ? data.messageAt.value : this.messageAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InfosTableData(')
          ..write('id: $id, ')
          ..write('sn: $sn, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('userId: $userId, ')
          ..write('avatar: $avatar, ')
          ..write('nickname: $nickname, ')
          ..write('unread: $unread, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('messageAt: $messageAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sn,
    clientId,
    type,
    userId,
    avatar,
    nickname,
    unread,
    status,
    message,
    messageAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InfosTableData &&
          other.id == this.id &&
          other.sn == this.sn &&
          other.clientId == this.clientId &&
          other.type == this.type &&
          other.userId == this.userId &&
          other.avatar == this.avatar &&
          other.nickname == this.nickname &&
          other.unread == this.unread &&
          other.status == this.status &&
          other.message == this.message &&
          other.messageAt == this.messageAt);
}

class InfosTableCompanion extends UpdateCompanion<InfosTableData> {
  final Value<int?> id;
  final Value<String> sn;
  final Value<String> clientId;
  final Value<InfoType> type;
  final Value<int> userId;
  final Value<String?> avatar;
  final Value<String> nickname;
  final Value<bool> unread;
  final Value<int> status;
  final Value<String> message;
  final Value<int> messageAt;
  final Value<int> rowid;
  const InfosTableCompanion({
    this.id = const Value.absent(),
    this.sn = const Value.absent(),
    this.clientId = const Value.absent(),
    this.type = const Value.absent(),
    this.userId = const Value.absent(),
    this.avatar = const Value.absent(),
    this.nickname = const Value.absent(),
    this.unread = const Value.absent(),
    this.status = const Value.absent(),
    this.message = const Value.absent(),
    this.messageAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InfosTableCompanion.insert({
    this.id = const Value.absent(),
    required String sn,
    required String clientId,
    required InfoType type,
    required int userId,
    this.avatar = const Value.absent(),
    required String nickname,
    required bool unread,
    required int status,
    required String message,
    required int messageAt,
    this.rowid = const Value.absent(),
  }) : sn = Value(sn),
       clientId = Value(clientId),
       type = Value(type),
       userId = Value(userId),
       nickname = Value(nickname),
       unread = Value(unread),
       status = Value(status),
       message = Value(message),
       messageAt = Value(messageAt);
  static Insertable<InfosTableData> custom({
    Expression<int>? id,
    Expression<String>? sn,
    Expression<String>? clientId,
    Expression<int>? type,
    Expression<int>? userId,
    Expression<String>? avatar,
    Expression<String>? nickname,
    Expression<bool>? unread,
    Expression<int>? status,
    Expression<String>? message,
    Expression<int>? messageAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sn != null) 'sn': sn,
      if (clientId != null) 'client_id': clientId,
      if (type != null) 'type': type,
      if (userId != null) 'user_id': userId,
      if (avatar != null) 'avatar': avatar,
      if (nickname != null) 'nickname': nickname,
      if (unread != null) 'unread': unread,
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (messageAt != null) 'message_at': messageAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InfosTableCompanion copyWith({
    Value<int?>? id,
    Value<String>? sn,
    Value<String>? clientId,
    Value<InfoType>? type,
    Value<int>? userId,
    Value<String?>? avatar,
    Value<String>? nickname,
    Value<bool>? unread,
    Value<int>? status,
    Value<String>? message,
    Value<int>? messageAt,
    Value<int>? rowid,
  }) {
    return InfosTableCompanion(
      id: id ?? this.id,
      sn: sn ?? this.sn,
      clientId: clientId ?? this.clientId,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      avatar: avatar ?? this.avatar,
      nickname: nickname ?? this.nickname,
      unread: unread ?? this.unread,
      status: status ?? this.status,
      message: message ?? this.message,
      messageAt: messageAt ?? this.messageAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sn.present) {
      map['sn'] = Variable<String>(sn.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $InfosTableTable.$convertertype.toSql(type.value),
      );
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (unread.present) {
      map['unread'] = Variable<bool>(unread.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (messageAt.present) {
      map['message_at'] = Variable<int>(messageAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InfosTableCompanion(')
          ..write('id: $id, ')
          ..write('sn: $sn, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('userId: $userId, ')
          ..write('avatar: $avatar, ')
          ..write('nickname: $nickname, ')
          ..write('unread: $unread, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('messageAt: $messageAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDatas extends GeneratedDatabase {
  _$DriftDatas(QueryExecutor e) : super(e);
  $DriftDatasManager get managers => $DriftDatasManager(this);
  late final $ChatsTableTable chatsTable = $ChatsTableTable(this);
  late final $InfosTableTable infosTable = $InfosTableTable(this);
  late final DriftModel driftModel = DriftModel(this as DriftDatas);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chatsTable, infosTable];
}

typedef $$ChatsTableTableCreateCompanionBuilder =
    ChatsTableCompanion Function({
      required String sn,
      Value<int?> id,
      required ChatType type,
      required int sourceId,
      required int targetId,
      required String title,
      Value<String?> avatar,
      Value<int> unread,
      required String message,
      required int messageAt,
      Value<int> rowid,
    });
typedef $$ChatsTableTableUpdateCompanionBuilder =
    ChatsTableCompanion Function({
      Value<String> sn,
      Value<int?> id,
      Value<ChatType> type,
      Value<int> sourceId,
      Value<int> targetId,
      Value<String> title,
      Value<String?> avatar,
      Value<int> unread,
      Value<String> message,
      Value<int> messageAt,
      Value<int> rowid,
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
  ColumnFilters<String> get sn => $composableBuilder(
    column: $table.sn,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get messageAt => $composableBuilder(
    column: $table.messageAt,
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
  ColumnOrderings<String> get sn => $composableBuilder(
    column: $table.sn,
    builder: (column) => ColumnOrderings(column),
  );

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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get messageAt => $composableBuilder(
    column: $table.messageAt,
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
  GeneratedColumn<String> get sn =>
      $composableBuilder(column: $table.sn, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChatType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<int> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<int> get unread =>
      $composableBuilder(column: $table.unread, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<int> get messageAt =>
      $composableBuilder(column: $table.messageAt, builder: (column) => column);
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
                Value<String> sn = const Value.absent(),
                Value<int?> id = const Value.absent(),
                Value<ChatType> type = const Value.absent(),
                Value<int> sourceId = const Value.absent(),
                Value<int> targetId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<int> unread = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<int> messageAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatsTableCompanion(
                sn: sn,
                id: id,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                title: title,
                avatar: avatar,
                unread: unread,
                message: message,
                messageAt: messageAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sn,
                Value<int?> id = const Value.absent(),
                required ChatType type,
                required int sourceId,
                required int targetId,
                required String title,
                Value<String?> avatar = const Value.absent(),
                Value<int> unread = const Value.absent(),
                required String message,
                required int messageAt,
                Value<int> rowid = const Value.absent(),
              }) => ChatsTableCompanion.insert(
                sn: sn,
                id: id,
                type: type,
                sourceId: sourceId,
                targetId: targetId,
                title: title,
                avatar: avatar,
                unread: unread,
                message: message,
                messageAt: messageAt,
                rowid: rowid,
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
typedef $$InfosTableTableCreateCompanionBuilder =
    InfosTableCompanion Function({
      Value<int?> id,
      required String sn,
      required String clientId,
      required InfoType type,
      required int userId,
      Value<String?> avatar,
      required String nickname,
      required bool unread,
      required int status,
      required String message,
      required int messageAt,
      Value<int> rowid,
    });
typedef $$InfosTableTableUpdateCompanionBuilder =
    InfosTableCompanion Function({
      Value<int?> id,
      Value<String> sn,
      Value<String> clientId,
      Value<InfoType> type,
      Value<int> userId,
      Value<String?> avatar,
      Value<String> nickname,
      Value<bool> unread,
      Value<int> status,
      Value<String> message,
      Value<int> messageAt,
      Value<int> rowid,
    });

class $$InfosTableTableFilterComposer
    extends Composer<_$DriftDatas, $InfosTableTable> {
  $$InfosTableTableFilterComposer({
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

  ColumnFilters<String> get sn => $composableBuilder(
    column: $table.sn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<InfoType, InfoType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get messageAt => $composableBuilder(
    column: $table.messageAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InfosTableTableOrderingComposer
    extends Composer<_$DriftDatas, $InfosTableTable> {
  $$InfosTableTableOrderingComposer({
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

  ColumnOrderings<String> get sn => $composableBuilder(
    column: $table.sn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
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

  ColumnOrderings<bool> get unread => $composableBuilder(
    column: $table.unread,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get messageAt => $composableBuilder(
    column: $table.messageAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InfosTableTableAnnotationComposer
    extends Composer<_$DriftDatas, $InfosTableTable> {
  $$InfosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sn =>
      $composableBuilder(column: $table.sn, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<InfoType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<bool> get unread =>
      $composableBuilder(column: $table.unread, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<int> get messageAt =>
      $composableBuilder(column: $table.messageAt, builder: (column) => column);
}

class $$InfosTableTableTableManager
    extends
        RootTableManager<
          _$DriftDatas,
          $InfosTableTable,
          InfosTableData,
          $$InfosTableTableFilterComposer,
          $$InfosTableTableOrderingComposer,
          $$InfosTableTableAnnotationComposer,
          $$InfosTableTableCreateCompanionBuilder,
          $$InfosTableTableUpdateCompanionBuilder,
          (
            InfosTableData,
            BaseReferences<_$DriftDatas, $InfosTableTable, InfosTableData>,
          ),
          InfosTableData,
          PrefetchHooks Function()
        > {
  $$InfosTableTableTableManager(_$DriftDatas db, $InfosTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InfosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InfosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InfosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<String> sn = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<InfoType> type = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String> nickname = const Value.absent(),
                Value<bool> unread = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<int> messageAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InfosTableCompanion(
                id: id,
                sn: sn,
                clientId: clientId,
                type: type,
                userId: userId,
                avatar: avatar,
                nickname: nickname,
                unread: unread,
                status: status,
                message: message,
                messageAt: messageAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                required String sn,
                required String clientId,
                required InfoType type,
                required int userId,
                Value<String?> avatar = const Value.absent(),
                required String nickname,
                required bool unread,
                required int status,
                required String message,
                required int messageAt,
                Value<int> rowid = const Value.absent(),
              }) => InfosTableCompanion.insert(
                id: id,
                sn: sn,
                clientId: clientId,
                type: type,
                userId: userId,
                avatar: avatar,
                nickname: nickname,
                unread: unread,
                status: status,
                message: message,
                messageAt: messageAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InfosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftDatas,
      $InfosTableTable,
      InfosTableData,
      $$InfosTableTableFilterComposer,
      $$InfosTableTableOrderingComposer,
      $$InfosTableTableAnnotationComposer,
      $$InfosTableTableCreateCompanionBuilder,
      $$InfosTableTableUpdateCompanionBuilder,
      (
        InfosTableData,
        BaseReferences<_$DriftDatas, $InfosTableTable, InfosTableData>,
      ),
      InfosTableData,
      PrefetchHooks Function()
    >;

class $DriftDatasManager {
  final _$DriftDatas _db;
  $DriftDatasManager(this._db);
  $$ChatsTableTableTableManager get chatsTable =>
      $$ChatsTableTableTableManager(_db, _db.chatsTable);
  $$InfosTableTableTableManager get infosTable =>
      $$InfosTableTableTableManager(_db, _db.infosTable);
}
