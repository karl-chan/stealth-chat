// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contact extends DataClass implements Insertable<Contact> {
  final String id;
  final String name;
  final String chatSecretKey;
  Contact(
      {@required this.id, @required this.name, @required this.chatSecretKey});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Contact(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      chatSecretKey: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_secret_key']),
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
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      chatSecretKey: chatSecretKey == null && nullToAbsent
          ? const Value.absent()
          : Value(chatSecretKey),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      chatSecretKey: serializer.fromJson<String>(json['chatSecretKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'chatSecretKey': serializer.toJson<String>(chatSecretKey),
    };
  }

  Contact copyWith({String id, String name, String chatSecretKey}) => Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        chatSecretKey: chatSecretKey ?? this.chatSecretKey,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('chatSecretKey: $chatSecretKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, chatSecretKey.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.name == this.name &&
          other.chatSecretKey == this.chatSecretKey);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> chatSecretKey;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.chatSecretKey = const Value.absent(),
  });
  ContactsCompanion.insert({
    @required String id,
    @required String name,
    @required String chatSecretKey,
  })  : id = Value(id),
        name = Value(name),
        chatSecretKey = Value(chatSecretKey);
  static Insertable<Contact> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> chatSecretKey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (chatSecretKey != null) 'chat_secret_key': chatSecretKey,
    });
  }

  ContactsCompanion copyWith(
      {Value<String> id, Value<String> name, Value<String> chatSecretKey}) {
    return ContactsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      chatSecretKey: chatSecretKey ?? this.chatSecretKey,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('chatSecretKey: $chatSecretKey')
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

  @override
  List<GeneratedColumn> get $columns => [id, name, chatSecretKey];
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
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  $NotificationsTable _notifications;
  $NotificationsTable get notifications =>
      _notifications ??= $NotificationsTable(this);
  ContactsDao _contactsDao;
  ContactsDao get contactsDao => _contactsDao ??= ContactsDao(this as AppDb);
  NotificationsDao _notificationsDao;
  NotificationsDao get notificationsDao =>
      _notificationsDao ??= NotificationsDao(this as AppDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contacts, notifications];
}
