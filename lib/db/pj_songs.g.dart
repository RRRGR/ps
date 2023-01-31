// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pj_songs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension Getpj_songCollection on Isar {
  IsarCollection<pj_song> get pj_songs => this.collection();
}

const Pj_songSchema = CollectionSchema(
  name: r'pj_song',
  id: -2534563017240711821,
  properties: {
    r'easy': PropertySchema(
      id: 0,
      name: r'easy',
      type: IsarType.object,
      target: r'pj_diff_and_score',
    ),
    r'expert': PropertySchema(
      id: 1,
      name: r'expert',
      type: IsarType.object,
      target: r'pj_diff_and_score',
    ),
    r'hard': PropertySchema(
      id: 2,
      name: r'hard',
      type: IsarType.object,
      target: r'pj_diff_and_score',
    ),
    r'master': PropertySchema(
      id: 3,
      name: r'master',
      type: IsarType.object,
      target: r'pj_diff_and_score',
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'normal': PropertySchema(
      id: 5,
      name: r'normal',
      type: IsarType.object,
      target: r'pj_diff_and_score',
    )
  },
  estimateSize: _pj_songEstimateSize,
  serialize: _pj_songSerialize,
  deserialize: _pj_songDeserialize,
  deserializeProp: _pj_songDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'pj_diff_and_score': Pj_diff_and_scoreSchema},
  getId: _pj_songGetId,
  getLinks: _pj_songGetLinks,
  attach: _pj_songAttach,
  version: '3.0.5',
);

int _pj_songEstimateSize(
  pj_song object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      Pj_diff_and_scoreSchema.estimateSize(
          object.easy, allOffsets[pj_diff_and_score]!, allOffsets);
  bytesCount += 3 +
      Pj_diff_and_scoreSchema.estimateSize(
          object.expert, allOffsets[pj_diff_and_score]!, allOffsets);
  bytesCount += 3 +
      Pj_diff_and_scoreSchema.estimateSize(
          object.hard, allOffsets[pj_diff_and_score]!, allOffsets);
  bytesCount += 3 +
      Pj_diff_and_scoreSchema.estimateSize(
          object.master, allOffsets[pj_diff_and_score]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      Pj_diff_and_scoreSchema.estimateSize(
          object.normal, allOffsets[pj_diff_and_score]!, allOffsets);
  return bytesCount;
}

void _pj_songSerialize(
  pj_song object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<pj_diff_and_score>(
    offsets[0],
    allOffsets,
    Pj_diff_and_scoreSchema.serialize,
    object.easy,
  );
  writer.writeObject<pj_diff_and_score>(
    offsets[1],
    allOffsets,
    Pj_diff_and_scoreSchema.serialize,
    object.expert,
  );
  writer.writeObject<pj_diff_and_score>(
    offsets[2],
    allOffsets,
    Pj_diff_and_scoreSchema.serialize,
    object.hard,
  );
  writer.writeObject<pj_diff_and_score>(
    offsets[3],
    allOffsets,
    Pj_diff_and_scoreSchema.serialize,
    object.master,
  );
  writer.writeString(offsets[4], object.name);
  writer.writeObject<pj_diff_and_score>(
    offsets[5],
    allOffsets,
    Pj_diff_and_scoreSchema.serialize,
    object.normal,
  );
}

pj_song _pj_songDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = pj_song();
  object.easy = reader.readObjectOrNull<pj_diff_and_score>(
        offsets[0],
        Pj_diff_and_scoreSchema.deserialize,
        allOffsets,
      ) ??
      pj_diff_and_score();
  object.expert = reader.readObjectOrNull<pj_diff_and_score>(
        offsets[1],
        Pj_diff_and_scoreSchema.deserialize,
        allOffsets,
      ) ??
      pj_diff_and_score();
  object.hard = reader.readObjectOrNull<pj_diff_and_score>(
        offsets[2],
        Pj_diff_and_scoreSchema.deserialize,
        allOffsets,
      ) ??
      pj_diff_and_score();
  object.id = id;
  object.master = reader.readObjectOrNull<pj_diff_and_score>(
        offsets[3],
        Pj_diff_and_scoreSchema.deserialize,
        allOffsets,
      ) ??
      pj_diff_and_score();
  object.name = reader.readString(offsets[4]);
  object.normal = reader.readObjectOrNull<pj_diff_and_score>(
        offsets[5],
        Pj_diff_and_scoreSchema.deserialize,
        allOffsets,
      ) ??
      pj_diff_and_score();
  return object;
}

