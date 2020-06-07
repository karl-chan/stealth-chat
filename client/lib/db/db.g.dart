// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contact extends DataClass implements Insertable<Contact> {
  final String id;
  final String ofUser;
  Contact({@required this.id, @required this.ofUser});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Contact(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      ofUser:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}of_user']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || ofUser != null) {
      map['of_user'] = Variable<String>(ofUser);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      ofUser:
          ofUser == null && nullToAbsent ? const Value.absent() : Value(ofUser),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<String>(json['id']),
      ofUser: serializer.fromJson<String>(json['ofUser']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ofUser': serializer.toJson<String>(ofUser),
    };
  }

  Contact copyWith({String id, String ofUser}) => Contact(
        id: id ?? this.id,
        ofUser: ofUser ?? this.ofUser,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('ofUser: $ofUser')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, ofUser.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact && other.id == this.id && other.ofUser == this.ofUser);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<String> id;
  final Value<String> ofUser;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.ofUser = const Value.absent(),
  });
  ContactsCompanion.insert({
    @required String id,
    @required String ofUser,
  })  : id = Value(id),
        ofUser = Value(ofUser);
  static Insertable<Contact> custom({
    Expression<String> id,
    Expression<String> ofUser,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ofUser != null) 'of_user': ofUser,
    });
  }

  ContactsCompanion copyWith({Value<String> id, Value<String> ofUser}) {
    return ContactsCompanion(
      id: id ?? this.id,
      ofUser: ofUser ?? this.ofUser,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ofUser.present) {
      map['of_user'] = Variable<String>(ofUser.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('ofUser: $ofUser')
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

  final VerificationMeta _ofUserMeta = const VerificationMeta('ofUser');
  GeneratedTextColumn _ofUser;
  @override
  GeneratedTextColumn get ofUser => _ofUser ??= _constructOfUser();
  GeneratedTextColumn _constructOfUser() {
    return GeneratedTextColumn(
      'of_user',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, ofUser];
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
    if (data.containsKey('of_user')) {
      context.handle(_ofUserMeta,
          ofUser.isAcceptableOrUnknown(data['of_user'], _ofUserMeta));
    } else if (isInserting) {
      context.missing(_ofUserMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  ContactsDao _contactsDao;
  ContactsDao get contactsDao => _contactsDao ??= ContactsDao(this as AppDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contacts];
}
