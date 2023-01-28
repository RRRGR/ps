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
  static const VerificationMeta _easyDiffMeta =
      const VerificationMeta('easyDiff');
  @override
  late final GeneratedColumn<int> easyDiff = GeneratedColumn<int>(
      'easy_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _normalDiffMeta =
      const VerificationMeta('normalDiff');
  @override
  late final GeneratedColumn<int> normalDiff = GeneratedColumn<int>(
      'normal_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hardDiffMeta =
      const VerificationMeta('hardDiff');
  @override
  late final GeneratedColumn<int> hardDiff = GeneratedColumn<int>(
      'hard_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expertDiffMeta =
      const VerificationMeta('expertDiff');
  @override
  late final GeneratedColumn<int> expertDiff = GeneratedColumn<int>(
      'expert_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _masterDiffMeta =
      const VerificationMeta('masterDiff');
  @override
  late final GeneratedColumn<int> masterDiff = GeneratedColumn<int>(
      'master_diff', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, songName, easyDiff, normalDiff, hardDiff, expertDiff, masterDiff];
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
    if (data.containsKey('easy_diff')) {
      context.handle(_easyDiffMeta,
          easyDiff.isAcceptableOrUnknown(data['easy_diff']!, _easyDiffMeta));
    } else if (isInserting) {
      context.missing(_easyDiffMeta);
    }
    if (data.containsKey('normal_diff')) {
      context.handle(
          _normalDiffMeta,
          normalDiff.isAcceptableOrUnknown(
              data['normal_diff']!, _normalDiffMeta));
    } else if (isInserting) {
      context.missing(_normalDiffMeta);
    }
    if (data.containsKey('hard_diff')) {
      context.handle(_hardDiffMeta,
          hardDiff.isAcceptableOrUnknown(data['hard_diff']!, _hardDiffMeta));
    } else if (isInserting) {
      context.missing(_hardDiffMeta);
    }
    if (data.containsKey('expert_diff')) {
      context.handle(
          _expertDiffMeta,
          expertDiff.isAcceptableOrUnknown(
              data['expert_diff']!, _expertDiffMeta));
    } else if (isInserting) {
      context.missing(_expertDiffMeta);
    }
    if (data.containsKey('master_diff')) {
      context.handle(
          _masterDiffMeta,
          masterDiff.isAcceptableOrUnknown(
              data['master_diff']!, _masterDiffMeta));
    } else if (isInserting) {
      context.missing(_masterDiffMeta);
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
      easyDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_diff'])!,
      normalDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_diff'])!,
      hardDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_diff'])!,
      expertDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_diff'])!,
      masterDiff: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_diff'])!,
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
  final int easyDiff;
  final int normalDiff;
  final int hardDiff;
  final int expertDiff;
  final int masterDiff;
  const PjSong(
      {required this.id,
      required this.songName,
      required this.easyDiff,
      required this.normalDiff,
      required this.hardDiff,
      required this.expertDiff,
      required this.masterDiff});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_name'] = Variable<String>(songName);
    map['easy_diff'] = Variable<int>(easyDiff);
    map['normal_diff'] = Variable<int>(normalDiff);
    map['hard_diff'] = Variable<int>(hardDiff);
    map['expert_diff'] = Variable<int>(expertDiff);
    map['master_diff'] = Variable<int>(masterDiff);
    return map;
  }

  PjSongsCompanion toCompanion(bool nullToAbsent) {
    return PjSongsCompanion(
      id: Value(id),
      songName: Value(songName),
      easyDiff: Value(easyDiff),
      normalDiff: Value(normalDiff),
      hardDiff: Value(hardDiff),
      expertDiff: Value(expertDiff),
      masterDiff: Value(masterDiff),
    );
  }

  factory PjSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjSong(
      id: serializer.fromJson<int>(json['id']),
      songName: serializer.fromJson<String>(json['songName']),
      easyDiff: serializer.fromJson<int>(json['easyDiff']),
      normalDiff: serializer.fromJson<int>(json['normalDiff']),
      hardDiff: serializer.fromJson<int>(json['hardDiff']),
      expertDiff: serializer.fromJson<int>(json['expertDiff']),
      masterDiff: serializer.fromJson<int>(json['masterDiff']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'songName': serializer.toJson<String>(songName),
      'easyDiff': serializer.toJson<int>(easyDiff),
      'normalDiff': serializer.toJson<int>(normalDiff),
      'hardDiff': serializer.toJson<int>(hardDiff),
      'expertDiff': serializer.toJson<int>(expertDiff),
      'masterDiff': serializer.toJson<int>(masterDiff),
    };
  }

  PjSong copyWith(
          {int? id,
          String? songName,
          int? easyDiff,
          int? normalDiff,
          int? hardDiff,
          int? expertDiff,
          int? masterDiff}) =>
      PjSong(
        id: id ?? this.id,
        songName: songName ?? this.songName,
        easyDiff: easyDiff ?? this.easyDiff,
        normalDiff: normalDiff ?? this.normalDiff,
        hardDiff: hardDiff ?? this.hardDiff,
        expertDiff: expertDiff ?? this.expertDiff,
        masterDiff: masterDiff ?? this.masterDiff,
      );
  @override
  String toString() {
    return (StringBuffer('PjSong(')
          ..write('id: $id, ')
          ..write('songName: $songName, ')
          ..write('easyDiff: $easyDiff, ')
          ..write('normalDiff: $normalDiff, ')
          ..write('hardDiff: $hardDiff, ')
          ..write('expertDiff: $expertDiff, ')
          ..write('masterDiff: $masterDiff')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, songName, easyDiff, normalDiff, hardDiff, expertDiff, masterDiff);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjSong &&
          other.id == this.id &&
          other.songName == this.songName &&
          other.easyDiff == this.easyDiff &&
          other.normalDiff == this.normalDiff &&
          other.hardDiff == this.hardDiff &&
          other.expertDiff == this.expertDiff &&
          other.masterDiff == this.masterDiff);
}

class PjSongsCompanion extends UpdateCompanion<PjSong> {
  final Value<int> id;
  final Value<String> songName;
  final Value<int> easyDiff;
  final Value<int> normalDiff;
  final Value<int> hardDiff;
  final Value<int> expertDiff;
  final Value<int> masterDiff;
  const PjSongsCompanion({
    this.id = const Value.absent(),
    this.songName = const Value.absent(),
    this.easyDiff = const Value.absent(),
    this.normalDiff = const Value.absent(),
    this.hardDiff = const Value.absent(),
    this.expertDiff = const Value.absent(),
    this.masterDiff = const Value.absent(),
  });
  PjSongsCompanion.insert({
    this.id = const Value.absent(),
    required String songName,
    required int easyDiff,
    required int normalDiff,
    required int hardDiff,
    required int expertDiff,
    required int masterDiff,
  })  : songName = Value(songName),
        easyDiff = Value(easyDiff),
        normalDiff = Value(normalDiff),
        hardDiff = Value(hardDiff),
        expertDiff = Value(expertDiff),
        masterDiff = Value(masterDiff);
  static Insertable<PjSong> custom({
    Expression<int>? id,
    Expression<String>? songName,
    Expression<int>? easyDiff,
    Expression<int>? normalDiff,
    Expression<int>? hardDiff,
    Expression<int>? expertDiff,
    Expression<int>? masterDiff,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songName != null) 'song_name': songName,
      if (easyDiff != null) 'easy_diff': easyDiff,
      if (normalDiff != null) 'normal_diff': normalDiff,
      if (hardDiff != null) 'hard_diff': hardDiff,
      if (expertDiff != null) 'expert_diff': expertDiff,
      if (masterDiff != null) 'master_diff': masterDiff,
    });
  }

  PjSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? songName,
      Value<int>? easyDiff,
      Value<int>? normalDiff,
      Value<int>? hardDiff,
      Value<int>? expertDiff,
      Value<int>? masterDiff}) {
    return PjSongsCompanion(
      id: id ?? this.id,
      songName: songName ?? this.songName,
      easyDiff: easyDiff ?? this.easyDiff,
      normalDiff: normalDiff ?? this.normalDiff,
      hardDiff: hardDiff ?? this.hardDiff,
      expertDiff: expertDiff ?? this.expertDiff,
      masterDiff: masterDiff ?? this.masterDiff,
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
    if (easyDiff.present) {
      map['easy_diff'] = Variable<int>(easyDiff.value);
    }
    if (normalDiff.present) {
      map['normal_diff'] = Variable<int>(normalDiff.value);
    }
    if (hardDiff.present) {
      map['hard_diff'] = Variable<int>(hardDiff.value);
    }
    if (expertDiff.present) {
      map['expert_diff'] = Variable<int>(expertDiff.value);
    }
    if (masterDiff.present) {
      map['master_diff'] = Variable<int>(masterDiff.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjSongsCompanion(')
          ..write('id: $id, ')
          ..write('songName: $songName, ')
          ..write('easyDiff: $easyDiff, ')
          ..write('normalDiff: $normalDiff, ')
          ..write('hardDiff: $hardDiff, ')
          ..write('expertDiff: $expertDiff, ')
          ..write('masterDiff: $masterDiff')
          ..write(')'))
        .toString();
  }
}

class $PjEasyScoresTable extends PjEasyScores
    with TableInfo<$PjEasyScoresTable, PjEasyScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjEasyScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pj_songs (id)'));
  static const VerificationMeta _easyHighScoreMeta =
      const VerificationMeta('easyHighScore');
  @override
  late final GeneratedColumn<int> easyHighScore = GeneratedColumn<int>(
      'easy_high_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestExScoreMeta =
      const VerificationMeta('easyBestExScore');
  @override
  late final GeneratedColumn<int> easyBestExScore = GeneratedColumn<int>(
      'easy_best_ex_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestPerfectMeta =
      const VerificationMeta('easyBestPerfect');
  @override
  late final GeneratedColumn<int> easyBestPerfect = GeneratedColumn<int>(
      'easy_best_perfect', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestGreatMeta =
      const VerificationMeta('easyBestGreat');
  @override
  late final GeneratedColumn<int> easyBestGreat = GeneratedColumn<int>(
      'easy_best_great', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestGoodMeta =
      const VerificationMeta('easyBestGood');
  @override
  late final GeneratedColumn<int> easyBestGood = GeneratedColumn<int>(
      'easy_best_good', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestBadMeta =
      const VerificationMeta('easyBestBad');
  @override
  late final GeneratedColumn<int> easyBestBad = GeneratedColumn<int>(
      'easy_best_bad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyBestMissMeta =
      const VerificationMeta('easyBestMiss');
  @override
  late final GeneratedColumn<int> easyBestMiss = GeneratedColumn<int>(
      'easy_best_miss', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easyFCedMeta =
      const VerificationMeta('easyFCed');
  @override
  late final GeneratedColumn<bool> easyFCed =
      GeneratedColumn<bool>('easy_f_ced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("easy_f_ced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _easyAPedMeta =
      const VerificationMeta('easyAPed');
  @override
  late final GeneratedColumn<bool> easyAPed =
      GeneratedColumn<bool>('easy_a_ped', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("easy_a_ped" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        easyHighScore,
        easyBestExScore,
        easyBestPerfect,
        easyBestGreat,
        easyBestGood,
        easyBestBad,
        easyBestMiss,
        easyFCed,
        easyAPed
      ];
  @override
  String get aliasedName => _alias ?? 'pj_easy_scores';
  @override
  String get actualTableName => 'pj_easy_scores';
  @override
  VerificationContext validateIntegrity(Insertable<PjEasyScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('easy_high_score')) {
      context.handle(
          _easyHighScoreMeta,
          easyHighScore.isAcceptableOrUnknown(
              data['easy_high_score']!, _easyHighScoreMeta));
    }
    if (data.containsKey('easy_best_ex_score')) {
      context.handle(
          _easyBestExScoreMeta,
          easyBestExScore.isAcceptableOrUnknown(
              data['easy_best_ex_score']!, _easyBestExScoreMeta));
    }
    if (data.containsKey('easy_best_perfect')) {
      context.handle(
          _easyBestPerfectMeta,
          easyBestPerfect.isAcceptableOrUnknown(
              data['easy_best_perfect']!, _easyBestPerfectMeta));
    }
    if (data.containsKey('easy_best_great')) {
      context.handle(
          _easyBestGreatMeta,
          easyBestGreat.isAcceptableOrUnknown(
              data['easy_best_great']!, _easyBestGreatMeta));
    }
    if (data.containsKey('easy_best_good')) {
      context.handle(
          _easyBestGoodMeta,
          easyBestGood.isAcceptableOrUnknown(
              data['easy_best_good']!, _easyBestGoodMeta));
    }
    if (data.containsKey('easy_best_bad')) {
      context.handle(
          _easyBestBadMeta,
          easyBestBad.isAcceptableOrUnknown(
              data['easy_best_bad']!, _easyBestBadMeta));
    }
    if (data.containsKey('easy_best_miss')) {
      context.handle(
          _easyBestMissMeta,
          easyBestMiss.isAcceptableOrUnknown(
              data['easy_best_miss']!, _easyBestMissMeta));
    }
    if (data.containsKey('easy_f_ced')) {
      context.handle(_easyFCedMeta,
          easyFCed.isAcceptableOrUnknown(data['easy_f_ced']!, _easyFCedMeta));
    }
    if (data.containsKey('easy_a_ped')) {
      context.handle(_easyAPedMeta,
          easyAPed.isAcceptableOrUnknown(data['easy_a_ped']!, _easyAPedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PjEasyScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjEasyScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      easyHighScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_high_score'])!,
      easyBestExScore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}easy_best_ex_score'])!,
      easyBestPerfect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_best_perfect'])!,
      easyBestGreat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_best_great'])!,
      easyBestGood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_best_good'])!,
      easyBestBad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_best_bad'])!,
      easyBestMiss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}easy_best_miss'])!,
      easyFCed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}easy_f_ced'])!,
      easyAPed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}easy_a_ped'])!,
    );
  }

  @override
  $PjEasyScoresTable createAlias(String alias) {
    return $PjEasyScoresTable(attachedDatabase, alias);
  }
}

class PjEasyScore extends DataClass implements Insertable<PjEasyScore> {
  final int id;
  final int easyHighScore;
  final int easyBestExScore;
  final int easyBestPerfect;
  final int easyBestGreat;
  final int easyBestGood;
  final int easyBestBad;
  final int easyBestMiss;
  final bool easyFCed;
  final bool easyAPed;
  const PjEasyScore(
      {required this.id,
      required this.easyHighScore,
      required this.easyBestExScore,
      required this.easyBestPerfect,
      required this.easyBestGreat,
      required this.easyBestGood,
      required this.easyBestBad,
      required this.easyBestMiss,
      required this.easyFCed,
      required this.easyAPed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['easy_high_score'] = Variable<int>(easyHighScore);
    map['easy_best_ex_score'] = Variable<int>(easyBestExScore);
    map['easy_best_perfect'] = Variable<int>(easyBestPerfect);
    map['easy_best_great'] = Variable<int>(easyBestGreat);
    map['easy_best_good'] = Variable<int>(easyBestGood);
    map['easy_best_bad'] = Variable<int>(easyBestBad);
    map['easy_best_miss'] = Variable<int>(easyBestMiss);
    map['easy_f_ced'] = Variable<bool>(easyFCed);
    map['easy_a_ped'] = Variable<bool>(easyAPed);
    return map;
  }

  PjEasyScoresCompanion toCompanion(bool nullToAbsent) {
    return PjEasyScoresCompanion(
      id: Value(id),
      easyHighScore: Value(easyHighScore),
      easyBestExScore: Value(easyBestExScore),
      easyBestPerfect: Value(easyBestPerfect),
      easyBestGreat: Value(easyBestGreat),
      easyBestGood: Value(easyBestGood),
      easyBestBad: Value(easyBestBad),
      easyBestMiss: Value(easyBestMiss),
      easyFCed: Value(easyFCed),
      easyAPed: Value(easyAPed),
    );
  }

  factory PjEasyScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjEasyScore(
      id: serializer.fromJson<int>(json['id']),
      easyHighScore: serializer.fromJson<int>(json['easyHighScore']),
      easyBestExScore: serializer.fromJson<int>(json['easyBestExScore']),
      easyBestPerfect: serializer.fromJson<int>(json['easyBestPerfect']),
      easyBestGreat: serializer.fromJson<int>(json['easyBestGreat']),
      easyBestGood: serializer.fromJson<int>(json['easyBestGood']),
      easyBestBad: serializer.fromJson<int>(json['easyBestBad']),
      easyBestMiss: serializer.fromJson<int>(json['easyBestMiss']),
      easyFCed: serializer.fromJson<bool>(json['easyFCed']),
      easyAPed: serializer.fromJson<bool>(json['easyAPed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'easyHighScore': serializer.toJson<int>(easyHighScore),
      'easyBestExScore': serializer.toJson<int>(easyBestExScore),
      'easyBestPerfect': serializer.toJson<int>(easyBestPerfect),
      'easyBestGreat': serializer.toJson<int>(easyBestGreat),
      'easyBestGood': serializer.toJson<int>(easyBestGood),
      'easyBestBad': serializer.toJson<int>(easyBestBad),
      'easyBestMiss': serializer.toJson<int>(easyBestMiss),
      'easyFCed': serializer.toJson<bool>(easyFCed),
      'easyAPed': serializer.toJson<bool>(easyAPed),
    };
  }

  PjEasyScore copyWith(
          {int? id,
          int? easyHighScore,
          int? easyBestExScore,
          int? easyBestPerfect,
          int? easyBestGreat,
          int? easyBestGood,
          int? easyBestBad,
          int? easyBestMiss,
          bool? easyFCed,
          bool? easyAPed}) =>
      PjEasyScore(
        id: id ?? this.id,
        easyHighScore: easyHighScore ?? this.easyHighScore,
        easyBestExScore: easyBestExScore ?? this.easyBestExScore,
        easyBestPerfect: easyBestPerfect ?? this.easyBestPerfect,
        easyBestGreat: easyBestGreat ?? this.easyBestGreat,
        easyBestGood: easyBestGood ?? this.easyBestGood,
        easyBestBad: easyBestBad ?? this.easyBestBad,
        easyBestMiss: easyBestMiss ?? this.easyBestMiss,
        easyFCed: easyFCed ?? this.easyFCed,
        easyAPed: easyAPed ?? this.easyAPed,
      );
  @override
  String toString() {
    return (StringBuffer('PjEasyScore(')
          ..write('id: $id, ')
          ..write('easyHighScore: $easyHighScore, ')
          ..write('easyBestExScore: $easyBestExScore, ')
          ..write('easyBestPerfect: $easyBestPerfect, ')
          ..write('easyBestGreat: $easyBestGreat, ')
          ..write('easyBestGood: $easyBestGood, ')
          ..write('easyBestBad: $easyBestBad, ')
          ..write('easyBestMiss: $easyBestMiss, ')
          ..write('easyFCed: $easyFCed, ')
          ..write('easyAPed: $easyAPed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      easyHighScore,
      easyBestExScore,
      easyBestPerfect,
      easyBestGreat,
      easyBestGood,
      easyBestBad,
      easyBestMiss,
      easyFCed,
      easyAPed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjEasyScore &&
          other.id == this.id &&
          other.easyHighScore == this.easyHighScore &&
          other.easyBestExScore == this.easyBestExScore &&
          other.easyBestPerfect == this.easyBestPerfect &&
          other.easyBestGreat == this.easyBestGreat &&
          other.easyBestGood == this.easyBestGood &&
          other.easyBestBad == this.easyBestBad &&
          other.easyBestMiss == this.easyBestMiss &&
          other.easyFCed == this.easyFCed &&
          other.easyAPed == this.easyAPed);
}

class PjEasyScoresCompanion extends UpdateCompanion<PjEasyScore> {
  final Value<int> id;
  final Value<int> easyHighScore;
  final Value<int> easyBestExScore;
  final Value<int> easyBestPerfect;
  final Value<int> easyBestGreat;
  final Value<int> easyBestGood;
  final Value<int> easyBestBad;
  final Value<int> easyBestMiss;
  final Value<bool> easyFCed;
  final Value<bool> easyAPed;
  const PjEasyScoresCompanion({
    this.id = const Value.absent(),
    this.easyHighScore = const Value.absent(),
    this.easyBestExScore = const Value.absent(),
    this.easyBestPerfect = const Value.absent(),
    this.easyBestGreat = const Value.absent(),
    this.easyBestGood = const Value.absent(),
    this.easyBestBad = const Value.absent(),
    this.easyBestMiss = const Value.absent(),
    this.easyFCed = const Value.absent(),
    this.easyAPed = const Value.absent(),
  });
  PjEasyScoresCompanion.insert({
    required int id,
    this.easyHighScore = const Value.absent(),
    this.easyBestExScore = const Value.absent(),
    this.easyBestPerfect = const Value.absent(),
    this.easyBestGreat = const Value.absent(),
    this.easyBestGood = const Value.absent(),
    this.easyBestBad = const Value.absent(),
    this.easyBestMiss = const Value.absent(),
    this.easyFCed = const Value.absent(),
    this.easyAPed = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PjEasyScore> custom({
    Expression<int>? id,
    Expression<int>? easyHighScore,
    Expression<int>? easyBestExScore,
    Expression<int>? easyBestPerfect,
    Expression<int>? easyBestGreat,
    Expression<int>? easyBestGood,
    Expression<int>? easyBestBad,
    Expression<int>? easyBestMiss,
    Expression<bool>? easyFCed,
    Expression<bool>? easyAPed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (easyHighScore != null) 'easy_high_score': easyHighScore,
      if (easyBestExScore != null) 'easy_best_ex_score': easyBestExScore,
      if (easyBestPerfect != null) 'easy_best_perfect': easyBestPerfect,
      if (easyBestGreat != null) 'easy_best_great': easyBestGreat,
      if (easyBestGood != null) 'easy_best_good': easyBestGood,
      if (easyBestBad != null) 'easy_best_bad': easyBestBad,
      if (easyBestMiss != null) 'easy_best_miss': easyBestMiss,
      if (easyFCed != null) 'easy_f_ced': easyFCed,
      if (easyAPed != null) 'easy_a_ped': easyAPed,
    });
  }

  PjEasyScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? easyHighScore,
      Value<int>? easyBestExScore,
      Value<int>? easyBestPerfect,
      Value<int>? easyBestGreat,
      Value<int>? easyBestGood,
      Value<int>? easyBestBad,
      Value<int>? easyBestMiss,
      Value<bool>? easyFCed,
      Value<bool>? easyAPed}) {
    return PjEasyScoresCompanion(
      id: id ?? this.id,
      easyHighScore: easyHighScore ?? this.easyHighScore,
      easyBestExScore: easyBestExScore ?? this.easyBestExScore,
      easyBestPerfect: easyBestPerfect ?? this.easyBestPerfect,
      easyBestGreat: easyBestGreat ?? this.easyBestGreat,
      easyBestGood: easyBestGood ?? this.easyBestGood,
      easyBestBad: easyBestBad ?? this.easyBestBad,
      easyBestMiss: easyBestMiss ?? this.easyBestMiss,
      easyFCed: easyFCed ?? this.easyFCed,
      easyAPed: easyAPed ?? this.easyAPed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (easyHighScore.present) {
      map['easy_high_score'] = Variable<int>(easyHighScore.value);
    }
    if (easyBestExScore.present) {
      map['easy_best_ex_score'] = Variable<int>(easyBestExScore.value);
    }
    if (easyBestPerfect.present) {
      map['easy_best_perfect'] = Variable<int>(easyBestPerfect.value);
    }
    if (easyBestGreat.present) {
      map['easy_best_great'] = Variable<int>(easyBestGreat.value);
    }
    if (easyBestGood.present) {
      map['easy_best_good'] = Variable<int>(easyBestGood.value);
    }
    if (easyBestBad.present) {
      map['easy_best_bad'] = Variable<int>(easyBestBad.value);
    }
    if (easyBestMiss.present) {
      map['easy_best_miss'] = Variable<int>(easyBestMiss.value);
    }
    if (easyFCed.present) {
      map['easy_f_ced'] = Variable<bool>(easyFCed.value);
    }
    if (easyAPed.present) {
      map['easy_a_ped'] = Variable<bool>(easyAPed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjEasyScoresCompanion(')
          ..write('id: $id, ')
          ..write('easyHighScore: $easyHighScore, ')
          ..write('easyBestExScore: $easyBestExScore, ')
          ..write('easyBestPerfect: $easyBestPerfect, ')
          ..write('easyBestGreat: $easyBestGreat, ')
          ..write('easyBestGood: $easyBestGood, ')
          ..write('easyBestBad: $easyBestBad, ')
          ..write('easyBestMiss: $easyBestMiss, ')
          ..write('easyFCed: $easyFCed, ')
          ..write('easyAPed: $easyAPed')
          ..write(')'))
        .toString();
  }
}

class $PjNormalScoresTable extends PjNormalScores
    with TableInfo<$PjNormalScoresTable, PjNormalScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjNormalScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pj_songs (id)'));
  static const VerificationMeta _normalHighScoreMeta =
      const VerificationMeta('normalHighScore');
  @override
  late final GeneratedColumn<int> normalHighScore = GeneratedColumn<int>(
      'normal_high_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestExScoreMeta =
      const VerificationMeta('normalBestExScore');
  @override
  late final GeneratedColumn<int> normalBestExScore = GeneratedColumn<int>(
      'normal_best_ex_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestPerfectMeta =
      const VerificationMeta('normalBestPerfect');
  @override
  late final GeneratedColumn<int> normalBestPerfect = GeneratedColumn<int>(
      'normal_best_perfect', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestGreatMeta =
      const VerificationMeta('normalBestGreat');
  @override
  late final GeneratedColumn<int> normalBestGreat = GeneratedColumn<int>(
      'normal_best_great', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestGoodMeta =
      const VerificationMeta('normalBestGood');
  @override
  late final GeneratedColumn<int> normalBestGood = GeneratedColumn<int>(
      'normal_best_good', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestBadMeta =
      const VerificationMeta('normalBestBad');
  @override
  late final GeneratedColumn<int> normalBestBad = GeneratedColumn<int>(
      'normal_best_bad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalBestMissMeta =
      const VerificationMeta('normalBestMiss');
  @override
  late final GeneratedColumn<int> normalBestMiss = GeneratedColumn<int>(
      'normal_best_miss', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _normalFCedMeta =
      const VerificationMeta('normalFCed');
  @override
  late final GeneratedColumn<bool> normalFCed =
      GeneratedColumn<bool>('normal_f_ced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("normal_f_ced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _normalAPedMeta =
      const VerificationMeta('normalAPed');
  @override
  late final GeneratedColumn<bool> normalAPed =
      GeneratedColumn<bool>('normal_a_ped', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("normal_a_ped" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        normalHighScore,
        normalBestExScore,
        normalBestPerfect,
        normalBestGreat,
        normalBestGood,
        normalBestBad,
        normalBestMiss,
        normalFCed,
        normalAPed
      ];
  @override
  String get aliasedName => _alias ?? 'pj_normal_scores';
  @override
  String get actualTableName => 'pj_normal_scores';
  @override
  VerificationContext validateIntegrity(Insertable<PjNormalScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('normal_high_score')) {
      context.handle(
          _normalHighScoreMeta,
          normalHighScore.isAcceptableOrUnknown(
              data['normal_high_score']!, _normalHighScoreMeta));
    }
    if (data.containsKey('normal_best_ex_score')) {
      context.handle(
          _normalBestExScoreMeta,
          normalBestExScore.isAcceptableOrUnknown(
              data['normal_best_ex_score']!, _normalBestExScoreMeta));
    }
    if (data.containsKey('normal_best_perfect')) {
      context.handle(
          _normalBestPerfectMeta,
          normalBestPerfect.isAcceptableOrUnknown(
              data['normal_best_perfect']!, _normalBestPerfectMeta));
    }
    if (data.containsKey('normal_best_great')) {
      context.handle(
          _normalBestGreatMeta,
          normalBestGreat.isAcceptableOrUnknown(
              data['normal_best_great']!, _normalBestGreatMeta));
    }
    if (data.containsKey('normal_best_good')) {
      context.handle(
          _normalBestGoodMeta,
          normalBestGood.isAcceptableOrUnknown(
              data['normal_best_good']!, _normalBestGoodMeta));
    }
    if (data.containsKey('normal_best_bad')) {
      context.handle(
          _normalBestBadMeta,
          normalBestBad.isAcceptableOrUnknown(
              data['normal_best_bad']!, _normalBestBadMeta));
    }
    if (data.containsKey('normal_best_miss')) {
      context.handle(
          _normalBestMissMeta,
          normalBestMiss.isAcceptableOrUnknown(
              data['normal_best_miss']!, _normalBestMissMeta));
    }
    if (data.containsKey('normal_f_ced')) {
      context.handle(
          _normalFCedMeta,
          normalFCed.isAcceptableOrUnknown(
              data['normal_f_ced']!, _normalFCedMeta));
    }
    if (data.containsKey('normal_a_ped')) {
      context.handle(
          _normalAPedMeta,
          normalAPed.isAcceptableOrUnknown(
              data['normal_a_ped']!, _normalAPedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PjNormalScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjNormalScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      normalHighScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_high_score'])!,
      normalBestExScore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}normal_best_ex_score'])!,
      normalBestPerfect: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}normal_best_perfect'])!,
      normalBestGreat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_best_great'])!,
      normalBestGood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_best_good'])!,
      normalBestBad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_best_bad'])!,
      normalBestMiss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}normal_best_miss'])!,
      normalFCed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}normal_f_ced'])!,
      normalAPed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}normal_a_ped'])!,
    );
  }

  @override
  $PjNormalScoresTable createAlias(String alias) {
    return $PjNormalScoresTable(attachedDatabase, alias);
  }
}

class PjNormalScore extends DataClass implements Insertable<PjNormalScore> {
  final int id;
  final int normalHighScore;
  final int normalBestExScore;
  final int normalBestPerfect;
  final int normalBestGreat;
  final int normalBestGood;
  final int normalBestBad;
  final int normalBestMiss;
  final bool normalFCed;
  final bool normalAPed;
  const PjNormalScore(
      {required this.id,
      required this.normalHighScore,
      required this.normalBestExScore,
      required this.normalBestPerfect,
      required this.normalBestGreat,
      required this.normalBestGood,
      required this.normalBestBad,
      required this.normalBestMiss,
      required this.normalFCed,
      required this.normalAPed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['normal_high_score'] = Variable<int>(normalHighScore);
    map['normal_best_ex_score'] = Variable<int>(normalBestExScore);
    map['normal_best_perfect'] = Variable<int>(normalBestPerfect);
    map['normal_best_great'] = Variable<int>(normalBestGreat);
    map['normal_best_good'] = Variable<int>(normalBestGood);
    map['normal_best_bad'] = Variable<int>(normalBestBad);
    map['normal_best_miss'] = Variable<int>(normalBestMiss);
    map['normal_f_ced'] = Variable<bool>(normalFCed);
    map['normal_a_ped'] = Variable<bool>(normalAPed);
    return map;
  }

  PjNormalScoresCompanion toCompanion(bool nullToAbsent) {
    return PjNormalScoresCompanion(
      id: Value(id),
      normalHighScore: Value(normalHighScore),
      normalBestExScore: Value(normalBestExScore),
      normalBestPerfect: Value(normalBestPerfect),
      normalBestGreat: Value(normalBestGreat),
      normalBestGood: Value(normalBestGood),
      normalBestBad: Value(normalBestBad),
      normalBestMiss: Value(normalBestMiss),
      normalFCed: Value(normalFCed),
      normalAPed: Value(normalAPed),
    );
  }

  factory PjNormalScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjNormalScore(
      id: serializer.fromJson<int>(json['id']),
      normalHighScore: serializer.fromJson<int>(json['normalHighScore']),
      normalBestExScore: serializer.fromJson<int>(json['normalBestExScore']),
      normalBestPerfect: serializer.fromJson<int>(json['normalBestPerfect']),
      normalBestGreat: serializer.fromJson<int>(json['normalBestGreat']),
      normalBestGood: serializer.fromJson<int>(json['normalBestGood']),
      normalBestBad: serializer.fromJson<int>(json['normalBestBad']),
      normalBestMiss: serializer.fromJson<int>(json['normalBestMiss']),
      normalFCed: serializer.fromJson<bool>(json['normalFCed']),
      normalAPed: serializer.fromJson<bool>(json['normalAPed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'normalHighScore': serializer.toJson<int>(normalHighScore),
      'normalBestExScore': serializer.toJson<int>(normalBestExScore),
      'normalBestPerfect': serializer.toJson<int>(normalBestPerfect),
      'normalBestGreat': serializer.toJson<int>(normalBestGreat),
      'normalBestGood': serializer.toJson<int>(normalBestGood),
      'normalBestBad': serializer.toJson<int>(normalBestBad),
      'normalBestMiss': serializer.toJson<int>(normalBestMiss),
      'normalFCed': serializer.toJson<bool>(normalFCed),
      'normalAPed': serializer.toJson<bool>(normalAPed),
    };
  }

  PjNormalScore copyWith(
          {int? id,
          int? normalHighScore,
          int? normalBestExScore,
          int? normalBestPerfect,
          int? normalBestGreat,
          int? normalBestGood,
          int? normalBestBad,
          int? normalBestMiss,
          bool? normalFCed,
          bool? normalAPed}) =>
      PjNormalScore(
        id: id ?? this.id,
        normalHighScore: normalHighScore ?? this.normalHighScore,
        normalBestExScore: normalBestExScore ?? this.normalBestExScore,
        normalBestPerfect: normalBestPerfect ?? this.normalBestPerfect,
        normalBestGreat: normalBestGreat ?? this.normalBestGreat,
        normalBestGood: normalBestGood ?? this.normalBestGood,
        normalBestBad: normalBestBad ?? this.normalBestBad,
        normalBestMiss: normalBestMiss ?? this.normalBestMiss,
        normalFCed: normalFCed ?? this.normalFCed,
        normalAPed: normalAPed ?? this.normalAPed,
      );
  @override
  String toString() {
    return (StringBuffer('PjNormalScore(')
          ..write('id: $id, ')
          ..write('normalHighScore: $normalHighScore, ')
          ..write('normalBestExScore: $normalBestExScore, ')
          ..write('normalBestPerfect: $normalBestPerfect, ')
          ..write('normalBestGreat: $normalBestGreat, ')
          ..write('normalBestGood: $normalBestGood, ')
          ..write('normalBestBad: $normalBestBad, ')
          ..write('normalBestMiss: $normalBestMiss, ')
          ..write('normalFCed: $normalFCed, ')
          ..write('normalAPed: $normalAPed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      normalHighScore,
      normalBestExScore,
      normalBestPerfect,
      normalBestGreat,
      normalBestGood,
      normalBestBad,
      normalBestMiss,
      normalFCed,
      normalAPed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjNormalScore &&
          other.id == this.id &&
          other.normalHighScore == this.normalHighScore &&
          other.normalBestExScore == this.normalBestExScore &&
          other.normalBestPerfect == this.normalBestPerfect &&
          other.normalBestGreat == this.normalBestGreat &&
          other.normalBestGood == this.normalBestGood &&
          other.normalBestBad == this.normalBestBad &&
          other.normalBestMiss == this.normalBestMiss &&
          other.normalFCed == this.normalFCed &&
          other.normalAPed == this.normalAPed);
}

class PjNormalScoresCompanion extends UpdateCompanion<PjNormalScore> {
  final Value<int> id;
  final Value<int> normalHighScore;
  final Value<int> normalBestExScore;
  final Value<int> normalBestPerfect;
  final Value<int> normalBestGreat;
  final Value<int> normalBestGood;
  final Value<int> normalBestBad;
  final Value<int> normalBestMiss;
  final Value<bool> normalFCed;
  final Value<bool> normalAPed;
  const PjNormalScoresCompanion({
    this.id = const Value.absent(),
    this.normalHighScore = const Value.absent(),
    this.normalBestExScore = const Value.absent(),
    this.normalBestPerfect = const Value.absent(),
    this.normalBestGreat = const Value.absent(),
    this.normalBestGood = const Value.absent(),
    this.normalBestBad = const Value.absent(),
    this.normalBestMiss = const Value.absent(),
    this.normalFCed = const Value.absent(),
    this.normalAPed = const Value.absent(),
  });
  PjNormalScoresCompanion.insert({
    required int id,
    this.normalHighScore = const Value.absent(),
    this.normalBestExScore = const Value.absent(),
    this.normalBestPerfect = const Value.absent(),
    this.normalBestGreat = const Value.absent(),
    this.normalBestGood = const Value.absent(),
    this.normalBestBad = const Value.absent(),
    this.normalBestMiss = const Value.absent(),
    this.normalFCed = const Value.absent(),
    this.normalAPed = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PjNormalScore> custom({
    Expression<int>? id,
    Expression<int>? normalHighScore,
    Expression<int>? normalBestExScore,
    Expression<int>? normalBestPerfect,
    Expression<int>? normalBestGreat,
    Expression<int>? normalBestGood,
    Expression<int>? normalBestBad,
    Expression<int>? normalBestMiss,
    Expression<bool>? normalFCed,
    Expression<bool>? normalAPed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (normalHighScore != null) 'normal_high_score': normalHighScore,
      if (normalBestExScore != null) 'normal_best_ex_score': normalBestExScore,
      if (normalBestPerfect != null) 'normal_best_perfect': normalBestPerfect,
      if (normalBestGreat != null) 'normal_best_great': normalBestGreat,
      if (normalBestGood != null) 'normal_best_good': normalBestGood,
      if (normalBestBad != null) 'normal_best_bad': normalBestBad,
      if (normalBestMiss != null) 'normal_best_miss': normalBestMiss,
      if (normalFCed != null) 'normal_f_ced': normalFCed,
      if (normalAPed != null) 'normal_a_ped': normalAPed,
    });
  }

  PjNormalScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? normalHighScore,
      Value<int>? normalBestExScore,
      Value<int>? normalBestPerfect,
      Value<int>? normalBestGreat,
      Value<int>? normalBestGood,
      Value<int>? normalBestBad,
      Value<int>? normalBestMiss,
      Value<bool>? normalFCed,
      Value<bool>? normalAPed}) {
    return PjNormalScoresCompanion(
      id: id ?? this.id,
      normalHighScore: normalHighScore ?? this.normalHighScore,
      normalBestExScore: normalBestExScore ?? this.normalBestExScore,
      normalBestPerfect: normalBestPerfect ?? this.normalBestPerfect,
      normalBestGreat: normalBestGreat ?? this.normalBestGreat,
      normalBestGood: normalBestGood ?? this.normalBestGood,
      normalBestBad: normalBestBad ?? this.normalBestBad,
      normalBestMiss: normalBestMiss ?? this.normalBestMiss,
      normalFCed: normalFCed ?? this.normalFCed,
      normalAPed: normalAPed ?? this.normalAPed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (normalHighScore.present) {
      map['normal_high_score'] = Variable<int>(normalHighScore.value);
    }
    if (normalBestExScore.present) {
      map['normal_best_ex_score'] = Variable<int>(normalBestExScore.value);
    }
    if (normalBestPerfect.present) {
      map['normal_best_perfect'] = Variable<int>(normalBestPerfect.value);
    }
    if (normalBestGreat.present) {
      map['normal_best_great'] = Variable<int>(normalBestGreat.value);
    }
    if (normalBestGood.present) {
      map['normal_best_good'] = Variable<int>(normalBestGood.value);
    }
    if (normalBestBad.present) {
      map['normal_best_bad'] = Variable<int>(normalBestBad.value);
    }
    if (normalBestMiss.present) {
      map['normal_best_miss'] = Variable<int>(normalBestMiss.value);
    }
    if (normalFCed.present) {
      map['normal_f_ced'] = Variable<bool>(normalFCed.value);
    }
    if (normalAPed.present) {
      map['normal_a_ped'] = Variable<bool>(normalAPed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjNormalScoresCompanion(')
          ..write('id: $id, ')
          ..write('normalHighScore: $normalHighScore, ')
          ..write('normalBestExScore: $normalBestExScore, ')
          ..write('normalBestPerfect: $normalBestPerfect, ')
          ..write('normalBestGreat: $normalBestGreat, ')
          ..write('normalBestGood: $normalBestGood, ')
          ..write('normalBestBad: $normalBestBad, ')
          ..write('normalBestMiss: $normalBestMiss, ')
          ..write('normalFCed: $normalFCed, ')
          ..write('normalAPed: $normalAPed')
          ..write(')'))
        .toString();
  }
}

class $PjHardScoresTable extends PjHardScores
    with TableInfo<$PjHardScoresTable, PjHardScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjHardScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pj_songs (id)'));
  static const VerificationMeta _hardHighScoreMeta =
      const VerificationMeta('hardHighScore');
  @override
  late final GeneratedColumn<int> hardHighScore = GeneratedColumn<int>(
      'hard_high_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestExScoreMeta =
      const VerificationMeta('hardBestExScore');
  @override
  late final GeneratedColumn<int> hardBestExScore = GeneratedColumn<int>(
      'hard_best_ex_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestPerfectMeta =
      const VerificationMeta('hardBestPerfect');
  @override
  late final GeneratedColumn<int> hardBestPerfect = GeneratedColumn<int>(
      'hard_best_perfect', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestGreatMeta =
      const VerificationMeta('hardBestGreat');
  @override
  late final GeneratedColumn<int> hardBestGreat = GeneratedColumn<int>(
      'hard_best_great', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestGoodMeta =
      const VerificationMeta('hardBestGood');
  @override
  late final GeneratedColumn<int> hardBestGood = GeneratedColumn<int>(
      'hard_best_good', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestBadMeta =
      const VerificationMeta('hardBestBad');
  @override
  late final GeneratedColumn<int> hardBestBad = GeneratedColumn<int>(
      'hard_best_bad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardBestMissMeta =
      const VerificationMeta('hardBestMiss');
  @override
  late final GeneratedColumn<int> hardBestMiss = GeneratedColumn<int>(
      'hard_best_miss', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hardFCedMeta =
      const VerificationMeta('hardFCed');
  @override
  late final GeneratedColumn<bool> hardFCed =
      GeneratedColumn<bool>('hard_f_ced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("hard_f_ced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _hardAPedMeta =
      const VerificationMeta('hardAPed');
  @override
  late final GeneratedColumn<bool> hardAPed =
      GeneratedColumn<bool>('hard_a_ped', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("hard_a_ped" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        hardHighScore,
        hardBestExScore,
        hardBestPerfect,
        hardBestGreat,
        hardBestGood,
        hardBestBad,
        hardBestMiss,
        hardFCed,
        hardAPed
      ];
  @override
  String get aliasedName => _alias ?? 'pj_hard_scores';
  @override
  String get actualTableName => 'pj_hard_scores';
  @override
  VerificationContext validateIntegrity(Insertable<PjHardScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('hard_high_score')) {
      context.handle(
          _hardHighScoreMeta,
          hardHighScore.isAcceptableOrUnknown(
              data['hard_high_score']!, _hardHighScoreMeta));
    }
    if (data.containsKey('hard_best_ex_score')) {
      context.handle(
          _hardBestExScoreMeta,
          hardBestExScore.isAcceptableOrUnknown(
              data['hard_best_ex_score']!, _hardBestExScoreMeta));
    }
    if (data.containsKey('hard_best_perfect')) {
      context.handle(
          _hardBestPerfectMeta,
          hardBestPerfect.isAcceptableOrUnknown(
              data['hard_best_perfect']!, _hardBestPerfectMeta));
    }
    if (data.containsKey('hard_best_great')) {
      context.handle(
          _hardBestGreatMeta,
          hardBestGreat.isAcceptableOrUnknown(
              data['hard_best_great']!, _hardBestGreatMeta));
    }
    if (data.containsKey('hard_best_good')) {
      context.handle(
          _hardBestGoodMeta,
          hardBestGood.isAcceptableOrUnknown(
              data['hard_best_good']!, _hardBestGoodMeta));
    }
    if (data.containsKey('hard_best_bad')) {
      context.handle(
          _hardBestBadMeta,
          hardBestBad.isAcceptableOrUnknown(
              data['hard_best_bad']!, _hardBestBadMeta));
    }
    if (data.containsKey('hard_best_miss')) {
      context.handle(
          _hardBestMissMeta,
          hardBestMiss.isAcceptableOrUnknown(
              data['hard_best_miss']!, _hardBestMissMeta));
    }
    if (data.containsKey('hard_f_ced')) {
      context.handle(_hardFCedMeta,
          hardFCed.isAcceptableOrUnknown(data['hard_f_ced']!, _hardFCedMeta));
    }
    if (data.containsKey('hard_a_ped')) {
      context.handle(_hardAPedMeta,
          hardAPed.isAcceptableOrUnknown(data['hard_a_ped']!, _hardAPedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PjHardScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjHardScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hardHighScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_high_score'])!,
      hardBestExScore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}hard_best_ex_score'])!,
      hardBestPerfect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_best_perfect'])!,
      hardBestGreat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_best_great'])!,
      hardBestGood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_best_good'])!,
      hardBestBad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_best_bad'])!,
      hardBestMiss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hard_best_miss'])!,
      hardFCed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hard_f_ced'])!,
      hardAPed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hard_a_ped'])!,
    );
  }

  @override
  $PjHardScoresTable createAlias(String alias) {
    return $PjHardScoresTable(attachedDatabase, alias);
  }
}

class PjHardScore extends DataClass implements Insertable<PjHardScore> {
  final int id;
  final int hardHighScore;
  final int hardBestExScore;
  final int hardBestPerfect;
  final int hardBestGreat;
  final int hardBestGood;
  final int hardBestBad;
  final int hardBestMiss;
  final bool hardFCed;
  final bool hardAPed;
  const PjHardScore(
      {required this.id,
      required this.hardHighScore,
      required this.hardBestExScore,
      required this.hardBestPerfect,
      required this.hardBestGreat,
      required this.hardBestGood,
      required this.hardBestBad,
      required this.hardBestMiss,
      required this.hardFCed,
      required this.hardAPed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hard_high_score'] = Variable<int>(hardHighScore);
    map['hard_best_ex_score'] = Variable<int>(hardBestExScore);
    map['hard_best_perfect'] = Variable<int>(hardBestPerfect);
    map['hard_best_great'] = Variable<int>(hardBestGreat);
    map['hard_best_good'] = Variable<int>(hardBestGood);
    map['hard_best_bad'] = Variable<int>(hardBestBad);
    map['hard_best_miss'] = Variable<int>(hardBestMiss);
    map['hard_f_ced'] = Variable<bool>(hardFCed);
    map['hard_a_ped'] = Variable<bool>(hardAPed);
    return map;
  }

  PjHardScoresCompanion toCompanion(bool nullToAbsent) {
    return PjHardScoresCompanion(
      id: Value(id),
      hardHighScore: Value(hardHighScore),
      hardBestExScore: Value(hardBestExScore),
      hardBestPerfect: Value(hardBestPerfect),
      hardBestGreat: Value(hardBestGreat),
      hardBestGood: Value(hardBestGood),
      hardBestBad: Value(hardBestBad),
      hardBestMiss: Value(hardBestMiss),
      hardFCed: Value(hardFCed),
      hardAPed: Value(hardAPed),
    );
  }

  factory PjHardScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjHardScore(
      id: serializer.fromJson<int>(json['id']),
      hardHighScore: serializer.fromJson<int>(json['hardHighScore']),
      hardBestExScore: serializer.fromJson<int>(json['hardBestExScore']),
      hardBestPerfect: serializer.fromJson<int>(json['hardBestPerfect']),
      hardBestGreat: serializer.fromJson<int>(json['hardBestGreat']),
      hardBestGood: serializer.fromJson<int>(json['hardBestGood']),
      hardBestBad: serializer.fromJson<int>(json['hardBestBad']),
      hardBestMiss: serializer.fromJson<int>(json['hardBestMiss']),
      hardFCed: serializer.fromJson<bool>(json['hardFCed']),
      hardAPed: serializer.fromJson<bool>(json['hardAPed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hardHighScore': serializer.toJson<int>(hardHighScore),
      'hardBestExScore': serializer.toJson<int>(hardBestExScore),
      'hardBestPerfect': serializer.toJson<int>(hardBestPerfect),
      'hardBestGreat': serializer.toJson<int>(hardBestGreat),
      'hardBestGood': serializer.toJson<int>(hardBestGood),
      'hardBestBad': serializer.toJson<int>(hardBestBad),
      'hardBestMiss': serializer.toJson<int>(hardBestMiss),
      'hardFCed': serializer.toJson<bool>(hardFCed),
      'hardAPed': serializer.toJson<bool>(hardAPed),
    };
  }

  PjHardScore copyWith(
          {int? id,
          int? hardHighScore,
          int? hardBestExScore,
          int? hardBestPerfect,
          int? hardBestGreat,
          int? hardBestGood,
          int? hardBestBad,
          int? hardBestMiss,
          bool? hardFCed,
          bool? hardAPed}) =>
      PjHardScore(
        id: id ?? this.id,
        hardHighScore: hardHighScore ?? this.hardHighScore,
        hardBestExScore: hardBestExScore ?? this.hardBestExScore,
        hardBestPerfect: hardBestPerfect ?? this.hardBestPerfect,
        hardBestGreat: hardBestGreat ?? this.hardBestGreat,
        hardBestGood: hardBestGood ?? this.hardBestGood,
        hardBestBad: hardBestBad ?? this.hardBestBad,
        hardBestMiss: hardBestMiss ?? this.hardBestMiss,
        hardFCed: hardFCed ?? this.hardFCed,
        hardAPed: hardAPed ?? this.hardAPed,
      );
  @override
  String toString() {
    return (StringBuffer('PjHardScore(')
          ..write('id: $id, ')
          ..write('hardHighScore: $hardHighScore, ')
          ..write('hardBestExScore: $hardBestExScore, ')
          ..write('hardBestPerfect: $hardBestPerfect, ')
          ..write('hardBestGreat: $hardBestGreat, ')
          ..write('hardBestGood: $hardBestGood, ')
          ..write('hardBestBad: $hardBestBad, ')
          ..write('hardBestMiss: $hardBestMiss, ')
          ..write('hardFCed: $hardFCed, ')
          ..write('hardAPed: $hardAPed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      hardHighScore,
      hardBestExScore,
      hardBestPerfect,
      hardBestGreat,
      hardBestGood,
      hardBestBad,
      hardBestMiss,
      hardFCed,
      hardAPed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjHardScore &&
          other.id == this.id &&
          other.hardHighScore == this.hardHighScore &&
          other.hardBestExScore == this.hardBestExScore &&
          other.hardBestPerfect == this.hardBestPerfect &&
          other.hardBestGreat == this.hardBestGreat &&
          other.hardBestGood == this.hardBestGood &&
          other.hardBestBad == this.hardBestBad &&
          other.hardBestMiss == this.hardBestMiss &&
          other.hardFCed == this.hardFCed &&
          other.hardAPed == this.hardAPed);
}

class PjHardScoresCompanion extends UpdateCompanion<PjHardScore> {
  final Value<int> id;
  final Value<int> hardHighScore;
  final Value<int> hardBestExScore;
  final Value<int> hardBestPerfect;
  final Value<int> hardBestGreat;
  final Value<int> hardBestGood;
  final Value<int> hardBestBad;
  final Value<int> hardBestMiss;
  final Value<bool> hardFCed;
  final Value<bool> hardAPed;
  const PjHardScoresCompanion({
    this.id = const Value.absent(),
    this.hardHighScore = const Value.absent(),
    this.hardBestExScore = const Value.absent(),
    this.hardBestPerfect = const Value.absent(),
    this.hardBestGreat = const Value.absent(),
    this.hardBestGood = const Value.absent(),
    this.hardBestBad = const Value.absent(),
    this.hardBestMiss = const Value.absent(),
    this.hardFCed = const Value.absent(),
    this.hardAPed = const Value.absent(),
  });
  PjHardScoresCompanion.insert({
    required int id,
    this.hardHighScore = const Value.absent(),
    this.hardBestExScore = const Value.absent(),
    this.hardBestPerfect = const Value.absent(),
    this.hardBestGreat = const Value.absent(),
    this.hardBestGood = const Value.absent(),
    this.hardBestBad = const Value.absent(),
    this.hardBestMiss = const Value.absent(),
    this.hardFCed = const Value.absent(),
    this.hardAPed = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PjHardScore> custom({
    Expression<int>? id,
    Expression<int>? hardHighScore,
    Expression<int>? hardBestExScore,
    Expression<int>? hardBestPerfect,
    Expression<int>? hardBestGreat,
    Expression<int>? hardBestGood,
    Expression<int>? hardBestBad,
    Expression<int>? hardBestMiss,
    Expression<bool>? hardFCed,
    Expression<bool>? hardAPed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hardHighScore != null) 'hard_high_score': hardHighScore,
      if (hardBestExScore != null) 'hard_best_ex_score': hardBestExScore,
      if (hardBestPerfect != null) 'hard_best_perfect': hardBestPerfect,
      if (hardBestGreat != null) 'hard_best_great': hardBestGreat,
      if (hardBestGood != null) 'hard_best_good': hardBestGood,
      if (hardBestBad != null) 'hard_best_bad': hardBestBad,
      if (hardBestMiss != null) 'hard_best_miss': hardBestMiss,
      if (hardFCed != null) 'hard_f_ced': hardFCed,
      if (hardAPed != null) 'hard_a_ped': hardAPed,
    });
  }

  PjHardScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? hardHighScore,
      Value<int>? hardBestExScore,
      Value<int>? hardBestPerfect,
      Value<int>? hardBestGreat,
      Value<int>? hardBestGood,
      Value<int>? hardBestBad,
      Value<int>? hardBestMiss,
      Value<bool>? hardFCed,
      Value<bool>? hardAPed}) {
    return PjHardScoresCompanion(
      id: id ?? this.id,
      hardHighScore: hardHighScore ?? this.hardHighScore,
      hardBestExScore: hardBestExScore ?? this.hardBestExScore,
      hardBestPerfect: hardBestPerfect ?? this.hardBestPerfect,
      hardBestGreat: hardBestGreat ?? this.hardBestGreat,
      hardBestGood: hardBestGood ?? this.hardBestGood,
      hardBestBad: hardBestBad ?? this.hardBestBad,
      hardBestMiss: hardBestMiss ?? this.hardBestMiss,
      hardFCed: hardFCed ?? this.hardFCed,
      hardAPed: hardAPed ?? this.hardAPed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hardHighScore.present) {
      map['hard_high_score'] = Variable<int>(hardHighScore.value);
    }
    if (hardBestExScore.present) {
      map['hard_best_ex_score'] = Variable<int>(hardBestExScore.value);
    }
    if (hardBestPerfect.present) {
      map['hard_best_perfect'] = Variable<int>(hardBestPerfect.value);
    }
    if (hardBestGreat.present) {
      map['hard_best_great'] = Variable<int>(hardBestGreat.value);
    }
    if (hardBestGood.present) {
      map['hard_best_good'] = Variable<int>(hardBestGood.value);
    }
    if (hardBestBad.present) {
      map['hard_best_bad'] = Variable<int>(hardBestBad.value);
    }
    if (hardBestMiss.present) {
      map['hard_best_miss'] = Variable<int>(hardBestMiss.value);
    }
    if (hardFCed.present) {
      map['hard_f_ced'] = Variable<bool>(hardFCed.value);
    }
    if (hardAPed.present) {
      map['hard_a_ped'] = Variable<bool>(hardAPed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjHardScoresCompanion(')
          ..write('id: $id, ')
          ..write('hardHighScore: $hardHighScore, ')
          ..write('hardBestExScore: $hardBestExScore, ')
          ..write('hardBestPerfect: $hardBestPerfect, ')
          ..write('hardBestGreat: $hardBestGreat, ')
          ..write('hardBestGood: $hardBestGood, ')
          ..write('hardBestBad: $hardBestBad, ')
          ..write('hardBestMiss: $hardBestMiss, ')
          ..write('hardFCed: $hardFCed, ')
          ..write('hardAPed: $hardAPed')
          ..write(')'))
        .toString();
  }
}

class $PjExpertScoresTable extends PjExpertScores
    with TableInfo<$PjExpertScoresTable, PjExpertScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjExpertScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pj_songs (id)'));
  static const VerificationMeta _expertHighScoreMeta =
      const VerificationMeta('expertHighScore');
  @override
  late final GeneratedColumn<int> expertHighScore = GeneratedColumn<int>(
      'expert_high_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestExScoreMeta =
      const VerificationMeta('expertBestExScore');
  @override
  late final GeneratedColumn<int> expertBestExScore = GeneratedColumn<int>(
      'expert_best_ex_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestPerfectMeta =
      const VerificationMeta('expertBestPerfect');
  @override
  late final GeneratedColumn<int> expertBestPerfect = GeneratedColumn<int>(
      'expert_best_perfect', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestGreatMeta =
      const VerificationMeta('expertBestGreat');
  @override
  late final GeneratedColumn<int> expertBestGreat = GeneratedColumn<int>(
      'expert_best_great', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestGoodMeta =
      const VerificationMeta('expertBestGood');
  @override
  late final GeneratedColumn<int> expertBestGood = GeneratedColumn<int>(
      'expert_best_good', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestBadMeta =
      const VerificationMeta('expertBestBad');
  @override
  late final GeneratedColumn<int> expertBestBad = GeneratedColumn<int>(
      'expert_best_bad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertBestMissMeta =
      const VerificationMeta('expertBestMiss');
  @override
  late final GeneratedColumn<int> expertBestMiss = GeneratedColumn<int>(
      'expert_best_miss', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expertFCedMeta =
      const VerificationMeta('expertFCed');
  @override
  late final GeneratedColumn<bool> expertFCed =
      GeneratedColumn<bool>('expert_f_ced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("expert_f_ced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _expertAPedMeta =
      const VerificationMeta('expertAPed');
  @override
  late final GeneratedColumn<bool> expertAPed =
      GeneratedColumn<bool>('expert_a_ped', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("expert_a_ped" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        expertHighScore,
        expertBestExScore,
        expertBestPerfect,
        expertBestGreat,
        expertBestGood,
        expertBestBad,
        expertBestMiss,
        expertFCed,
        expertAPed
      ];
  @override
  String get aliasedName => _alias ?? 'pj_expert_scores';
  @override
  String get actualTableName => 'pj_expert_scores';
  @override
  VerificationContext validateIntegrity(Insertable<PjExpertScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('expert_high_score')) {
      context.handle(
          _expertHighScoreMeta,
          expertHighScore.isAcceptableOrUnknown(
              data['expert_high_score']!, _expertHighScoreMeta));
    }
    if (data.containsKey('expert_best_ex_score')) {
      context.handle(
          _expertBestExScoreMeta,
          expertBestExScore.isAcceptableOrUnknown(
              data['expert_best_ex_score']!, _expertBestExScoreMeta));
    }
    if (data.containsKey('expert_best_perfect')) {
      context.handle(
          _expertBestPerfectMeta,
          expertBestPerfect.isAcceptableOrUnknown(
              data['expert_best_perfect']!, _expertBestPerfectMeta));
    }
    if (data.containsKey('expert_best_great')) {
      context.handle(
          _expertBestGreatMeta,
          expertBestGreat.isAcceptableOrUnknown(
              data['expert_best_great']!, _expertBestGreatMeta));
    }
    if (data.containsKey('expert_best_good')) {
      context.handle(
          _expertBestGoodMeta,
          expertBestGood.isAcceptableOrUnknown(
              data['expert_best_good']!, _expertBestGoodMeta));
    }
    if (data.containsKey('expert_best_bad')) {
      context.handle(
          _expertBestBadMeta,
          expertBestBad.isAcceptableOrUnknown(
              data['expert_best_bad']!, _expertBestBadMeta));
    }
    if (data.containsKey('expert_best_miss')) {
      context.handle(
          _expertBestMissMeta,
          expertBestMiss.isAcceptableOrUnknown(
              data['expert_best_miss']!, _expertBestMissMeta));
    }
    if (data.containsKey('expert_f_ced')) {
      context.handle(
          _expertFCedMeta,
          expertFCed.isAcceptableOrUnknown(
              data['expert_f_ced']!, _expertFCedMeta));
    }
    if (data.containsKey('expert_a_ped')) {
      context.handle(
          _expertAPedMeta,
          expertAPed.isAcceptableOrUnknown(
              data['expert_a_ped']!, _expertAPedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PjExpertScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjExpertScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      expertHighScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_high_score'])!,
      expertBestExScore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}expert_best_ex_score'])!,
      expertBestPerfect: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}expert_best_perfect'])!,
      expertBestGreat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_best_great'])!,
      expertBestGood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_best_good'])!,
      expertBestBad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_best_bad'])!,
      expertBestMiss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expert_best_miss'])!,
      expertFCed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}expert_f_ced'])!,
      expertAPed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}expert_a_ped'])!,
    );
  }

  @override
  $PjExpertScoresTable createAlias(String alias) {
    return $PjExpertScoresTable(attachedDatabase, alias);
  }
}

class PjExpertScore extends DataClass implements Insertable<PjExpertScore> {
  final int id;
  final int expertHighScore;
  final int expertBestExScore;
  final int expertBestPerfect;
  final int expertBestGreat;
  final int expertBestGood;
  final int expertBestBad;
  final int expertBestMiss;
  final bool expertFCed;
  final bool expertAPed;
  const PjExpertScore(
      {required this.id,
      required this.expertHighScore,
      required this.expertBestExScore,
      required this.expertBestPerfect,
      required this.expertBestGreat,
      required this.expertBestGood,
      required this.expertBestBad,
      required this.expertBestMiss,
      required this.expertFCed,
      required this.expertAPed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['expert_high_score'] = Variable<int>(expertHighScore);
    map['expert_best_ex_score'] = Variable<int>(expertBestExScore);
    map['expert_best_perfect'] = Variable<int>(expertBestPerfect);
    map['expert_best_great'] = Variable<int>(expertBestGreat);
    map['expert_best_good'] = Variable<int>(expertBestGood);
    map['expert_best_bad'] = Variable<int>(expertBestBad);
    map['expert_best_miss'] = Variable<int>(expertBestMiss);
    map['expert_f_ced'] = Variable<bool>(expertFCed);
    map['expert_a_ped'] = Variable<bool>(expertAPed);
    return map;
  }

  PjExpertScoresCompanion toCompanion(bool nullToAbsent) {
    return PjExpertScoresCompanion(
      id: Value(id),
      expertHighScore: Value(expertHighScore),
      expertBestExScore: Value(expertBestExScore),
      expertBestPerfect: Value(expertBestPerfect),
      expertBestGreat: Value(expertBestGreat),
      expertBestGood: Value(expertBestGood),
      expertBestBad: Value(expertBestBad),
      expertBestMiss: Value(expertBestMiss),
      expertFCed: Value(expertFCed),
      expertAPed: Value(expertAPed),
    );
  }

  factory PjExpertScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjExpertScore(
      id: serializer.fromJson<int>(json['id']),
      expertHighScore: serializer.fromJson<int>(json['expertHighScore']),
      expertBestExScore: serializer.fromJson<int>(json['expertBestExScore']),
      expertBestPerfect: serializer.fromJson<int>(json['expertBestPerfect']),
      expertBestGreat: serializer.fromJson<int>(json['expertBestGreat']),
      expertBestGood: serializer.fromJson<int>(json['expertBestGood']),
      expertBestBad: serializer.fromJson<int>(json['expertBestBad']),
      expertBestMiss: serializer.fromJson<int>(json['expertBestMiss']),
      expertFCed: serializer.fromJson<bool>(json['expertFCed']),
      expertAPed: serializer.fromJson<bool>(json['expertAPed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'expertHighScore': serializer.toJson<int>(expertHighScore),
      'expertBestExScore': serializer.toJson<int>(expertBestExScore),
      'expertBestPerfect': serializer.toJson<int>(expertBestPerfect),
      'expertBestGreat': serializer.toJson<int>(expertBestGreat),
      'expertBestGood': serializer.toJson<int>(expertBestGood),
      'expertBestBad': serializer.toJson<int>(expertBestBad),
      'expertBestMiss': serializer.toJson<int>(expertBestMiss),
      'expertFCed': serializer.toJson<bool>(expertFCed),
      'expertAPed': serializer.toJson<bool>(expertAPed),
    };
  }

  PjExpertScore copyWith(
          {int? id,
          int? expertHighScore,
          int? expertBestExScore,
          int? expertBestPerfect,
          int? expertBestGreat,
          int? expertBestGood,
          int? expertBestBad,
          int? expertBestMiss,
          bool? expertFCed,
          bool? expertAPed}) =>
      PjExpertScore(
        id: id ?? this.id,
        expertHighScore: expertHighScore ?? this.expertHighScore,
        expertBestExScore: expertBestExScore ?? this.expertBestExScore,
        expertBestPerfect: expertBestPerfect ?? this.expertBestPerfect,
        expertBestGreat: expertBestGreat ?? this.expertBestGreat,
        expertBestGood: expertBestGood ?? this.expertBestGood,
        expertBestBad: expertBestBad ?? this.expertBestBad,
        expertBestMiss: expertBestMiss ?? this.expertBestMiss,
        expertFCed: expertFCed ?? this.expertFCed,
        expertAPed: expertAPed ?? this.expertAPed,
      );
  @override
  String toString() {
    return (StringBuffer('PjExpertScore(')
          ..write('id: $id, ')
          ..write('expertHighScore: $expertHighScore, ')
          ..write('expertBestExScore: $expertBestExScore, ')
          ..write('expertBestPerfect: $expertBestPerfect, ')
          ..write('expertBestGreat: $expertBestGreat, ')
          ..write('expertBestGood: $expertBestGood, ')
          ..write('expertBestBad: $expertBestBad, ')
          ..write('expertBestMiss: $expertBestMiss, ')
          ..write('expertFCed: $expertFCed, ')
          ..write('expertAPed: $expertAPed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      expertHighScore,
      expertBestExScore,
      expertBestPerfect,
      expertBestGreat,
      expertBestGood,
      expertBestBad,
      expertBestMiss,
      expertFCed,
      expertAPed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjExpertScore &&
          other.id == this.id &&
          other.expertHighScore == this.expertHighScore &&
          other.expertBestExScore == this.expertBestExScore &&
          other.expertBestPerfect == this.expertBestPerfect &&
          other.expertBestGreat == this.expertBestGreat &&
          other.expertBestGood == this.expertBestGood &&
          other.expertBestBad == this.expertBestBad &&
          other.expertBestMiss == this.expertBestMiss &&
          other.expertFCed == this.expertFCed &&
          other.expertAPed == this.expertAPed);
}

class PjExpertScoresCompanion extends UpdateCompanion<PjExpertScore> {
  final Value<int> id;
  final Value<int> expertHighScore;
  final Value<int> expertBestExScore;
  final Value<int> expertBestPerfect;
  final Value<int> expertBestGreat;
  final Value<int> expertBestGood;
  final Value<int> expertBestBad;
  final Value<int> expertBestMiss;
  final Value<bool> expertFCed;
  final Value<bool> expertAPed;
  const PjExpertScoresCompanion({
    this.id = const Value.absent(),
    this.expertHighScore = const Value.absent(),
    this.expertBestExScore = const Value.absent(),
    this.expertBestPerfect = const Value.absent(),
    this.expertBestGreat = const Value.absent(),
    this.expertBestGood = const Value.absent(),
    this.expertBestBad = const Value.absent(),
    this.expertBestMiss = const Value.absent(),
    this.expertFCed = const Value.absent(),
    this.expertAPed = const Value.absent(),
  });
  PjExpertScoresCompanion.insert({
    required int id,
    this.expertHighScore = const Value.absent(),
    this.expertBestExScore = const Value.absent(),
    this.expertBestPerfect = const Value.absent(),
    this.expertBestGreat = const Value.absent(),
    this.expertBestGood = const Value.absent(),
    this.expertBestBad = const Value.absent(),
    this.expertBestMiss = const Value.absent(),
    this.expertFCed = const Value.absent(),
    this.expertAPed = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PjExpertScore> custom({
    Expression<int>? id,
    Expression<int>? expertHighScore,
    Expression<int>? expertBestExScore,
    Expression<int>? expertBestPerfect,
    Expression<int>? expertBestGreat,
    Expression<int>? expertBestGood,
    Expression<int>? expertBestBad,
    Expression<int>? expertBestMiss,
    Expression<bool>? expertFCed,
    Expression<bool>? expertAPed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expertHighScore != null) 'expert_high_score': expertHighScore,
      if (expertBestExScore != null) 'expert_best_ex_score': expertBestExScore,
      if (expertBestPerfect != null) 'expert_best_perfect': expertBestPerfect,
      if (expertBestGreat != null) 'expert_best_great': expertBestGreat,
      if (expertBestGood != null) 'expert_best_good': expertBestGood,
      if (expertBestBad != null) 'expert_best_bad': expertBestBad,
      if (expertBestMiss != null) 'expert_best_miss': expertBestMiss,
      if (expertFCed != null) 'expert_f_ced': expertFCed,
      if (expertAPed != null) 'expert_a_ped': expertAPed,
    });
  }

  PjExpertScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? expertHighScore,
      Value<int>? expertBestExScore,
      Value<int>? expertBestPerfect,
      Value<int>? expertBestGreat,
      Value<int>? expertBestGood,
      Value<int>? expertBestBad,
      Value<int>? expertBestMiss,
      Value<bool>? expertFCed,
      Value<bool>? expertAPed}) {
    return PjExpertScoresCompanion(
      id: id ?? this.id,
      expertHighScore: expertHighScore ?? this.expertHighScore,
      expertBestExScore: expertBestExScore ?? this.expertBestExScore,
      expertBestPerfect: expertBestPerfect ?? this.expertBestPerfect,
      expertBestGreat: expertBestGreat ?? this.expertBestGreat,
      expertBestGood: expertBestGood ?? this.expertBestGood,
      expertBestBad: expertBestBad ?? this.expertBestBad,
      expertBestMiss: expertBestMiss ?? this.expertBestMiss,
      expertFCed: expertFCed ?? this.expertFCed,
      expertAPed: expertAPed ?? this.expertAPed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (expertHighScore.present) {
      map['expert_high_score'] = Variable<int>(expertHighScore.value);
    }
    if (expertBestExScore.present) {
      map['expert_best_ex_score'] = Variable<int>(expertBestExScore.value);
    }
    if (expertBestPerfect.present) {
      map['expert_best_perfect'] = Variable<int>(expertBestPerfect.value);
    }
    if (expertBestGreat.present) {
      map['expert_best_great'] = Variable<int>(expertBestGreat.value);
    }
    if (expertBestGood.present) {
      map['expert_best_good'] = Variable<int>(expertBestGood.value);
    }
    if (expertBestBad.present) {
      map['expert_best_bad'] = Variable<int>(expertBestBad.value);
    }
    if (expertBestMiss.present) {
      map['expert_best_miss'] = Variable<int>(expertBestMiss.value);
    }
    if (expertFCed.present) {
      map['expert_f_ced'] = Variable<bool>(expertFCed.value);
    }
    if (expertAPed.present) {
      map['expert_a_ped'] = Variable<bool>(expertAPed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjExpertScoresCompanion(')
          ..write('id: $id, ')
          ..write('expertHighScore: $expertHighScore, ')
          ..write('expertBestExScore: $expertBestExScore, ')
          ..write('expertBestPerfect: $expertBestPerfect, ')
          ..write('expertBestGreat: $expertBestGreat, ')
          ..write('expertBestGood: $expertBestGood, ')
          ..write('expertBestBad: $expertBestBad, ')
          ..write('expertBestMiss: $expertBestMiss, ')
          ..write('expertFCed: $expertFCed, ')
          ..write('expertAPed: $expertAPed')
          ..write(')'))
        .toString();
  }
}

class $PjMasterScoresTable extends PjMasterScores
    with TableInfo<$PjMasterScoresTable, PjMasterScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PjMasterScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pj_songs (id)'));
  static const VerificationMeta _masterHighScoreMeta =
      const VerificationMeta('masterHighScore');
  @override
  late final GeneratedColumn<int> masterHighScore = GeneratedColumn<int>(
      'master_high_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestExScoreMeta =
      const VerificationMeta('masterBestExScore');
  @override
  late final GeneratedColumn<int> masterBestExScore = GeneratedColumn<int>(
      'master_best_ex_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestPerfectMeta =
      const VerificationMeta('masterBestPerfect');
  @override
  late final GeneratedColumn<int> masterBestPerfect = GeneratedColumn<int>(
      'master_best_perfect', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestGreatMeta =
      const VerificationMeta('masterBestGreat');
  @override
  late final GeneratedColumn<int> masterBestGreat = GeneratedColumn<int>(
      'master_best_great', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestGoodMeta =
      const VerificationMeta('masterBestGood');
  @override
  late final GeneratedColumn<int> masterBestGood = GeneratedColumn<int>(
      'master_best_good', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestBadMeta =
      const VerificationMeta('masterBestBad');
  @override
  late final GeneratedColumn<int> masterBestBad = GeneratedColumn<int>(
      'master_best_bad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterBestMissMeta =
      const VerificationMeta('masterBestMiss');
  @override
  late final GeneratedColumn<int> masterBestMiss = GeneratedColumn<int>(
      'master_best_miss', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _masterFCedMeta =
      const VerificationMeta('masterFCed');
  @override
  late final GeneratedColumn<bool> masterFCed =
      GeneratedColumn<bool>('master_f_ced', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("master_f_ced" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _masterAPedMeta =
      const VerificationMeta('masterAPed');
  @override
  late final GeneratedColumn<bool> masterAPed =
      GeneratedColumn<bool>('master_a_ped', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("master_a_ped" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        masterHighScore,
        masterBestExScore,
        masterBestPerfect,
        masterBestGreat,
        masterBestGood,
        masterBestBad,
        masterBestMiss,
        masterFCed,
        masterAPed
      ];
  @override
  String get aliasedName => _alias ?? 'pj_master_scores';
  @override
  String get actualTableName => 'pj_master_scores';
  @override
  VerificationContext validateIntegrity(Insertable<PjMasterScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('master_high_score')) {
      context.handle(
          _masterHighScoreMeta,
          masterHighScore.isAcceptableOrUnknown(
              data['master_high_score']!, _masterHighScoreMeta));
    }
    if (data.containsKey('master_best_ex_score')) {
      context.handle(
          _masterBestExScoreMeta,
          masterBestExScore.isAcceptableOrUnknown(
              data['master_best_ex_score']!, _masterBestExScoreMeta));
    }
    if (data.containsKey('master_best_perfect')) {
      context.handle(
          _masterBestPerfectMeta,
          masterBestPerfect.isAcceptableOrUnknown(
              data['master_best_perfect']!, _masterBestPerfectMeta));
    }
    if (data.containsKey('master_best_great')) {
      context.handle(
          _masterBestGreatMeta,
          masterBestGreat.isAcceptableOrUnknown(
              data['master_best_great']!, _masterBestGreatMeta));
    }
    if (data.containsKey('master_best_good')) {
      context.handle(
          _masterBestGoodMeta,
          masterBestGood.isAcceptableOrUnknown(
              data['master_best_good']!, _masterBestGoodMeta));
    }
    if (data.containsKey('master_best_bad')) {
      context.handle(
          _masterBestBadMeta,
          masterBestBad.isAcceptableOrUnknown(
              data['master_best_bad']!, _masterBestBadMeta));
    }
    if (data.containsKey('master_best_miss')) {
      context.handle(
          _masterBestMissMeta,
          masterBestMiss.isAcceptableOrUnknown(
              data['master_best_miss']!, _masterBestMissMeta));
    }
    if (data.containsKey('master_f_ced')) {
      context.handle(
          _masterFCedMeta,
          masterFCed.isAcceptableOrUnknown(
              data['master_f_ced']!, _masterFCedMeta));
    }
    if (data.containsKey('master_a_ped')) {
      context.handle(
          _masterAPedMeta,
          masterAPed.isAcceptableOrUnknown(
              data['master_a_ped']!, _masterAPedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PjMasterScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PjMasterScore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      masterHighScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_high_score'])!,
      masterBestExScore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}master_best_ex_score'])!,
      masterBestPerfect: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}master_best_perfect'])!,
      masterBestGreat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_best_great'])!,
      masterBestGood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_best_good'])!,
      masterBestBad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_best_bad'])!,
      masterBestMiss: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}master_best_miss'])!,
      masterFCed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}master_f_ced'])!,
      masterAPed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}master_a_ped'])!,
    );
  }

  @override
  $PjMasterScoresTable createAlias(String alias) {
    return $PjMasterScoresTable(attachedDatabase, alias);
  }
}

class PjMasterScore extends DataClass implements Insertable<PjMasterScore> {
  final int id;
  final int masterHighScore;
  final int masterBestExScore;
  final int masterBestPerfect;
  final int masterBestGreat;
  final int masterBestGood;
  final int masterBestBad;
  final int masterBestMiss;
  final bool masterFCed;
  final bool masterAPed;
  const PjMasterScore(
      {required this.id,
      required this.masterHighScore,
      required this.masterBestExScore,
      required this.masterBestPerfect,
      required this.masterBestGreat,
      required this.masterBestGood,
      required this.masterBestBad,
      required this.masterBestMiss,
      required this.masterFCed,
      required this.masterAPed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['master_high_score'] = Variable<int>(masterHighScore);
    map['master_best_ex_score'] = Variable<int>(masterBestExScore);
    map['master_best_perfect'] = Variable<int>(masterBestPerfect);
    map['master_best_great'] = Variable<int>(masterBestGreat);
    map['master_best_good'] = Variable<int>(masterBestGood);
    map['master_best_bad'] = Variable<int>(masterBestBad);
    map['master_best_miss'] = Variable<int>(masterBestMiss);
    map['master_f_ced'] = Variable<bool>(masterFCed);
    map['master_a_ped'] = Variable<bool>(masterAPed);
    return map;
  }

  PjMasterScoresCompanion toCompanion(bool nullToAbsent) {
    return PjMasterScoresCompanion(
      id: Value(id),
      masterHighScore: Value(masterHighScore),
      masterBestExScore: Value(masterBestExScore),
      masterBestPerfect: Value(masterBestPerfect),
      masterBestGreat: Value(masterBestGreat),
      masterBestGood: Value(masterBestGood),
      masterBestBad: Value(masterBestBad),
      masterBestMiss: Value(masterBestMiss),
      masterFCed: Value(masterFCed),
      masterAPed: Value(masterAPed),
    );
  }

  factory PjMasterScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PjMasterScore(
      id: serializer.fromJson<int>(json['id']),
      masterHighScore: serializer.fromJson<int>(json['masterHighScore']),
      masterBestExScore: serializer.fromJson<int>(json['masterBestExScore']),
      masterBestPerfect: serializer.fromJson<int>(json['masterBestPerfect']),
      masterBestGreat: serializer.fromJson<int>(json['masterBestGreat']),
      masterBestGood: serializer.fromJson<int>(json['masterBestGood']),
      masterBestBad: serializer.fromJson<int>(json['masterBestBad']),
      masterBestMiss: serializer.fromJson<int>(json['masterBestMiss']),
      masterFCed: serializer.fromJson<bool>(json['masterFCed']),
      masterAPed: serializer.fromJson<bool>(json['masterAPed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'masterHighScore': serializer.toJson<int>(masterHighScore),
      'masterBestExScore': serializer.toJson<int>(masterBestExScore),
      'masterBestPerfect': serializer.toJson<int>(masterBestPerfect),
      'masterBestGreat': serializer.toJson<int>(masterBestGreat),
      'masterBestGood': serializer.toJson<int>(masterBestGood),
      'masterBestBad': serializer.toJson<int>(masterBestBad),
      'masterBestMiss': serializer.toJson<int>(masterBestMiss),
      'masterFCed': serializer.toJson<bool>(masterFCed),
      'masterAPed': serializer.toJson<bool>(masterAPed),
    };
  }

  PjMasterScore copyWith(
          {int? id,
          int? masterHighScore,
          int? masterBestExScore,
          int? masterBestPerfect,
          int? masterBestGreat,
          int? masterBestGood,
          int? masterBestBad,
          int? masterBestMiss,
          bool? masterFCed,
          bool? masterAPed}) =>
      PjMasterScore(
        id: id ?? this.id,
        masterHighScore: masterHighScore ?? this.masterHighScore,
        masterBestExScore: masterBestExScore ?? this.masterBestExScore,
        masterBestPerfect: masterBestPerfect ?? this.masterBestPerfect,
        masterBestGreat: masterBestGreat ?? this.masterBestGreat,
        masterBestGood: masterBestGood ?? this.masterBestGood,
        masterBestBad: masterBestBad ?? this.masterBestBad,
        masterBestMiss: masterBestMiss ?? this.masterBestMiss,
        masterFCed: masterFCed ?? this.masterFCed,
        masterAPed: masterAPed ?? this.masterAPed,
      );
  @override
  String toString() {
    return (StringBuffer('PjMasterScore(')
          ..write('id: $id, ')
          ..write('masterHighScore: $masterHighScore, ')
          ..write('masterBestExScore: $masterBestExScore, ')
          ..write('masterBestPerfect: $masterBestPerfect, ')
          ..write('masterBestGreat: $masterBestGreat, ')
          ..write('masterBestGood: $masterBestGood, ')
          ..write('masterBestBad: $masterBestBad, ')
          ..write('masterBestMiss: $masterBestMiss, ')
          ..write('masterFCed: $masterFCed, ')
          ..write('masterAPed: $masterAPed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      masterHighScore,
      masterBestExScore,
      masterBestPerfect,
      masterBestGreat,
      masterBestGood,
      masterBestBad,
      masterBestMiss,
      masterFCed,
      masterAPed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PjMasterScore &&
          other.id == this.id &&
          other.masterHighScore == this.masterHighScore &&
          other.masterBestExScore == this.masterBestExScore &&
          other.masterBestPerfect == this.masterBestPerfect &&
          other.masterBestGreat == this.masterBestGreat &&
          other.masterBestGood == this.masterBestGood &&
          other.masterBestBad == this.masterBestBad &&
          other.masterBestMiss == this.masterBestMiss &&
          other.masterFCed == this.masterFCed &&
          other.masterAPed == this.masterAPed);
}

class PjMasterScoresCompanion extends UpdateCompanion<PjMasterScore> {
  final Value<int> id;
  final Value<int> masterHighScore;
  final Value<int> masterBestExScore;
  final Value<int> masterBestPerfect;
  final Value<int> masterBestGreat;
  final Value<int> masterBestGood;
  final Value<int> masterBestBad;
  final Value<int> masterBestMiss;
  final Value<bool> masterFCed;
  final Value<bool> masterAPed;
  const PjMasterScoresCompanion({
    this.id = const Value.absent(),
    this.masterHighScore = const Value.absent(),
    this.masterBestExScore = const Value.absent(),
    this.masterBestPerfect = const Value.absent(),
    this.masterBestGreat = const Value.absent(),
    this.masterBestGood = const Value.absent(),
    this.masterBestBad = const Value.absent(),
    this.masterBestMiss = const Value.absent(),
    this.masterFCed = const Value.absent(),
    this.masterAPed = const Value.absent(),
  });
  PjMasterScoresCompanion.insert({
    required int id,
    this.masterHighScore = const Value.absent(),
    this.masterBestExScore = const Value.absent(),
    this.masterBestPerfect = const Value.absent(),
    this.masterBestGreat = const Value.absent(),
    this.masterBestGood = const Value.absent(),
    this.masterBestBad = const Value.absent(),
    this.masterBestMiss = const Value.absent(),
    this.masterFCed = const Value.absent(),
    this.masterAPed = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PjMasterScore> custom({
    Expression<int>? id,
    Expression<int>? masterHighScore,
    Expression<int>? masterBestExScore,
    Expression<int>? masterBestPerfect,
    Expression<int>? masterBestGreat,
    Expression<int>? masterBestGood,
    Expression<int>? masterBestBad,
    Expression<int>? masterBestMiss,
    Expression<bool>? masterFCed,
    Expression<bool>? masterAPed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (masterHighScore != null) 'master_high_score': masterHighScore,
      if (masterBestExScore != null) 'master_best_ex_score': masterBestExScore,
      if (masterBestPerfect != null) 'master_best_perfect': masterBestPerfect,
      if (masterBestGreat != null) 'master_best_great': masterBestGreat,
      if (masterBestGood != null) 'master_best_good': masterBestGood,
      if (masterBestBad != null) 'master_best_bad': masterBestBad,
      if (masterBestMiss != null) 'master_best_miss': masterBestMiss,
      if (masterFCed != null) 'master_f_ced': masterFCed,
      if (masterAPed != null) 'master_a_ped': masterAPed,
    });
  }

  PjMasterScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? masterHighScore,
      Value<int>? masterBestExScore,
      Value<int>? masterBestPerfect,
      Value<int>? masterBestGreat,
      Value<int>? masterBestGood,
      Value<int>? masterBestBad,
      Value<int>? masterBestMiss,
      Value<bool>? masterFCed,
      Value<bool>? masterAPed}) {
    return PjMasterScoresCompanion(
      id: id ?? this.id,
      masterHighScore: masterHighScore ?? this.masterHighScore,
      masterBestExScore: masterBestExScore ?? this.masterBestExScore,
      masterBestPerfect: masterBestPerfect ?? this.masterBestPerfect,
      masterBestGreat: masterBestGreat ?? this.masterBestGreat,
      masterBestGood: masterBestGood ?? this.masterBestGood,
      masterBestBad: masterBestBad ?? this.masterBestBad,
      masterBestMiss: masterBestMiss ?? this.masterBestMiss,
      masterFCed: masterFCed ?? this.masterFCed,
      masterAPed: masterAPed ?? this.masterAPed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (masterHighScore.present) {
      map['master_high_score'] = Variable<int>(masterHighScore.value);
    }
    if (masterBestExScore.present) {
      map['master_best_ex_score'] = Variable<int>(masterBestExScore.value);
    }
    if (masterBestPerfect.present) {
      map['master_best_perfect'] = Variable<int>(masterBestPerfect.value);
    }
    if (masterBestGreat.present) {
      map['master_best_great'] = Variable<int>(masterBestGreat.value);
    }
    if (masterBestGood.present) {
      map['master_best_good'] = Variable<int>(masterBestGood.value);
    }
    if (masterBestBad.present) {
      map['master_best_bad'] = Variable<int>(masterBestBad.value);
    }
    if (masterBestMiss.present) {
      map['master_best_miss'] = Variable<int>(masterBestMiss.value);
    }
    if (masterFCed.present) {
      map['master_f_ced'] = Variable<bool>(masterFCed.value);
    }
    if (masterAPed.present) {
      map['master_a_ped'] = Variable<bool>(masterAPed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PjMasterScoresCompanion(')
          ..write('id: $id, ')
          ..write('masterHighScore: $masterHighScore, ')
          ..write('masterBestExScore: $masterBestExScore, ')
          ..write('masterBestPerfect: $masterBestPerfect, ')
          ..write('masterBestGreat: $masterBestGreat, ')
          ..write('masterBestGood: $masterBestGood, ')
          ..write('masterBestBad: $masterBestBad, ')
          ..write('masterBestMiss: $masterBestMiss, ')
          ..write('masterFCed: $masterFCed, ')
          ..write('masterAPed: $masterAPed')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PjSongsTable pjSongs = $PjSongsTable(this);
  late final $PjEasyScoresTable pjEasyScores = $PjEasyScoresTable(this);
  late final $PjNormalScoresTable pjNormalScores = $PjNormalScoresTable(this);
  late final $PjHardScoresTable pjHardScores = $PjHardScoresTable(this);
  late final $PjExpertScoresTable pjExpertScores = $PjExpertScoresTable(this);
  late final $PjMasterScoresTable pjMasterScores = $PjMasterScoresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        pjSongs,
        pjEasyScores,
        pjNormalScores,
        pjHardScores,
        pjExpertScores,
        pjMasterScores
      ];
}