P _pj_songDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<pj_diff_and_score>(
            offset,
            Pj_diff_and_scoreSchema.deserialize,
            allOffsets,
          ) ??
          pj_diff_and_score()) as P;
    case 1:
      return (reader.readObjectOrNull<pj_diff_and_score>(
            offset,
            Pj_diff_and_scoreSchema.deserialize,
            allOffsets,
          ) ??
          pj_diff_and_score()) as P;
    case 2:
      return (reader.readObjectOrNull<pj_diff_and_score>(
            offset,
            Pj_diff_and_scoreSchema.deserialize,
            allOffsets,
          ) ??
          pj_diff_and_score()) as P;
    case 3:
      return (reader.readObjectOrNull<pj_diff_and_score>(
            offset,
            Pj_diff_and_scoreSchema.deserialize,
            allOffsets,
          ) ??
          pj_diff_and_score()) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<pj_diff_and_score>(
            offset,
            Pj_diff_and_scoreSchema.deserialize,
            allOffsets,
          ) ??
          pj_diff_and_score()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pj_songGetId(pj_song object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pj_songGetLinks(pj_song object) {
  return [];
}

void _pj_songAttach(IsarCollection<dynamic> col, Id id, pj_song object) {
  object.id = id;
}

extension pj_songQueryWhereSort on QueryBuilder<pj_song, pj_song, QWhere> {
  QueryBuilder<pj_song, pj_song, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension pj_songQueryWhere on QueryBuilder<pj_song, pj_song, QWhereClause> {
  QueryBuilder<pj_song, pj_song, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension pj_songQueryFilter
    on QueryBuilder<pj_song, pj_song, QFilterCondition> {
  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension pj_songQueryObject
    on QueryBuilder<pj_song, pj_song, QFilterCondition> {
  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> easy(
      FilterQuery<pj_diff_and_score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'easy');
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> expert(
      FilterQuery<pj_diff_and_score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'expert');
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> hard(
      FilterQuery<pj_diff_and_score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'hard');
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> master(
      FilterQuery<pj_diff_and_score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'master');
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterFilterCondition> normal(
      FilterQuery<pj_diff_and_score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'normal');
    });
  }
}

extension pj_songQueryLinks
    on QueryBuilder<pj_song, pj_song, QFilterCondition> {}

extension pj_songQuerySortBy on QueryBuilder<pj_song, pj_song, QSortBy> {
  QueryBuilder<pj_song, pj_song, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension pj_songQuerySortThenBy
    on QueryBuilder<pj_song, pj_song, QSortThenBy> {
  QueryBuilder<pj_song, pj_song, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<pj_song, pj_song, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension pj_songQueryWhereDistinct
    on QueryBuilder<pj_song, pj_song, QDistinct> {
  QueryBuilder<pj_song, pj_song, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension pj_songQueryProperty
    on QueryBuilder<pj_song, pj_song, QQueryProperty> {
  QueryBuilder<pj_song, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<pj_song, pj_diff_and_score, QQueryOperations> easyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easy');
    });
  }

  QueryBuilder<pj_song, pj_diff_and_score, QQueryOperations> expertProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expert');
    });
  }

  QueryBuilder<pj_song, pj_diff_and_score, QQueryOperations> hardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hard');
    });
  }

  QueryBuilder<pj_song, pj_diff_and_score, QQueryOperations> masterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'master');
    });
  }

  QueryBuilder<pj_song, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<pj_song, pj_diff_and_score, QQueryOperations> normalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'normal');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const Pj_diff_and_scoreSchema = Schema(
  name: r'pj_diff_and_score',
  id: 6128155553502342656,
  properties: {
    r'APed': PropertySchema(
      id: 0,
      name: r'APed',
      type: IsarType.bool,
    ),
    r'FCed': PropertySchema(
      id: 1,
      name: r'FCed',
      type: IsarType.bool,
    ),
    r'bestBad': PropertySchema(
      id: 2,
      name: r'bestBad',
      type: IsarType.long,
    ),
    r'bestGood': PropertySchema(
      id: 3,
      name: r'bestGood',
      type: IsarType.long,
    ),
    r'bestGreat': PropertySchema(
      id: 4,
      name: r'bestGreat',
      type: IsarType.long,
    ),
    r'bestMiss': PropertySchema(
      id: 5,
      name: r'bestMiss',
      type: IsarType.long,
    ),
    r'bestPerfect': PropertySchema(
      id: 6,
      name: r'bestPerfect',
      type: IsarType.long,
    ),
    r'diff': PropertySchema(
      id: 7,
      name: r'diff',
      type: IsarType.long,
    ),
    r'highScore': PropertySchema(
      id: 8,
      name: r'highScore',
      type: IsarType.long,
    )
  },
  estimateSize: _pj_diff_and_scoreEstimateSize,
  serialize: _pj_diff_and_scoreSerialize,
  deserialize: _pj_diff_and_scoreDeserialize,
  deserializeProp: _pj_diff_and_scoreDeserializeProp,
);

