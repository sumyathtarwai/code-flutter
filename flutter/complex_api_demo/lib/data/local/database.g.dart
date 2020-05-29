// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class LocalPost extends DataClass implements Insertable<LocalPost> {
  final int id;
  final DateTime date;
  final String slug;
  final String title;
  final String status;
  final String image;
  final int page;
  final int perPage;
  LocalPost(
      {@required this.id,
      this.date,
      @required this.slug,
      @required this.title,
      @required this.status,
      @required this.image,
      @required this.page,
      this.perPage});
  factory LocalPost.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return LocalPost(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      slug: stringType.mapFromDatabaseResponse(data['${effectivePrefix}slug']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      page: intType.mapFromDatabaseResponse(data['${effectivePrefix}page']),
      perPage:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}per_page']),
    );
  }
  factory LocalPost.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LocalPost(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      slug: serializer.fromJson<String>(json['slug']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      image: serializer.fromJson<String>(json['image']),
      page: serializer.fromJson<int>(json['page']),
      perPage: serializer.fromJson<int>(json['perPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'slug': serializer.toJson<String>(slug),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'image': serializer.toJson<String>(image),
      'page': serializer.toJson<int>(page),
      'perPage': serializer.toJson<int>(perPage),
    };
  }

  @override
  LocalPostsCompanion createCompanion(bool nullToAbsent) {
    return LocalPostsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      page: page == null && nullToAbsent ? const Value.absent() : Value(page),
      perPage: perPage == null && nullToAbsent
          ? const Value.absent()
          : Value(perPage),
    );
  }

  LocalPost copyWith(
          {int id,
          DateTime date,
          String slug,
          String title,
          String status,
          String image,
          int page,
          int perPage}) =>
      LocalPost(
        id: id ?? this.id,
        date: date ?? this.date,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        status: status ?? this.status,
        image: image ?? this.image,
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPost(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('slug: $slug, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('image: $image, ')
          ..write('page: $page, ')
          ..write('perPage: $perPage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(
              slug.hashCode,
              $mrjc(
                  title.hashCode,
                  $mrjc(
                      status.hashCode,
                      $mrjc(image.hashCode,
                          $mrjc(page.hashCode, perPage.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LocalPost &&
          other.id == this.id &&
          other.date == this.date &&
          other.slug == this.slug &&
          other.title == this.title &&
          other.status == this.status &&
          other.image == this.image &&
          other.page == this.page &&
          other.perPage == this.perPage);
}

class LocalPostsCompanion extends UpdateCompanion<LocalPost> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> slug;
  final Value<String> title;
  final Value<String> status;
  final Value<String> image;
  final Value<int> page;
  final Value<int> perPage;
  const LocalPostsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.slug = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.image = const Value.absent(),
    this.page = const Value.absent(),
    this.perPage = const Value.absent(),
  });
  LocalPostsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    @required String slug,
    @required String title,
    @required String status,
    @required String image,
    @required int page,
    this.perPage = const Value.absent(),
  })  : slug = Value(slug),
        title = Value(title),
        status = Value(status),
        image = Value(image),
        page = Value(page);
  LocalPostsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<String> slug,
      Value<String> title,
      Value<String> status,
      Value<String> image,
      Value<int> page,
      Value<int> perPage}) {
    return LocalPostsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      status: status ?? this.status,
      image: image ?? this.image,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

class $LocalPostsTable extends LocalPosts
    with TableInfo<$LocalPostsTable, LocalPost> {
  final GeneratedDatabase _db;
  final String _alias;
  $LocalPostsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _slugMeta = const VerificationMeta('slug');
  GeneratedTextColumn _slug;
  @override
  GeneratedTextColumn get slug => _slug ??= _constructSlug();
  GeneratedTextColumn _constructSlug() {
    return GeneratedTextColumn(
      'slug',
      $tableName,
      false,
    );
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

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pageMeta = const VerificationMeta('page');
  GeneratedIntColumn _page;
  @override
  GeneratedIntColumn get page => _page ??= _constructPage();
  GeneratedIntColumn _constructPage() {
    return GeneratedIntColumn(
      'page',
      $tableName,
      false,
    );
  }

  final VerificationMeta _perPageMeta = const VerificationMeta('perPage');
  GeneratedIntColumn _perPage;
  @override
  GeneratedIntColumn get perPage => _perPage ??= _constructPerPage();
  GeneratedIntColumn _constructPerPage() {
    return GeneratedIntColumn(
      'per_page',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, date, slug, title, status, image, page, perPage];
  @override
  $LocalPostsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'local_posts';
  @override
  final String actualTableName = 'local_posts';
  @override
  VerificationContext validateIntegrity(LocalPostsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    }
    if (d.slug.present) {
      context.handle(
          _slugMeta, slug.isAcceptableValue(d.slug.value, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.status.present) {
      context.handle(
          _statusMeta, status.isAcceptableValue(d.status.value, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (d.page.present) {
      context.handle(
          _pageMeta, page.isAcceptableValue(d.page.value, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (d.perPage.present) {
      context.handle(_perPageMeta,
          perPage.isAcceptableValue(d.perPage.value, _perPageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalPost map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LocalPost.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LocalPostsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.slug.present) {
      map['slug'] = Variable<String, StringType>(d.slug.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.status.present) {
      map['status'] = Variable<String, StringType>(d.status.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.page.present) {
      map['page'] = Variable<int, IntType>(d.page.value);
    }
    if (d.perPage.present) {
      map['per_page'] = Variable<int, IntType>(d.perPage.value);
    }
    return map;
  }

  @override
  $LocalPostsTable createAlias(String alias) {
    return $LocalPostsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $LocalPostsTable _localPosts;
  $LocalPostsTable get localPosts => _localPosts ??= $LocalPostsTable(this);
  PostDao _postDao;
  PostDao get postDao => _postDao ??= PostDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localPosts];
}
