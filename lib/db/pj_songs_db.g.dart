// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pj_songs_db.dart';

// ignore_for_file: type=lint
class $PjSongsTable extends PjSongs with TableInfo<$PjSongsTable, PjSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _songNameMeta =
      const VerificationMeta('songName');
  @override
  late final GeneratedColumn<String> songName = GeneratedColumn<String>(
      'song_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eDiffMeta = const VerificationMeta('eDiff');
  @override
  late final GeneratedColumn<int> eDiff = GeneratedColumn<int>(
      'e_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nDiffMeta = const VerificationMeta('nDiff');
  @override
  late final GeneratedColumn<int> nDiff = GeneratedColumn<int>(
      'n_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hDiffMeta = const VerificationMeta('hDiff');
  @override
  late final GeneratedColumn<int> hDiff = GeneratedColumn<int>(
      'h_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exDiffMeta = const VerificationMeta('exDiff');
  @override
  late final GeneratedColumn<int> exDiff = GeneratedColumn<int>(
      'ex_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mDiffMeta = const VerificationMeta('mDiff');
  @override
  late final GeneratedColumn<int> mDiff = GeneratedColumn<int>(
      'm_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, songName, eDiff, nDiff, hDiff, exDiff, mDiff];
  @override
  String get aliasedName => _alias ?? 'pj_songs';
  @override
  String get actualTableName => 'pj_songs';
  @override
  VerificationContext validateIntegrity(Insertable<PjSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_name')) {
      context.handle(_songNameMeta,
          songName.isAcceptableOrUnknown(data['song_name']!, _songNameMeta));
    } else if (isInserting) {
      context.missing(_songNameMeta);
    }
    if (data.containsKey('e_diff')) {
      context.handle(
          _eDiffMeta, eDiff.isAcceptableOrUnknown(data['e_diff']!, _eDiffMeta));
    } else if (isInserting) {
      context.missing(_eDiffMeta);
    }
    if (data.containsKey('n_diff')) {
      context.handle(
          _nDiffMeta, nDiff.isAcceptableOrUnknown(data['n_diff']!, _nDiffMeta));
    } else if (isInserting) {
      context.missing(_nDiffMeta);
    }
    if (data.containsKey('h_diff')) {
      context.handle(
          _hDiffMeta, hDiff.isAcceptableOrUnknown(data['h_diff']!, _hDiffMeta));
    } else if (isInserting) {
      context.missing(_hDiffMeta);
    }
    if (data.containsKey('ex_diff')) {
      context.handle(_exDiffMeta,
          exDiff.isAcceptableOrUnknown(data['ex_diff']!, _exDiffMeta));
    } else if (isInserting) {
      context.missing(_exDiffMeta);
    }
    if (data.containsKey('m_diff')) {
      context.handle(
          _mDiffMeta, mDiff.isAcceptableOrUnknown(data['m_diff']!, _mDiffMeta));
    } else if (isInserting) {
      context.missing(_mDiffMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PjSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      songName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_name'])!,
      eDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}e_diff'])!,
      nDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}n_diff'])!,
      hDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}h_diff'])!,
      exDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ex_diff'])!,
      mDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}m_diff'])!,
    );
  }

  @override
  $PjSongsTable createAlias(String alias) {
    return $PjSongsTable(attachedDatabase, alias);
  }
}

class PjSong extends DataClass implements Insertable<PjSong> {
  final int id;
  final String songName;
  final int eDiff;
  final int nDiff;
  final int hDiff;
  final int exDiff;
  final int mDiff;
  const PjSong(
      {required this.id,
      required this.songName,
      required this.eDiff,
      required this.nDiff,
      required this.hDiff,
      required this.exDiff,
      required this.mDiff});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_name'] = Variable<String>(songName);
    map['e_diff'] = Variable<int>(eDiff);
    map['n_diff'] = Variable<int>(nDiff);
    map['h_diff'] = Variable<int>(hDiff);
    map['ex_diff'] = Variable<int>(exDiff);
    map['m_diff'] = Variable<int>(mDiff);
    return map;
  }

  PjSongsCompanion toCompanion(bool nullToAbsent) {
    return PjSongsCompanion(
      id: Value(id),
      songName: Value(songName),
      eDiff: Value(eDiff),
      nDiff: Value(nDiff),
      hDiff: Value(hDiff),
      exDiff: Value(exDiff),
      mDiff: Value(mDiff),
    );
  }

  factory PjSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjSong(
      id: serializer.fromJson<int>(json['id']),
      songName: serializer.fromJson<String>(json['songName']),
      eDiff: serializer.fromJson<int>(json['eDiff']),
      nDiff: serializer.fromJson<int>(json['nDiff']),
      hDiff: serializer.fromJson<int>(json['hDiff']),
      exDiff: serializer.fromJson<int>(json['exDiff']),
      mDiff: serializer.fromJson<int>(json['mDiff']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'songName': serializer.toJson<String>(songName),
      'eDiff': serializer.toJson<int>(eDiff),
      'nDiff': serializer.toJson<int>(nDiff),
      'hDiff': serializer.toJson<int>(hDiff),
      'exDiff': serializer.toJson<int>(exDiff),
      'mDiff': serializer.toJson<int>(mDiff),
    };
  }

  PjSong copyWith(
          {int? id,
          String? songName,
          int? eDiff,
          int? nDiff,
          int? hDiff,
          int? exDiff,
          int? mDiff}) =>
      PjSong(
        id: id ?? this.id,
        songName: songName ?? this.songName,
        eDiff: eDiff ?? this.eDiff,
        nDiff: nDiff ?? this.nDiff,
        hDiff: hDiff ?? this.hDiff,
        exDiff: exDiff ?? this.exDiff,
        mDiff: mDiff ?? this.mDiff,
      );
  @override
  String toString() {
    return (StringBuffer('PjSong(')
          ..write('id: $id, ')
          ..write('songName: $songName, ')
          ..write('eDiff: $eDiff, ')
          ..write('nDiff: $nDiff, ')
          ..write('hDiff: $hDiff, ')
          ..write('exDiff: $exDiff, ')
          ..write('mDiff: $mDiff')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, songName, eDiff, nDiff, hDiff, exDiff, mDiff);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjSong &&
          other.id == this.id &&
          other.songName == this.songName &&
          other.eDiff == this.eDiff &&
          other.nDiff == this.nDiff &&
          other.hDiff == this.hDiff &&
          other.exDiff == this.exDiff &&
          other.mDiff == this.mDiff);
}

