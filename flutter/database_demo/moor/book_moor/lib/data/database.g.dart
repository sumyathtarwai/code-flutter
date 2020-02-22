// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String description;
  final double price;
  final DateTime publishedDate;
  Book(
      {@required this.id,
      @required this.title,
      @required this.description,
      this.price,
      this.publishedDate});
  factory Book.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Book(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      price:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      publishedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}published_date']),
    );
  }
  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<double>(json['price']),
      publishedDate: serializer.fromJson<DateTime>(json['publishedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<double>(price),
      'publishedDate': serializer.toJson<DateTime>(publishedDate),
    };
  }

  @override
  BooksCompanion createCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      publishedDate: publishedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedDate),
    );
  }

  Book copyWith(
          {int id,
          String title,
          String description,
          double price,
          DateTime publishedDate}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        publishedDate: publishedDate ?? this.publishedDate,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('publishedDate: $publishedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(description.hashCode,
              $mrjc(price.hashCode, publishedDate.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.price == this.price &&
          other.publishedDate == this.publishedDate);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<double> price;
  final Value<DateTime> publishedDate;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.publishedDate = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String description,
    this.price = const Value.absent(),
    this.publishedDate = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  BooksCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<double> price,
      Value<DateTime> publishedDate}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String _alias;
  $BooksTable(this._db, [this._alias]);
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
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 2, maxTextLength: 200);
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedRealColumn _price;
  @override
  GeneratedRealColumn get price => _price ??= _constructPrice();
  GeneratedRealColumn _constructPrice() {
    return GeneratedRealColumn('price', $tableName, true,
        defaultValue: Constant(0.0));
  }

  final VerificationMeta _publishedDateMeta =
      const VerificationMeta('publishedDate');
  GeneratedDateTimeColumn _publishedDate;
  @override
  GeneratedDateTimeColumn get publishedDate =>
      _publishedDate ??= _constructPublishedDate();
  GeneratedDateTimeColumn _constructPublishedDate() {
    return GeneratedDateTimeColumn('published_date', $tableName, true,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, price, publishedDate];
  @override
  $BooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(BooksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.price.present) {
      context.handle(
          _priceMeta, price.isAcceptableValue(d.price.value, _priceMeta));
    }
    if (d.publishedDate.present) {
      context.handle(
          _publishedDateMeta,
          publishedDate.isAcceptableValue(
              d.publishedDate.value, _publishedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Book.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BooksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.price.present) {
      map['price'] = Variable<double, RealType>(d.price.value);
    }
    if (d.publishedDate.present) {
      map['published_date'] =
          Variable<DateTime, DateTimeType>(d.publishedDate.value);
    }
    return map;
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  final int id;
  final String authorName;
  Author({@required this.id, @required this.authorName});
  factory Author.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Author(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      authorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}author_name']),
    );
  }
  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<int>(json['id']),
      authorName: serializer.fromJson<String>(json['authorName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorName': serializer.toJson<String>(authorName),
    };
  }

  @override
  AuthorsCompanion createCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
    );
  }

  Author copyWith({int id, String authorName}) => Author(
        id: id ?? this.id,
        authorName: authorName ?? this.authorName,
      );
  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('authorName: $authorName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, authorName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Author &&
          other.id == this.id &&
          other.authorName == this.authorName);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<int> id;
  final Value<String> authorName;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.authorName = const Value.absent(),
  });
  AuthorsCompanion.insert({
    this.id = const Value.absent(),
    @required String authorName,
  }) : authorName = Value(authorName);
  AuthorsCompanion copyWith({Value<int> id, Value<String> authorName}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
    );
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  final GeneratedDatabase _db;
  final String _alias;
  $AuthorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _authorNameMeta = const VerificationMeta('authorName');
  GeneratedTextColumn _authorName;
  @override
  GeneratedTextColumn get authorName => _authorName ??= _constructAuthorName();
  GeneratedTextColumn _constructAuthorName() {
    return GeneratedTextColumn('author_name', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, authorName];
  @override
  $AuthorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'authors';
  @override
  final String actualTableName = 'authors';
  @override
  VerificationContext validateIntegrity(AuthorsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.authorName.present) {
      context.handle(_authorNameMeta,
          authorName.isAcceptableValue(d.authorName.value, _authorNameMeta));
    } else if (isInserting) {
      context.missing(_authorNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Author map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Author.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AuthorsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.authorName.present) {
      map['author_name'] = Variable<String, StringType>(d.authorName.value);
    }
    return map;
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(_db, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String categoryName;
  Category({@required this.id, @required this.categoryName});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Category(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      categoryName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_name']),
    );
  }
  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  @override
  CategoriesCompanion createCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
    );
  }

  Category copyWith({int id, String categoryName}) => Category(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, categoryName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.categoryName == this.categoryName);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> categoryName;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String categoryName,
  }) : categoryName = Value(categoryName);
  CategoriesCompanion copyWith({Value<int> id, Value<String> categoryName}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  GeneratedTextColumn _categoryName;
  @override
  GeneratedTextColumn get categoryName =>
      _categoryName ??= _constructCategoryName();
  GeneratedTextColumn _constructCategoryName() {
    return GeneratedTextColumn('category_name', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, categoryName];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(CategoriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.categoryName.present) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableValue(
              d.categoryName.value, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CategoriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.categoryName.present) {
      map['category_name'] = Variable<String, StringType>(d.categoryName.value);
    }
    return map;
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String userName;
  final String password;
  final DateTime dob;
  final String address;
  final String phone;
  final bool valid;
  final String role;
  User(
      {@required this.id,
      @required this.userName,
      @required this.password,
      this.dob,
      @required this.address,
      @required this.phone,
      this.valid,
      @required this.role});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      dob: dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      valid: boolType.mapFromDatabaseResponse(data['${effectivePrefix}valid']),
      role: stringType.mapFromDatabaseResponse(data['${effectivePrefix}role']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      address: serializer.fromJson<String>(json['address']),
      phone: serializer.fromJson<String>(json['phone']),
      valid: serializer.fromJson<bool>(json['valid']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
      'dob': serializer.toJson<DateTime>(dob),
      'address': serializer.toJson<String>(address),
      'phone': serializer.toJson<String>(phone),
      'valid': serializer.toJson<bool>(valid),
      'role': serializer.toJson<String>(role),
    };
  }

  @override
  UsersCompanion createCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      valid:
          valid == null && nullToAbsent ? const Value.absent() : Value(valid),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  User copyWith(
          {int id,
          String userName,
          String password,
          DateTime dob,
          String address,
          String phone,
          bool valid,
          String role}) =>
      User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        dob: dob ?? this.dob,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        valid: valid ?? this.valid,
        role: role ?? this.role,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('dob: $dob, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('valid: $valid, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userName.hashCode,
          $mrjc(
              password.hashCode,
              $mrjc(
                  dob.hashCode,
                  $mrjc(
                      address.hashCode,
                      $mrjc(phone.hashCode,
                          $mrjc(valid.hashCode, role.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.password == this.password &&
          other.dob == this.dob &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.valid == this.valid &&
          other.role == this.role);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> password;
  final Value<DateTime> dob;
  final Value<String> address;
  final Value<String> phone;
  final Value<bool> valid;
  final Value<String> role;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.dob = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.valid = const Value.absent(),
    this.role = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    @required String userName,
    @required String password,
    this.dob = const Value.absent(),
    @required String address,
    @required String phone,
    this.valid = const Value.absent(),
    @required String role,
  })  : userName = Value(userName),
        password = Value(password),
        address = Value(address),
        phone = Value(phone),
        role = Value(role);
  UsersCompanion copyWith(
      {Value<int> id,
      Value<String> userName,
      Value<String> password,
      Value<DateTime> dob,
      Value<String> address,
      Value<String> phone,
      Value<bool> valid,
      Value<String> role}) {
    return UsersCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      valid: valid ?? this.valid,
      role: role ?? this.role,
    );
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn('user_name', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn('password', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  GeneratedDateTimeColumn _dob;
  @override
  GeneratedDateTimeColumn get dob => _dob ??= _constructDob();
  GeneratedDateTimeColumn _constructDob() {
    return GeneratedDateTimeColumn(
      'dob',
      $tableName,
      true,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        minTextLength: 2, maxTextLength: 300);
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn('phone', $tableName, false,
        minTextLength: 2, maxTextLength: 100);
  }

  final VerificationMeta _validMeta = const VerificationMeta('valid');
  GeneratedBoolColumn _valid;
  @override
  GeneratedBoolColumn get valid => _valid ??= _constructValid();
  GeneratedBoolColumn _constructValid() {
    return GeneratedBoolColumn('valid', $tableName, true,
        defaultValue: Constant(true));
  }

  final VerificationMeta _roleMeta = const VerificationMeta('role');
  GeneratedTextColumn _role;
  @override
  GeneratedTextColumn get role => _role ??= _constructRole();
  GeneratedTextColumn _constructRole() {
    return GeneratedTextColumn('role', $tableName, false,
        minTextLength: 2, maxTextLength: 50);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, password, dob, address, phone, valid, role];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.userName.present) {
      context.handle(_userNameMeta,
          userName.isAcceptableValue(d.userName.value, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (d.password.present) {
      context.handle(_passwordMeta,
          password.isAcceptableValue(d.password.value, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (d.dob.present) {
      context.handle(_dobMeta, dob.isAcceptableValue(d.dob.value, _dobMeta));
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (d.valid.present) {
      context.handle(
          _validMeta, valid.isAcceptableValue(d.valid.value, _validMeta));
    }
    if (d.role.present) {
      context.handle(
          _roleMeta, role.isAcceptableValue(d.role.value, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.userName.present) {
      map['user_name'] = Variable<String, StringType>(d.userName.value);
    }
    if (d.password.present) {
      map['password'] = Variable<String, StringType>(d.password.value);
    }
    if (d.dob.present) {
      map['dob'] = Variable<DateTime, DateTimeType>(d.dob.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    if (d.valid.present) {
      map['valid'] = Variable<bool, BoolType>(d.valid.value);
    }
    if (d.role.present) {
      map['role'] = Variable<String, StringType>(d.role.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BooksTable _books;
  $BooksTable get books => _books ??= $BooksTable(this);
  $AuthorsTable _authors;
  $AuthorsTable get authors => _authors ??= $AuthorsTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  BookDao _bookDao;
  BookDao get bookDao => _bookDao ??= BookDao(this as AppDatabase);
  AuthorDao _authorDao;
  AuthorDao get authorDao => _authorDao ??= AuthorDao(this as AppDatabase);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDatabase);
  CategoryDao _categoryDao;
  CategoryDao get categoryDao =>
      _categoryDao ??= CategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [books, authors, categories, users];
}
