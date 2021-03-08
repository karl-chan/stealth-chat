// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatMessage extends DataClass implements Insertable<ChatMessage> {
  final String contactId;
  final bool isSelf;
  final String message;
  final DateTime timestamp;
  final DateTime sentTimestamp;
  final DateTime deliveredTimestamp;
  final DateTime readTimestamp;
  final DateTime expiryTimestamp;
  final int attachmentType;
  final String attachmentName;
  final Uint8List attachment;
  ChatMessage(
      {@required this.contactId,
      @required this.isSelf,
      @required this.message,
      @required this.timestamp,
      this.sentTimestamp,
      this.deliveredTimestamp,
      this.readTimestamp,
      this.expiryTimestamp,
      @required this.attachmentType,
      this.attachmentName,
      this.attachment});
  factory ChatMessage.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    return ChatMessage(
      contactId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_id']),
      isSelf:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_self']),
      message:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}message']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      sentTimestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sent_timestamp']),
      deliveredTimestamp: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}delivered_timestamp']),
      readTimestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}read_timestamp']),
      expiryTimestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expiry_timestamp']),
      attachmentType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachment_type']),
      attachmentName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachment_name']),
      attachment: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || contactId != null) {
      map['contact_id'] = Variable<String>(contactId);
    }
    if (!nullToAbsent || isSelf != null) {
      map['is_self'] = Variable<bool>(isSelf);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    if (!nullToAbsent || sentTimestamp != null) {
      map['sent_timestamp'] = Variable<DateTime>(sentTimestamp);
    }
    if (!nullToAbsent || deliveredTimestamp != null) {
      map['delivered_timestamp'] = Variable<DateTime>(deliveredTimestamp);
    }
    if (!nullToAbsent || readTimestamp != null) {
      map['read_timestamp'] = Variable<DateTime>(readTimestamp);
    }
    if (!nullToAbsent || expiryTimestamp != null) {
      map['expiry_timestamp'] = Variable<DateTime>(expiryTimestamp);
    }
    if (!nullToAbsent || attachmentType != null) {
      map['attachment_type'] = Variable<int>(attachmentType);
    }
    if (!nullToAbsent || attachmentName != null) {
      map['attachment_name'] = Variable<String>(attachmentName);
    }
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<Uint8List>(attachment);
    }
    return map;
  }

  ChatMessagesCompanion toCompanion(bool nullToAbsent) {
    return ChatMessagesCompanion(
      contactId: contactId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactId),
      isSelf:
          isSelf == null && nullToAbsent ? const Value.absent() : Value(isSelf),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      sentTimestamp: sentTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(sentTimestamp),
      deliveredTimestamp: deliveredTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveredTimestamp),
      readTimestamp: readTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(readTimestamp),
      expiryTimestamp: expiryTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryTimestamp),
      attachmentType: attachmentType == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentType),
      attachmentName: attachmentName == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentName),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
    );
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatMessage(
      contactId: serializer.fromJson<String>(json['contactId']),
      isSelf: serializer.fromJson<bool>(json['isSelf']),
      message: serializer.fromJson<String>(json['message']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      sentTimestamp: serializer.fromJson<DateTime>(json['sentTimestamp']),
      deliveredTimestamp:
          serializer.fromJson<DateTime>(json['deliveredTimestamp']),
      readTimestamp: serializer.fromJson<DateTime>(json['readTimestamp']),
      expiryTimestamp: serializer.fromJson<DateTime>(json['expiryTimestamp']),
      attachmentType: serializer.fromJson<int>(json['attachmentType']),
      attachmentName: serializer.fromJson<String>(json['attachmentName']),
      attachment: serializer.fromJson<Uint8List>(json['attachment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contactId': serializer.toJson<String>(contactId),
      'isSelf': serializer.toJson<bool>(isSelf),
      'message': serializer.toJson<String>(message),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'sentTimestamp': serializer.toJson<DateTime>(sentTimestamp),
      'deliveredTimestamp': serializer.toJson<DateTime>(deliveredTimestamp),
      'readTimestamp': serializer.toJson<DateTime>(readTimestamp),
      'expiryTimestamp': serializer.toJson<DateTime>(expiryTimestamp),
      'attachmentType': serializer.toJson<int>(attachmentType),
      'attachmentName': serializer.toJson<String>(attachmentName),
      'attachment': serializer.toJson<Uint8List>(attachment),
    };
  }

  ChatMessage copyWith(
          {String contactId,
          bool isSelf,
          String message,
          DateTime timestamp,
          DateTime sentTimestamp,
          DateTime deliveredTimestamp,
          DateTime readTimestamp,
          DateTime expiryTimestamp,
          int attachmentType,
          String attachmentName,
          Uint8List attachment}) =>
      ChatMessage(
        contactId: contactId ?? this.contactId,
        isSelf: isSelf ?? this.isSelf,
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
        sentTimestamp: sentTimestamp ?? this.sentTimestamp,
        deliveredTimestamp: deliveredTimestamp ?? this.deliveredTimestamp,
        readTimestamp: readTimestamp ?? this.readTimestamp,
        expiryTimestamp: expiryTimestamp ?? this.expiryTimestamp,
        attachmentType: attachmentType ?? this.attachmentType,
        attachmentName: attachmentName ?? this.attachmentName,
        attachment: attachment ?? this.attachment,
      );
  @override
  String toString() {
    return (StringBuffer('ChatMessage(')
          ..write('contactId: $contactId, ')
          ..write('isSelf: $isSelf, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp, ')
          ..write('sentTimestamp: $sentTimestamp, ')
          ..write('deliveredTimestamp: $deliveredTimestamp, ')
          ..write('readTimestamp: $readTimestamp, ')
          ..write('expiryTimestamp: $expiryTimestamp, ')
          ..write('attachmentType: $attachmentType, ')
          ..write('attachmentName: $attachmentName, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      contactId.hashCode,
      $mrjc(
          isSelf.hashCode,
          $mrjc(
              message.hashCode,
              $mrjc(
                  timestamp.hashCode,
                  $mrjc(
                      sentTimestamp.hashCode,
                      $mrjc(
                          deliveredTimestamp.hashCode,
                          $mrjc(
                              readTimestamp.hashCode,
                              $mrjc(
                                  expiryTimestamp.hashCode,
                                  $mrjc(
                                      attachmentType.hashCode,
                                      $mrjc(attachmentName.hashCode,
                                          attachment.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatMessage &&
          other.contactId == this.contactId &&
          other.isSelf == this.isSelf &&
          other.message == this.message &&
          other.timestamp == this.timestamp &&
          other.sentTimestamp == this.sentTimestamp &&
          other.deliveredTimestamp == this.deliveredTimestamp &&
          other.readTimestamp == this.readTimestamp &&
          other.expiryTimestamp == this.expiryTimestamp &&
          other.attachmentType == this.attachmentType &&
          other.attachmentName == this.attachmentName &&
          other.attachment == this.attachment);
}

class ChatMessagesCompanion extends UpdateCompanion<ChatMessage> {
  final Value<String> contactId;
  final Value<bool> isSelf;
  final Value<String> message;
  final Value<DateTime> timestamp;
  final Value<DateTime> sentTimestamp;
  final Value<DateTime> deliveredTimestamp;
  final Value<DateTime> readTimestamp;
  final Value<DateTime> expiryTimestamp;
  final Value<int> attachmentType;
  final Value<String> attachmentName;
  final Value<Uint8List> attachment;
  const ChatMessagesCompanion({
    this.contactId = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.message = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.sentTimestamp = const Value.absent(),
    this.deliveredTimestamp = const Value.absent(),
    this.readTimestamp = const Value.absent(),
    this.expiryTimestamp = const Value.absent(),
    this.attachmentType = const Value.absent(),
    this.attachmentName = const Value.absent(),
    this.attachment = const Value.absent(),
  });
  ChatMessagesCompanion.insert({
    @required String contactId,
    @required bool isSelf,
    this.message = const Value.absent(),
    @required DateTime timestamp,
    this.sentTimestamp = const Value.absent(),
    this.deliveredTimestamp = const Value.absent(),
    this.readTimestamp = const Value.absent(),
    this.expiryTimestamp = const Value.absent(),
    this.attachmentType = const Value.absent(),
    this.attachmentName = const Value.absent(),
    this.attachment = const Value.absent(),
  })  : contactId = Value(contactId),
        isSelf = Value(isSelf),
        timestamp = Value(timestamp);
  static Insertable<ChatMessage> custom({
    Expression<String> contactId,
    Expression<bool> isSelf,
    Expression<String> message,
    Expression<DateTime> timestamp,
    Expression<DateTime> sentTimestamp,
    Expression<DateTime> deliveredTimestamp,
    Expression<DateTime> readTimestamp,
    Expression<DateTime> expiryTimestamp,
    Expression<int> attachmentType,
    Expression<String> attachmentName,
    Expression<Uint8List> attachment,
  }) {
    return RawValuesInsertable({
      if (contactId != null) 'contact_id': contactId,
      if (isSelf != null) 'is_self': isSelf,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
      if (sentTimestamp != null) 'sent_timestamp': sentTimestamp,
      if (deliveredTimestamp != null) 'delivered_timestamp': deliveredTimestamp,
      if (readTimestamp != null) 'read_timestamp': readTimestamp,
      if (expiryTimestamp != null) 'expiry_timestamp': expiryTimestamp,
      if (attachmentType != null) 'attachment_type': attachmentType,
      if (attachmentName != null) 'attachment_name': attachmentName,
      if (attachment != null) 'attachment': attachment,
    });
  }

  ChatMessagesCompanion copyWith(
      {Value<String> contactId,
      Value<bool> isSelf,
      Value<String> message,
      Value<DateTime> timestamp,
      Value<DateTime> sentTimestamp,
      Value<DateTime> deliveredTimestamp,
      Value<DateTime> readTimestamp,
      Value<DateTime> expiryTimestamp,
      Value<int> attachmentType,
      Value<String> attachmentName,
      Value<Uint8List> attachment}) {
    return ChatMessagesCompanion(
      contactId: contactId ?? this.contactId,
      isSelf: isSelf ?? this.isSelf,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      sentTimestamp: sentTimestamp ?? this.sentTimestamp,
      deliveredTimestamp: deliveredTimestamp ?? this.deliveredTimestamp,
      readTimestamp: readTimestamp ?? this.readTimestamp,
      expiryTimestamp: expiryTimestamp ?? this.expiryTimestamp,
      attachmentType: attachmentType ?? this.attachmentType,
      attachmentName: attachmentName ?? this.attachmentName,
      attachment: attachment ?? this.attachment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contactId.present) {
      map['contact_id'] = Variable<String>(contactId.value);
    }
    if (isSelf.present) {
      map['is_self'] = Variable<bool>(isSelf.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (sentTimestamp.present) {
      map['sent_timestamp'] = Variable<DateTime>(sentTimestamp.value);
    }
    if (deliveredTimestamp.present) {
      map['delivered_timestamp'] = Variable<DateTime>(deliveredTimestamp.value);
    }
    if (readTimestamp.present) {
      map['read_timestamp'] = Variable<DateTime>(readTimestamp.value);
    }
    if (expiryTimestamp.present) {
      map['expiry_timestamp'] = Variable<DateTime>(expiryTimestamp.value);
    }
    if (attachmentType.present) {
      map['attachment_type'] = Variable<int>(attachmentType.value);
    }
    if (attachmentName.present) {
      map['attachment_name'] = Variable<String>(attachmentName.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<Uint8List>(attachment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesCompanion(')
          ..write('contactId: $contactId, ')
          ..write('isSelf: $isSelf, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp, ')
          ..write('sentTimestamp: $sentTimestamp, ')
          ..write('deliveredTimestamp: $deliveredTimestamp, ')
          ..write('readTimestamp: $readTimestamp, ')
          ..write('expiryTimestamp: $expiryTimestamp, ')
          ..write('attachmentType: $attachmentType, ')
          ..write('attachmentName: $attachmentName, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesTable extends ChatMessages
    with TableInfo<$ChatMessagesTable, ChatMessage> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChatMessagesTable(this._db, [this._alias]);
  final VerificationMeta _contactIdMeta = const VerificationMeta('contactId');
  GeneratedTextColumn _contactId;
  @override
  GeneratedTextColumn get contactId => _contactId ??= _constructContactId();
  GeneratedTextColumn _constructContactId() {
    return GeneratedTextColumn(
      'contact_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isSelfMeta = const VerificationMeta('isSelf');
  GeneratedBoolColumn _isSelf;
  @override
  GeneratedBoolColumn get isSelf => _isSelf ??= _constructIsSelf();
  GeneratedBoolColumn _constructIsSelf() {
    return GeneratedBoolColumn(
      'is_self',
      $tableName,
      false,
    );
  }

  final VerificationMeta _messageMeta = const VerificationMeta('message');
  GeneratedTextColumn _message;
  @override
  GeneratedTextColumn get message => _message ??= _constructMessage();
  GeneratedTextColumn _constructMessage() {
    return GeneratedTextColumn('message', $tableName, false,
        defaultValue: const Constant(''));
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sentTimestampMeta =
      const VerificationMeta('sentTimestamp');
  GeneratedDateTimeColumn _sentTimestamp;
  @override
  GeneratedDateTimeColumn get sentTimestamp =>
      _sentTimestamp ??= _constructSentTimestamp();
  GeneratedDateTimeColumn _constructSentTimestamp() {
    return GeneratedDateTimeColumn(
      'sent_timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deliveredTimestampMeta =
      const VerificationMeta('deliveredTimestamp');
  GeneratedDateTimeColumn _deliveredTimestamp;
  @override
  GeneratedDateTimeColumn get deliveredTimestamp =>
      _deliveredTimestamp ??= _constructDeliveredTimestamp();
  GeneratedDateTimeColumn _constructDeliveredTimestamp() {
    return GeneratedDateTimeColumn(
      'delivered_timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _readTimestampMeta =
      const VerificationMeta('readTimestamp');
  GeneratedDateTimeColumn _readTimestamp;
  @override
  GeneratedDateTimeColumn get readTimestamp =>
      _readTimestamp ??= _constructReadTimestamp();
  GeneratedDateTimeColumn _constructReadTimestamp() {
    return GeneratedDateTimeColumn(
      'read_timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiryTimestampMeta =
      const VerificationMeta('expiryTimestamp');
  GeneratedDateTimeColumn _expiryTimestamp;
  @override
  GeneratedDateTimeColumn get expiryTimestamp =>
      _expiryTimestamp ??= _constructExpiryTimestamp();
  GeneratedDateTimeColumn _constructExpiryTimestamp() {
    return GeneratedDateTimeColumn(
      'expiry_timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _attachmentTypeMeta =
      const VerificationMeta('attachmentType');
  GeneratedIntColumn _attachmentType;
  @override
  GeneratedIntColumn get attachmentType =>
      _attachmentType ??= _constructAttachmentType();
  GeneratedIntColumn _constructAttachmentType() {
    return GeneratedIntColumn('attachment_type', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _attachmentNameMeta =
      const VerificationMeta('attachmentName');
  GeneratedTextColumn _attachmentName;
  @override
  GeneratedTextColumn get attachmentName =>
      _attachmentName ??= _constructAttachmentName();
  GeneratedTextColumn _constructAttachmentName() {
    return GeneratedTextColumn(
      'attachment_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _attachmentMeta = const VerificationMeta('attachment');
  GeneratedBlobColumn _attachment;
  @override
  GeneratedBlobColumn get attachment => _attachment ??= _constructAttachment();
  GeneratedBlobColumn _constructAttachment() {
    return GeneratedBlobColumn(
      'attachment',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        contactId,
        isSelf,
        message,
        timestamp,
        sentTimestamp,
        deliveredTimestamp,
        readTimestamp,
        expiryTimestamp,
        attachmentType,
        attachmentName,
        attachment
      ];
  @override
  $ChatMessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chat_messages';
  @override
  final String actualTableName = 'chat_messages';
  @override
  VerificationContext validateIntegrity(Insertable<ChatMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('contact_id')) {
      context.handle(_contactIdMeta,
          contactId.isAcceptableOrUnknown(data['contact_id'], _contactIdMeta));
    } else if (isInserting) {
      context.missing(_contactIdMeta);
    }
    if (data.containsKey('is_self')) {
      context.handle(_isSelfMeta,
          isSelf.isAcceptableOrUnknown(data['is_self'], _isSelfMeta));
    } else if (isInserting) {
      context.missing(_isSelfMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message'], _messageMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('sent_timestamp')) {
      context.handle(
          _sentTimestampMeta,
          sentTimestamp.isAcceptableOrUnknown(
              data['sent_timestamp'], _sentTimestampMeta));
    }
    if (data.containsKey('delivered_timestamp')) {
      context.handle(
          _deliveredTimestampMeta,
          deliveredTimestamp.isAcceptableOrUnknown(
              data['delivered_timestamp'], _deliveredTimestampMeta));
    }
    if (data.containsKey('read_timestamp')) {
      context.handle(
          _readTimestampMeta,
          readTimestamp.isAcceptableOrUnknown(
              data['read_timestamp'], _readTimestampMeta));
    }
    if (data.containsKey('expiry_timestamp')) {
      context.handle(
          _expiryTimestampMeta,
          expiryTimestamp.isAcceptableOrUnknown(
              data['expiry_timestamp'], _expiryTimestampMeta));
    }
    if (data.containsKey('attachment_type')) {
      context.handle(
          _attachmentTypeMeta,
          attachmentType.isAcceptableOrUnknown(
              data['attachment_type'], _attachmentTypeMeta));
    }
    if (data.containsKey('attachment_name')) {
      context.handle(
          _attachmentNameMeta,
          attachmentName.isAcceptableOrUnknown(
              data['attachment_name'], _attachmentNameMeta));
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment'], _attachmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {contactId, timestamp};
  @override
  ChatMessage map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChatMessage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChatMessagesTable createAlias(String alias) {
    return $ChatMessagesTable(_db, alias);
  }
}

class Contact extends DataClass implements Insertable<Contact> {
  final String id;
  final String name;
  final String chatSecretKey;
  final int color;
  final Uint8List avatar;
  final Uint8List wallpaper;
  final bool online;
  final DateTime lastSeen;
  final bool archived;
  Contact(
      {@required this.id,
      @required this.name,
      @required this.chatSecretKey,
      @required this.color,
      this.avatar,
      this.wallpaper,
      @required this.online,
      @required this.lastSeen,
      @required this.archived});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Contact(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      chatSecretKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_secret_key']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      avatar: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      wallpaper: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}wallpaper']),
      online:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}online']),
      lastSeen: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_seen']),
      archived:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archived']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || chatSecretKey != null) {
      map['chat_secret_key'] = Variable<String>(chatSecretKey);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<Uint8List>(avatar);
    }
    if (!nullToAbsent || wallpaper != null) {
      map['wallpaper'] = Variable<Uint8List>(wallpaper);
    }
    if (!nullToAbsent || online != null) {
      map['online'] = Variable<bool>(online);
    }
    if (!nullToAbsent || lastSeen != null) {
      map['last_seen'] = Variable<DateTime>(lastSeen);
    }
    if (!nullToAbsent || archived != null) {
      map['archived'] = Variable<bool>(archived);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      chatSecretKey: chatSecretKey == null && nullToAbsent
          ? const Value.absent()
          : Value(chatSecretKey),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      wallpaper: wallpaper == null && nullToAbsent
          ? const Value.absent()
          : Value(wallpaper),
      online:
          online == null && nullToAbsent ? const Value.absent() : Value(online),
      lastSeen: lastSeen == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeen),
      archived: archived == null && nullToAbsent
          ? const Value.absent()
          : Value(archived),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      chatSecretKey: serializer.fromJson<String>(json['chatSecretKey']),
      color: serializer.fromJson<int>(json['color']),
      avatar: serializer.fromJson<Uint8List>(json['avatar']),
      wallpaper: serializer.fromJson<Uint8List>(json['wallpaper']),
      online: serializer.fromJson<bool>(json['online']),
      lastSeen: serializer.fromJson<DateTime>(json['lastSeen']),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'chatSecretKey': serializer.toJson<String>(chatSecretKey),
      'color': serializer.toJson<int>(color),
      'avatar': serializer.toJson<Uint8List>(avatar),
      'wallpaper': serializer.toJson<Uint8List>(wallpaper),
      'online': serializer.toJson<bool>(online),
      'lastSeen': serializer.toJson<DateTime>(lastSeen),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  Contact copyWith(
          {String id,
          String name,
          String chatSecretKey,
          int color,
          Uint8List avatar,
          Uint8List wallpaper,
          bool online,
          DateTime lastSeen,
          bool archived}) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        chatSecretKey: chatSecretKey ?? this.chatSecretKey,
        color: color ?? this.color,
        avatar: avatar ?? this.avatar,
        wallpaper: wallpaper ?? this.wallpaper,
        online: online ?? this.online,
        lastSeen: lastSeen ?? this.lastSeen,
        archived: archived ?? this.archived,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('chatSecretKey: $chatSecretKey, ')
          ..write('color: $color, ')
          ..write('avatar: $avatar, ')
          ..write('wallpaper: $wallpaper, ')
          ..write('online: $online, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              chatSecretKey.hashCode,
              $mrjc(
                  color.hashCode,
                  $mrjc(
                      avatar.hashCode,
                      $mrjc(
                          wallpaper.hashCode,
                          $mrjc(
                              online.hashCode,
                              $mrjc(
                                  lastSeen.hashCode, archived.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.name == this.name &&
          other.chatSecretKey == this.chatSecretKey &&
          other.color == this.color &&
          other.avatar == this.avatar &&
          other.wallpaper == this.wallpaper &&
          other.online == this.online &&
          other.lastSeen == this.lastSeen &&
          other.archived == this.archived);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> chatSecretKey;
  final Value<int> color;
  final Value<Uint8List> avatar;
  final Value<Uint8List> wallpaper;
  final Value<bool> online;
  final Value<DateTime> lastSeen;
  final Value<bool> archived;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.chatSecretKey = const Value.absent(),
    this.color = const Value.absent(),
    this.avatar = const Value.absent(),
    this.wallpaper = const Value.absent(),
    this.online = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.archived = const Value.absent(),
  });
  ContactsCompanion.insert({
    @required String id,
    @required String name,
    @required String chatSecretKey,
    this.color = const Value.absent(),
    this.avatar = const Value.absent(),
    this.wallpaper = const Value.absent(),
    this.online = const Value.absent(),
    @required DateTime lastSeen,
    this.archived = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        chatSecretKey = Value(chatSecretKey),
        lastSeen = Value(lastSeen);
  static Insertable<Contact> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> chatSecretKey,
    Expression<int> color,
    Expression<Uint8List> avatar,
    Expression<Uint8List> wallpaper,
    Expression<bool> online,
    Expression<DateTime> lastSeen,
    Expression<bool> archived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (chatSecretKey != null) 'chat_secret_key': chatSecretKey,
      if (color != null) 'color': color,
      if (avatar != null) 'avatar': avatar,
      if (wallpaper != null) 'wallpaper': wallpaper,
      if (online != null) 'online': online,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (archived != null) 'archived': archived,
    });
  }

  ContactsCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> chatSecretKey,
      Value<int> color,
      Value<Uint8List> avatar,
      Value<Uint8List> wallpaper,
      Value<bool> online,
      Value<DateTime> lastSeen,
      Value<bool> archived}) {
    return ContactsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      chatSecretKey: chatSecretKey ?? this.chatSecretKey,
      color: color ?? this.color,
      avatar: avatar ?? this.avatar,
      wallpaper: wallpaper ?? this.wallpaper,
      online: online ?? this.online,
      lastSeen: lastSeen ?? this.lastSeen,
      archived: archived ?? this.archived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (chatSecretKey.present) {
      map['chat_secret_key'] = Variable<String>(chatSecretKey.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<Uint8List>(avatar.value);
    }
    if (wallpaper.present) {
      map['wallpaper'] = Variable<Uint8List>(wallpaper.value);
    }
    if (online.present) {
      map['online'] = Variable<bool>(online.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('chatSecretKey: $chatSecretKey, ')
          ..write('color: $color, ')
          ..write('avatar: $avatar, ')
          ..write('wallpaper: $wallpaper, ')
          ..write('online: $online, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chatSecretKeyMeta =
      const VerificationMeta('chatSecretKey');
  GeneratedTextColumn _chatSecretKey;
  @override
  GeneratedTextColumn get chatSecretKey =>
      _chatSecretKey ??= _constructChatSecretKey();
  GeneratedTextColumn _constructChatSecretKey() {
    return GeneratedTextColumn(
      'chat_secret_key',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn('color', $tableName, false,
        defaultValue: const Constant(ConstColours.GREEN_700));
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedBlobColumn _avatar;
  @override
  GeneratedBlobColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedBlobColumn _constructAvatar() {
    return GeneratedBlobColumn(
      'avatar',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wallpaperMeta = const VerificationMeta('wallpaper');
  GeneratedBlobColumn _wallpaper;
  @override
  GeneratedBlobColumn get wallpaper => _wallpaper ??= _constructWallpaper();
  GeneratedBlobColumn _constructWallpaper() {
    return GeneratedBlobColumn(
      'wallpaper',
      $tableName,
      true,
    );
  }

  final VerificationMeta _onlineMeta = const VerificationMeta('online');
  GeneratedBoolColumn _online;
  @override
  GeneratedBoolColumn get online => _online ??= _constructOnline();
  GeneratedBoolColumn _constructOnline() {
    return GeneratedBoolColumn('online', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _lastSeenMeta = const VerificationMeta('lastSeen');
  GeneratedDateTimeColumn _lastSeen;
  @override
  GeneratedDateTimeColumn get lastSeen => _lastSeen ??= _constructLastSeen();
  GeneratedDateTimeColumn _constructLastSeen() {
    return GeneratedDateTimeColumn(
      'last_seen',
      $tableName,
      false,
    );
  }

  final VerificationMeta _archivedMeta = const VerificationMeta('archived');
  GeneratedBoolColumn _archived;
  @override
  GeneratedBoolColumn get archived => _archived ??= _constructArchived();
  GeneratedBoolColumn _constructArchived() {
    return GeneratedBoolColumn('archived', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        chatSecretKey,
        color,
        avatar,
        wallpaper,
        online,
        lastSeen,
        archived
      ];
  @override
  $ContactsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts';
  @override
  final String actualTableName = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('chat_secret_key')) {
      context.handle(
          _chatSecretKeyMeta,
          chatSecretKey.isAcceptableOrUnknown(
              data['chat_secret_key'], _chatSecretKeyMeta));
    } else if (isInserting) {
      context.missing(_chatSecretKeyMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar'], _avatarMeta));
    }
    if (data.containsKey('wallpaper')) {
      context.handle(_wallpaperMeta,
          wallpaper.isAcceptableOrUnknown(data['wallpaper'], _wallpaperMeta));
    }
    if (data.containsKey('online')) {
      context.handle(_onlineMeta,
          online.isAcceptableOrUnknown(data['online'], _onlineMeta));
    }
    if (data.containsKey('last_seen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['last_seen'], _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived'], _archivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contact.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(_db, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final int id;
  final String title;
  final String subtitle;
  final String body;
  final DateTime timestamp;
  final bool unread;
  Notification(
      {@required this.id,
      @required this.title,
      @required this.subtitle,
      @required this.body,
      @required this.timestamp,
      @required this.unread});
  factory Notification.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Notification(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      subtitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}subtitle']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      unread:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    if (!nullToAbsent || unread != null) {
      map['unread'] = Variable<bool>(unread);
    }
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      body: serializer.fromJson<String>(json['body']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      unread: serializer.fromJson<bool>(json['unread']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'body': serializer.toJson<String>(body),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'unread': serializer.toJson<bool>(unread),
    };
  }

  Notification copyWith(
          {int id,
          String title,
          String subtitle,
          String body,
          DateTime timestamp,
          bool unread}) =>
      Notification(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        body: body ?? this.body,
        timestamp: timestamp ?? this.timestamp,
        unread: unread ?? this.unread,
      );
  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('body: $body, ')
          ..write('timestamp: $timestamp, ')
          ..write('unread: $unread')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              subtitle.hashCode,
              $mrjc(body.hashCode,
                  $mrjc(timestamp.hashCode, unread.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.body == this.body &&
          other.timestamp == this.timestamp &&
          other.unread == this.unread);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<String> body;
  final Value<DateTime> timestamp;
  final Value<bool> unread;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.body = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.unread = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String subtitle,
    @required String body,
    @required DateTime timestamp,
    @required bool unread,
  })  : title = Value(title),
        subtitle = Value(subtitle),
        body = Value(body),
        timestamp = Value(timestamp),
        unread = Value(unread);
  static Insertable<Notification> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> subtitle,
    Expression<String> body,
    Expression<DateTime> timestamp,
    Expression<bool> unread,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (body != null) 'body': body,
      if (timestamp != null) 'timestamp': timestamp,
      if (unread != null) 'unread': unread,
    });
  }

  NotificationsCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> subtitle,
      Value<String> body,
      Value<DateTime> timestamp,
      Value<bool> unread}) {
    return NotificationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      unread: unread ?? this.unread,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (unread.present) {
      map['unread'] = Variable<bool>(unread.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('body: $body, ')
          ..write('timestamp: $timestamp, ')
          ..write('unread: $unread')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  final GeneratedDatabase _db;
  final String _alias;
  $NotificationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subtitleMeta = const VerificationMeta('subtitle');
  GeneratedTextColumn _subtitle;
  @override
  GeneratedTextColumn get subtitle => _subtitle ??= _constructSubtitle();
  GeneratedTextColumn _constructSubtitle() {
    return GeneratedTextColumn(
      'subtitle',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedBoolColumn _unread;
  @override
  GeneratedBoolColumn get unread => _unread ??= _constructUnread();
  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, subtitle, body, timestamp, unread];
  @override
  $NotificationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notifications';
  @override
  final String actualTableName = 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<Notification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle'], _subtitleMeta));
    } else if (isInserting) {
      context.missing(_subtitleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body'], _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(_unreadMeta,
          unread.isAcceptableOrUnknown(data['unread'], _unreadMeta));
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Notification.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(_db, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ChatMessagesTable _chatMessages;
  $ChatMessagesTable get chatMessages =>
      _chatMessages ??= $ChatMessagesTable(this);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  $NotificationsTable _notifications;
  $NotificationsTable get notifications =>
      _notifications ??= $NotificationsTable(this);
  ChatMessagesDao _chatMessagesDao;
  ChatMessagesDao get chatMessagesDao =>
      _chatMessagesDao ??= ChatMessagesDao(this as AppDb);
  ContactsDao _contactsDao;
  ContactsDao get contactsDao => _contactsDao ??= ContactsDao(this as AppDb);
  NotificationsDao _notificationsDao;
  NotificationsDao get notificationsDao =>
      _notificationsDao ??= NotificationsDao(this as AppDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chatMessages, contacts, notifications];
}