class PjSongsCompanion extends UpdateCompanion<PjSong> {
  final Value<int> id;
  final Value<String> songName;
  final Value<int> eDiff;
  final Value<int> nDiff;
  final Value<int> hDiff;
  final Value<int> exDiff;
  final Value<int> mDiff;
  const PjSongsCompanion({
    this.id = const Value.absent(),
    this.songName = const Value.absent(),
    this.eDiff = const Value.absent(),
    this.nDiff = const Value.absent(),
    this.hDiff = const Value.absent(),
    this.exDiff = const Value.absent(),
    this.mDiff = const Value.absent(),
  });
  PjSongsCompanion.insert({
    this.id = const Value.absent(),
    required String songName,
    required int eDiff,
    required int nDiff,
    required int hDiff,
    required int exDiff,
    required int mDiff,
  })  : songName = Value(songName),
        eDiff = Value(eDiff),
        nDiff = Value(nDiff),
        hDiff = Value(hDiff),
        exDiff = Value(exDiff),
        mDiff = Value(mDiff);
  static Insertable<PjSong> custom({
    Expression<int>? id,
    Expression<String>? songName,
    Expression<int>? eDiff,
    Expression<int>? nDiff,
    Expression<int>? hDiff,
    Expression<int>? exDiff,
    Expression<int>? mDiff,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songName != null) 'song_name': songName,
      if (eDiff != null) 'e_diff': eDiff,
      if (nDiff != null) 'n_diff': nDiff,
      if (hDiff != null) 'h_diff': hDiff,
      if (exDiff != null) 'ex_diff': exDiff,
      if (mDiff != null) 'm_diff': mDiff,
    });
  }

  PjSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? songName,
      Value<int>? eDiff,
      Value<int>? nDiff,
      Value<int>? hDiff,
      Value<int>? exDiff,
      Value<int>? mDiff}) {
    return PjSongsCompanion(
      id: id ?? this.id,
      songName: songName ?? this.songName,
      eDiff: eDiff ?? this.eDiff,
      nDiff: nDiff ?? this.nDiff,
      hDiff: hDiff ?? this.hDiff,
      exDiff: exDiff ?? this.exDiff,
      mDiff: mDiff ?? this.mDiff,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songName.present) {
      map['song_name'] = Variable<String>(songName.value);
    }
    if (eDiff.present) {
      map['e_diff'] = Variable<int>(eDiff.value);
    }
    if (nDiff.present) {
      map['n_diff'] = Variable<int>(nDiff.value);
    }
    if (hDiff.present) {
      map['h_diff'] = Variable<int>(hDiff.value);
    }
    if (exDiff.present) {
      map['ex_diff'] = Variable<int>(exDiff.value);
    }
    if (mDiff.present) {
      map['m_diff'] = Variable<int>(mDiff.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjSongsCompanion(')
          ..write('id: $id, ')
          ..write('songName: $songName, ')
          ..write('eDiff: $eDiff, ')
          ..write('nDiff: $nDiff, ')
          ..write('hDiff: $hDiff, ')
          ..write('exDiff: $exDiff, ')
          ..write('mDiff: $mDiff')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PjSongsTable pjSongs = $PjSongsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pjSongs];
}