int _pj_diff_and_scoreEstimateSize(
  pj_diff_and_score object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pj_diff_and_scoreSerialize(
  pj_diff_and_score object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.APed);
  writer.writeBool(offsets[1], object.FCed);
  writer.writeLong(offsets[2], object.bestBad);
  writer.writeLong(offsets[3], object.bestGood);
  writer.writeLong(offsets[4], object.bestGreat);
  writer.writeLong(offsets[5], object.bestMiss);
  writer.writeLong(offsets[6], object.bestPerfect);
  writer.writeLong(offsets[7], object.diff);
  writer.writeLong(offsets[8], object.highScore);
}

pj_diff_and_score _pj_diff_and_scoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = pj_diff_and_score();
  object.APed = reader.readBoolOrNull(offsets[0]);
  object.FCed = reader.readBoolOrNull(offsets[1]);
  object.bestBad = reader.readLongOrNull(offsets[2]);
  object.bestGood = reader.readLongOrNull(offsets[3]);
  object.bestGreat = reader.readLongOrNull(offsets[4]);
  object.bestMiss = reader.readLongOrNull(offsets[5]);
  object.bestPerfect = reader.readLongOrNull(offsets[6]);
  object.diff = reader.readLong(offsets[7]);
  object.highScore = reader.readLongOrNull(offsets[8]);
  return object;
}

P _pj_diff_and_scoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension pj_diff_and_scoreQueryFilter
    on QueryBuilder<pj_diff_and_score, pj_diff_and_score, QFilterCondition> {
  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      aPedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'APed',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      aPedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'APed',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      aPedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'APed',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      fCedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'FCed',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      fCedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'FCed',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      fCedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'FCed',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestBad',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestBad',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestBad',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestBad',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestBad',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestBadBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestBad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestGood',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestGood',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestGood',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestGood',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestGood',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGoodBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestGood',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestGreat',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestGreat',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestGreat',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestGreat',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestGreat',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestGreatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestGreat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestMiss',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestMiss',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestMiss',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestMiss',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestMiss',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestMissBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestMiss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bestPerfect',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bestPerfect',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestPerfect',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestPerfect',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestPerfect',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      bestPerfectBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestPerfect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      diffEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diff',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      diffGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diff',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      diffLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diff',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      diffBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diff',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'highScore',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'highScore',
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highScore',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'highScore',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'highScore',
        value: value,
      ));
    });
  }

  QueryBuilder<pj_diff_and_score, pj_diff_and_score, QAfterFilterCondition>
      highScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'highScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension pj_diff_and_scoreQueryObject
    on QueryBuilder<pj_diff_and_score, pj_diff_and_score, QFilterCondition> {}
