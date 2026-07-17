// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BusinessProfilesTable extends BusinessProfiles
    with TableInfo<$BusinessProfilesTable, BusinessProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessProfilesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _physicalAddressMeta = const VerificationMeta(
    'physicalAddress',
  );
  @override
  late final GeneratedColumn<String> physicalAddress = GeneratedColumn<String>(
    'physical_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tinMeta = const VerificationMeta('tin');
  @override
  late final GeneratedColumn<String> tin = GeneratedColumn<String>(
    'tin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVatRegisteredMeta = const VerificationMeta(
    'isVatRegistered',
  );
  @override
  late final GeneratedColumn<bool> isVatRegistered = GeneratedColumn<bool>(
    'is_vat_registered',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_vat_registered" IN (0, 1))',
    ),
  );
  static const VerificationMeta _vatRateMeta = const VerificationMeta(
    'vatRate',
  );
  @override
  late final GeneratedColumn<double> vatRate = GeneratedColumn<double>(
    'vat_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(15.0),
  );
  static const VerificationMeta _nhilRateMeta = const VerificationMeta(
    'nhilRate',
  );
  @override
  late final GeneratedColumn<double> nhilRate = GeneratedColumn<double>(
    'nhil_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _getfundRateMeta = const VerificationMeta(
    'getfundRate',
  );
  @override
  late final GeneratedColumn<double> getfundRate = GeneratedColumn<double>(
    'getfund_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _covidLevyRateMeta = const VerificationMeta(
    'covidLevyRate',
  );
  @override
  late final GeneratedColumn<double> covidLevyRate = GeneratedColumn<double>(
    'covid_levy_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _pinHashMeta = const VerificationMeta(
    'pinHash',
  );
  @override
  late final GeneratedColumn<String> pinHash = GeneratedColumn<String>(
    'pin_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessName,
    phone,
    email,
    physicalAddress,
    tin,
    isVatRegistered,
    vatRate,
    nhilRate,
    getfundRate,
    covidLevyRate,
    pinHash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_businessNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('physical_address')) {
      context.handle(
        _physicalAddressMeta,
        physicalAddress.isAcceptableOrUnknown(
          data['physical_address']!,
          _physicalAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_physicalAddressMeta);
    }
    if (data.containsKey('tin')) {
      context.handle(
        _tinMeta,
        tin.isAcceptableOrUnknown(data['tin']!, _tinMeta),
      );
    }
    if (data.containsKey('is_vat_registered')) {
      context.handle(
        _isVatRegisteredMeta,
        isVatRegistered.isAcceptableOrUnknown(
          data['is_vat_registered']!,
          _isVatRegisteredMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isVatRegisteredMeta);
    }
    if (data.containsKey('vat_rate')) {
      context.handle(
        _vatRateMeta,
        vatRate.isAcceptableOrUnknown(data['vat_rate']!, _vatRateMeta),
      );
    }
    if (data.containsKey('nhil_rate')) {
      context.handle(
        _nhilRateMeta,
        nhilRate.isAcceptableOrUnknown(data['nhil_rate']!, _nhilRateMeta),
      );
    }
    if (data.containsKey('getfund_rate')) {
      context.handle(
        _getfundRateMeta,
        getfundRate.isAcceptableOrUnknown(
          data['getfund_rate']!,
          _getfundRateMeta,
        ),
      );
    }
    if (data.containsKey('covid_levy_rate')) {
      context.handle(
        _covidLevyRateMeta,
        covidLevyRate.isAcceptableOrUnknown(
          data['covid_levy_rate']!,
          _covidLevyRateMeta,
        ),
      );
    }
    if (data.containsKey('pin_hash')) {
      context.handle(
        _pinHashMeta,
        pinHash.isAcceptableOrUnknown(data['pin_hash']!, _pinHashMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessProfile(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      businessName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}business_name'],
          )!,
      phone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}phone'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      physicalAddress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}physical_address'],
          )!,
      tin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tin'],
      ),
      isVatRegistered:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_vat_registered'],
          )!,
      vatRate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}vat_rate'],
          )!,
      nhilRate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}nhil_rate'],
          )!,
      getfundRate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}getfund_rate'],
          )!,
      covidLevyRate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}covid_levy_rate'],
          )!,
      pinHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_hash'],
      ),
    );
  }

  @override
  $BusinessProfilesTable createAlias(String alias) {
    return $BusinessProfilesTable(attachedDatabase, alias);
  }
}

class BusinessProfile extends DataClass implements Insertable<BusinessProfile> {
  final int id;
  final String businessName;
  final String phone;
  final String email;
  final String physicalAddress;
  final String? tin;
  final bool isVatRegistered;
  final double vatRate;
  final double nhilRate;
  final double getfundRate;
  final double covidLevyRate;
  final String? pinHash;
  const BusinessProfile({
    required this.id,
    required this.businessName,
    required this.phone,
    required this.email,
    required this.physicalAddress,
    this.tin,
    required this.isVatRegistered,
    required this.vatRate,
    required this.nhilRate,
    required this.getfundRate,
    required this.covidLevyRate,
    this.pinHash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_name'] = Variable<String>(businessName);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    map['physical_address'] = Variable<String>(physicalAddress);
    if (!nullToAbsent || tin != null) {
      map['tin'] = Variable<String>(tin);
    }
    map['is_vat_registered'] = Variable<bool>(isVatRegistered);
    map['vat_rate'] = Variable<double>(vatRate);
    map['nhil_rate'] = Variable<double>(nhilRate);
    map['getfund_rate'] = Variable<double>(getfundRate);
    map['covid_levy_rate'] = Variable<double>(covidLevyRate);
    if (!nullToAbsent || pinHash != null) {
      map['pin_hash'] = Variable<String>(pinHash);
    }
    return map;
  }

  BusinessProfilesCompanion toCompanion(bool nullToAbsent) {
    return BusinessProfilesCompanion(
      id: Value(id),
      businessName: Value(businessName),
      phone: Value(phone),
      email: Value(email),
      physicalAddress: Value(physicalAddress),
      tin: tin == null && nullToAbsent ? const Value.absent() : Value(tin),
      isVatRegistered: Value(isVatRegistered),
      vatRate: Value(vatRate),
      nhilRate: Value(nhilRate),
      getfundRate: Value(getfundRate),
      covidLevyRate: Value(covidLevyRate),
      pinHash:
          pinHash == null && nullToAbsent
              ? const Value.absent()
              : Value(pinHash),
    );
  }

  factory BusinessProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessProfile(
      id: serializer.fromJson<int>(json['id']),
      businessName: serializer.fromJson<String>(json['businessName']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      physicalAddress: serializer.fromJson<String>(json['physicalAddress']),
      tin: serializer.fromJson<String?>(json['tin']),
      isVatRegistered: serializer.fromJson<bool>(json['isVatRegistered']),
      vatRate: serializer.fromJson<double>(json['vatRate']),
      nhilRate: serializer.fromJson<double>(json['nhilRate']),
      getfundRate: serializer.fromJson<double>(json['getfundRate']),
      covidLevyRate: serializer.fromJson<double>(json['covidLevyRate']),
      pinHash: serializer.fromJson<String?>(json['pinHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessName': serializer.toJson<String>(businessName),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'physicalAddress': serializer.toJson<String>(physicalAddress),
      'tin': serializer.toJson<String?>(tin),
      'isVatRegistered': serializer.toJson<bool>(isVatRegistered),
      'vatRate': serializer.toJson<double>(vatRate),
      'nhilRate': serializer.toJson<double>(nhilRate),
      'getfundRate': serializer.toJson<double>(getfundRate),
      'covidLevyRate': serializer.toJson<double>(covidLevyRate),
      'pinHash': serializer.toJson<String?>(pinHash),
    };
  }

  BusinessProfile copyWith({
    int? id,
    String? businessName,
    String? phone,
    String? email,
    String? physicalAddress,
    Value<String?> tin = const Value.absent(),
    bool? isVatRegistered,
    double? vatRate,
    double? nhilRate,
    double? getfundRate,
    double? covidLevyRate,
    Value<String?> pinHash = const Value.absent(),
  }) => BusinessProfile(
    id: id ?? this.id,
    businessName: businessName ?? this.businessName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    physicalAddress: physicalAddress ?? this.physicalAddress,
    tin: tin.present ? tin.value : this.tin,
    isVatRegistered: isVatRegistered ?? this.isVatRegistered,
    vatRate: vatRate ?? this.vatRate,
    nhilRate: nhilRate ?? this.nhilRate,
    getfundRate: getfundRate ?? this.getfundRate,
    covidLevyRate: covidLevyRate ?? this.covidLevyRate,
    pinHash: pinHash.present ? pinHash.value : this.pinHash,
  );
  BusinessProfile copyWithCompanion(BusinessProfilesCompanion data) {
    return BusinessProfile(
      id: data.id.present ? data.id.value : this.id,
      businessName:
          data.businessName.present
              ? data.businessName.value
              : this.businessName,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      physicalAddress:
          data.physicalAddress.present
              ? data.physicalAddress.value
              : this.physicalAddress,
      tin: data.tin.present ? data.tin.value : this.tin,
      isVatRegistered:
          data.isVatRegistered.present
              ? data.isVatRegistered.value
              : this.isVatRegistered,
      vatRate: data.vatRate.present ? data.vatRate.value : this.vatRate,
      nhilRate: data.nhilRate.present ? data.nhilRate.value : this.nhilRate,
      getfundRate:
          data.getfundRate.present ? data.getfundRate.value : this.getfundRate,
      covidLevyRate:
          data.covidLevyRate.present
              ? data.covidLevyRate.value
              : this.covidLevyRate,
      pinHash: data.pinHash.present ? data.pinHash.value : this.pinHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfile(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('physicalAddress: $physicalAddress, ')
          ..write('tin: $tin, ')
          ..write('isVatRegistered: $isVatRegistered, ')
          ..write('vatRate: $vatRate, ')
          ..write('nhilRate: $nhilRate, ')
          ..write('getfundRate: $getfundRate, ')
          ..write('covidLevyRate: $covidLevyRate, ')
          ..write('pinHash: $pinHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    businessName,
    phone,
    email,
    physicalAddress,
    tin,
    isVatRegistered,
    vatRate,
    nhilRate,
    getfundRate,
    covidLevyRate,
    pinHash,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessProfile &&
          other.id == this.id &&
          other.businessName == this.businessName &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.physicalAddress == this.physicalAddress &&
          other.tin == this.tin &&
          other.isVatRegistered == this.isVatRegistered &&
          other.vatRate == this.vatRate &&
          other.nhilRate == this.nhilRate &&
          other.getfundRate == this.getfundRate &&
          other.covidLevyRate == this.covidLevyRate &&
          other.pinHash == this.pinHash);
}

class BusinessProfilesCompanion extends UpdateCompanion<BusinessProfile> {
  final Value<int> id;
  final Value<String> businessName;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> physicalAddress;
  final Value<String?> tin;
  final Value<bool> isVatRegistered;
  final Value<double> vatRate;
  final Value<double> nhilRate;
  final Value<double> getfundRate;
  final Value<double> covidLevyRate;
  final Value<String?> pinHash;
  const BusinessProfilesCompanion({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.physicalAddress = const Value.absent(),
    this.tin = const Value.absent(),
    this.isVatRegistered = const Value.absent(),
    this.vatRate = const Value.absent(),
    this.nhilRate = const Value.absent(),
    this.getfundRate = const Value.absent(),
    this.covidLevyRate = const Value.absent(),
    this.pinHash = const Value.absent(),
  });
  BusinessProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String businessName,
    required String phone,
    required String email,
    required String physicalAddress,
    this.tin = const Value.absent(),
    required bool isVatRegistered,
    this.vatRate = const Value.absent(),
    this.nhilRate = const Value.absent(),
    this.getfundRate = const Value.absent(),
    this.covidLevyRate = const Value.absent(),
    this.pinHash = const Value.absent(),
  }) : businessName = Value(businessName),
       phone = Value(phone),
       email = Value(email),
       physicalAddress = Value(physicalAddress),
       isVatRegistered = Value(isVatRegistered);
  static Insertable<BusinessProfile> custom({
    Expression<int>? id,
    Expression<String>? businessName,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? physicalAddress,
    Expression<String>? tin,
    Expression<bool>? isVatRegistered,
    Expression<double>? vatRate,
    Expression<double>? nhilRate,
    Expression<double>? getfundRate,
    Expression<double>? covidLevyRate,
    Expression<String>? pinHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessName != null) 'business_name': businessName,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (physicalAddress != null) 'physical_address': physicalAddress,
      if (tin != null) 'tin': tin,
      if (isVatRegistered != null) 'is_vat_registered': isVatRegistered,
      if (vatRate != null) 'vat_rate': vatRate,
      if (nhilRate != null) 'nhil_rate': nhilRate,
      if (getfundRate != null) 'getfund_rate': getfundRate,
      if (covidLevyRate != null) 'covid_levy_rate': covidLevyRate,
      if (pinHash != null) 'pin_hash': pinHash,
    });
  }

  BusinessProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? businessName,
    Value<String>? phone,
    Value<String>? email,
    Value<String>? physicalAddress,
    Value<String?>? tin,
    Value<bool>? isVatRegistered,
    Value<double>? vatRate,
    Value<double>? nhilRate,
    Value<double>? getfundRate,
    Value<double>? covidLevyRate,
    Value<String?>? pinHash,
  }) {
    return BusinessProfilesCompanion(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      physicalAddress: physicalAddress ?? this.physicalAddress,
      tin: tin ?? this.tin,
      isVatRegistered: isVatRegistered ?? this.isVatRegistered,
      vatRate: vatRate ?? this.vatRate,
      nhilRate: nhilRate ?? this.nhilRate,
      getfundRate: getfundRate ?? this.getfundRate,
      covidLevyRate: covidLevyRate ?? this.covidLevyRate,
      pinHash: pinHash ?? this.pinHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (physicalAddress.present) {
      map['physical_address'] = Variable<String>(physicalAddress.value);
    }
    if (tin.present) {
      map['tin'] = Variable<String>(tin.value);
    }
    if (isVatRegistered.present) {
      map['is_vat_registered'] = Variable<bool>(isVatRegistered.value);
    }
    if (vatRate.present) {
      map['vat_rate'] = Variable<double>(vatRate.value);
    }
    if (nhilRate.present) {
      map['nhil_rate'] = Variable<double>(nhilRate.value);
    }
    if (getfundRate.present) {
      map['getfund_rate'] = Variable<double>(getfundRate.value);
    }
    if (covidLevyRate.present) {
      map['covid_levy_rate'] = Variable<double>(covidLevyRate.value);
    }
    if (pinHash.present) {
      map['pin_hash'] = Variable<String>(pinHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfilesCompanion(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('physicalAddress: $physicalAddress, ')
          ..write('tin: $tin, ')
          ..write('isVatRegistered: $isVatRegistered, ')
          ..write('vatRate: $vatRate, ')
          ..write('nhilRate: $nhilRate, ')
          ..write('getfundRate: $getfundRate, ')
          ..write('covidLevyRate: $covidLevyRate, ')
          ..write('pinHash: $pinHash')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tinMeta = const VerificationMeta('tin');
  @override
  late final GeneratedColumn<String> tin = GeneratedColumn<String>(
    'tin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, address, tin];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
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
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tin')) {
      context.handle(
        _tinMeta,
        tin.isAcceptableOrUnknown(data['tin']!, _tinMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      phone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}phone'],
          )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      tin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tin'],
      ),
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String name;
  final String phone;
  final String? address;
  final String? tin;
  const Customer({
    required this.id,
    required this.name,
    required this.phone,
    this.address,
    this.tin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || tin != null) {
      map['tin'] = Variable<String>(tin);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      address:
          address == null && nullToAbsent
              ? const Value.absent()
              : Value(address),
      tin: tin == null && nullToAbsent ? const Value.absent() : Value(tin),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      tin: serializer.fromJson<String?>(json['tin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String?>(address),
      'tin': serializer.toJson<String?>(tin),
    };
  }

  Customer copyWith({
    int? id,
    String? name,
    String? phone,
    Value<String?> address = const Value.absent(),
    Value<String?> tin = const Value.absent(),
  }) => Customer(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    address: address.present ? address.value : this.address,
    tin: tin.present ? tin.value : this.tin,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      tin: data.tin.present ? data.tin.value : this.tin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('tin: $tin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, address, tin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.tin == this.tin);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String?> address;
  final Value<String?> tin;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    this.address = const Value.absent(),
    this.tin = const Value.absent(),
  }) : name = Value(name),
       phone = Value(phone);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? tin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (tin != null) 'tin': tin,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String?>? address,
    Value<String?>? tin,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      tin: tin ?? this.tin,
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
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (tin.present) {
      map['tin'] = Variable<String>(tin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('tin: $tin')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isTaxableMeta = const VerificationMeta(
    'isTaxable',
  );
  @override
  late final GeneratedColumn<bool> isTaxable = GeneratedColumn<bool>(
    'is_taxable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_taxable" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, price, isTaxable];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
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
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_taxable')) {
      context.handle(
        _isTaxableMeta,
        isTaxable.isAcceptableOrUnknown(data['is_taxable']!, _isTaxableMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}price'],
          )!,
      isTaxable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_taxable'],
          )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String name;
  final double price;
  final bool isTaxable;
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.isTaxable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['is_taxable'] = Variable<bool>(isTaxable);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      isTaxable: Value(isTaxable),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      isTaxable: serializer.fromJson<bool>(json['isTaxable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'isTaxable': serializer.toJson<bool>(isTaxable),
    };
  }

  Product copyWith({int? id, String? name, double? price, bool? isTaxable}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        isTaxable: isTaxable ?? this.isTaxable,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      isTaxable: data.isTaxable.present ? data.isTaxable.value : this.isTaxable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('isTaxable: $isTaxable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, isTaxable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.isTaxable == this.isTaxable);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<bool> isTaxable;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.isTaxable = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    this.isTaxable = const Value.absent(),
  }) : name = Value(name),
       price = Value(price);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<bool>? isTaxable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (isTaxable != null) 'is_taxable': isTaxable,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? price,
    Value<bool>? isTaxable,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isTaxable: isTaxable ?? this.isTaxable,
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
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (isTaxable.present) {
      map['is_taxable'] = Variable<bool>(isTaxable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('isTaxable: $isTaxable')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountAmountMeta = const VerificationMeta(
    'discountAmount',
  );
  @override
  late final GeneratedColumn<double> discountAmount = GeneratedColumn<double>(
    'discount_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceDueMeta = const VerificationMeta(
    'balanceDue',
  );
  @override
  late final GeneratedColumn<double> balanceDue = GeneratedColumn<double>(
    'balance_due',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNumber,
    customerId,
    dateCreated,
    discountAmount,
    totalAmount,
    balanceDue,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
        _discountAmountMeta,
        discountAmount.isAcceptableOrUnknown(
          data['discount_amount']!,
          _discountAmountMeta,
        ),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('balance_due')) {
      context.handle(
        _balanceDueMeta,
        balanceDue.isAcceptableOrUnknown(data['balance_due']!, _balanceDueMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceDueMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      invoiceNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}invoice_number'],
          )!,
      customerId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}customer_id'],
          )!,
      dateCreated:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_created'],
          )!,
      discountAmount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}discount_amount'],
          )!,
      totalAmount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}total_amount'],
          )!,
      balanceDue:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}balance_due'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final int id;
  final String invoiceNumber;
  final int customerId;
  final DateTime dateCreated;
  final double discountAmount;
  final double totalAmount;
  final double balanceDue;
  final String status;
  const Invoice({
    required this.id,
    required this.invoiceNumber,
    required this.customerId,
    required this.dateCreated,
    required this.discountAmount,
    required this.totalAmount,
    required this.balanceDue,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['customer_id'] = Variable<int>(customerId);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['discount_amount'] = Variable<double>(discountAmount);
    map['total_amount'] = Variable<double>(totalAmount);
    map['balance_due'] = Variable<double>(balanceDue);
    map['status'] = Variable<String>(status);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      invoiceNumber: Value(invoiceNumber),
      customerId: Value(customerId),
      dateCreated: Value(dateCreated),
      discountAmount: Value(discountAmount),
      totalAmount: Value(totalAmount),
      balanceDue: Value(balanceDue),
      status: Value(status),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<int>(json['id']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      customerId: serializer.fromJson<int>(json['customerId']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      discountAmount: serializer.fromJson<double>(json['discountAmount']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      balanceDue: serializer.fromJson<double>(json['balanceDue']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'customerId': serializer.toJson<int>(customerId),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'discountAmount': serializer.toJson<double>(discountAmount),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'balanceDue': serializer.toJson<double>(balanceDue),
      'status': serializer.toJson<String>(status),
    };
  }

  Invoice copyWith({
    int? id,
    String? invoiceNumber,
    int? customerId,
    DateTime? dateCreated,
    double? discountAmount,
    double? totalAmount,
    double? balanceDue,
    String? status,
  }) => Invoice(
    id: id ?? this.id,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    customerId: customerId ?? this.customerId,
    dateCreated: dateCreated ?? this.dateCreated,
    discountAmount: discountAmount ?? this.discountAmount,
    totalAmount: totalAmount ?? this.totalAmount,
    balanceDue: balanceDue ?? this.balanceDue,
    status: status ?? this.status,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNumber:
          data.invoiceNumber.present
              ? data.invoiceNumber.value
              : this.invoiceNumber,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      discountAmount:
          data.discountAmount.present
              ? data.discountAmount.value
              : this.discountAmount,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      balanceDue:
          data.balanceDue.present ? data.balanceDue.value : this.balanceDue,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('customerId: $customerId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('balanceDue: $balanceDue, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNumber,
    customerId,
    dateCreated,
    discountAmount,
    totalAmount,
    balanceDue,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.invoiceNumber == this.invoiceNumber &&
          other.customerId == this.customerId &&
          other.dateCreated == this.dateCreated &&
          other.discountAmount == this.discountAmount &&
          other.totalAmount == this.totalAmount &&
          other.balanceDue == this.balanceDue &&
          other.status == this.status);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<int> id;
  final Value<String> invoiceNumber;
  final Value<int> customerId;
  final Value<DateTime> dateCreated;
  final Value<double> discountAmount;
  final Value<double> totalAmount;
  final Value<double> balanceDue;
  final Value<String> status;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.customerId = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.balanceDue = const Value.absent(),
    this.status = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNumber,
    required int customerId,
    required DateTime dateCreated,
    this.discountAmount = const Value.absent(),
    required double totalAmount,
    required double balanceDue,
    this.status = const Value.absent(),
  }) : invoiceNumber = Value(invoiceNumber),
       customerId = Value(customerId),
       dateCreated = Value(dateCreated),
       totalAmount = Value(totalAmount),
       balanceDue = Value(balanceDue);
  static Insertable<Invoice> custom({
    Expression<int>? id,
    Expression<String>? invoiceNumber,
    Expression<int>? customerId,
    Expression<DateTime>? dateCreated,
    Expression<double>? discountAmount,
    Expression<double>? totalAmount,
    Expression<double>? balanceDue,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (customerId != null) 'customer_id': customerId,
      if (dateCreated != null) 'date_created': dateCreated,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (balanceDue != null) 'balance_due': balanceDue,
      if (status != null) 'status': status,
    });
  }

  InvoicesCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceNumber,
    Value<int>? customerId,
    Value<DateTime>? dateCreated,
    Value<double>? discountAmount,
    Value<double>? totalAmount,
    Value<double>? balanceDue,
    Value<String>? status,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      customerId: customerId ?? this.customerId,
      dateCreated: dateCreated ?? this.dateCreated,
      discountAmount: discountAmount ?? this.discountAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      balanceDue: balanceDue ?? this.balanceDue,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (balanceDue.present) {
      map['balance_due'] = Variable<double>(balanceDue.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('customerId: $customerId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('balanceDue: $balanceDue, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $InvoiceItemsTable extends InvoiceItems
    with TableInfo<$InvoiceItemsTable, InvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isTaxableMeta = const VerificationMeta(
    'isTaxable',
  );
  @override
  late final GeneratedColumn<bool> isTaxable = GeneratedColumn<bool>(
    'is_taxable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_taxable" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lineTotalMeta = const VerificationMeta(
    'lineTotal',
  );
  @override
  late final GeneratedColumn<double> lineTotal = GeneratedColumn<double>(
    'line_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productName,
    quantity,
    unitPrice,
    isTaxable,
    lineTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('is_taxable')) {
      context.handle(
        _isTaxableMeta,
        isTaxable.isAcceptableOrUnknown(data['is_taxable']!, _isTaxableMeta),
      );
    } else if (isInserting) {
      context.missing(_isTaxableMeta);
    }
    if (data.containsKey('line_total')) {
      context.handle(
        _lineTotalMeta,
        lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      invoiceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}invoice_id'],
          )!,
      productName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}product_name'],
          )!,
      quantity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}quantity'],
          )!,
      unitPrice:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}unit_price'],
          )!,
      isTaxable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_taxable'],
          )!,
      lineTotal:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}line_total'],
          )!,
    );
  }

  @override
  $InvoiceItemsTable createAlias(String alias) {
    return $InvoiceItemsTable(attachedDatabase, alias);
  }
}

class InvoiceItem extends DataClass implements Insertable<InvoiceItem> {
  final int id;
  final int invoiceId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final bool isTaxable;
  final double lineTotal;
  const InvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.isTaxable,
    required this.lineTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['product_name'] = Variable<String>(productName);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['is_taxable'] = Variable<bool>(isTaxable);
    map['line_total'] = Variable<double>(lineTotal);
    return map;
  }

  InvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productName: Value(productName),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      isTaxable: Value(isTaxable),
      lineTotal: Value(lineTotal),
    );
  }

  factory InvoiceItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      productName: serializer.fromJson<String>(json['productName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      isTaxable: serializer.fromJson<bool>(json['isTaxable']),
      lineTotal: serializer.fromJson<double>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'productName': serializer.toJson<String>(productName),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'isTaxable': serializer.toJson<bool>(isTaxable),
      'lineTotal': serializer.toJson<double>(lineTotal),
    };
  }

  InvoiceItem copyWith({
    int? id,
    int? invoiceId,
    String? productName,
    int? quantity,
    double? unitPrice,
    bool? isTaxable,
    double? lineTotal,
  }) => InvoiceItem(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productName: productName ?? this.productName,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    isTaxable: isTaxable ?? this.isTaxable,
    lineTotal: lineTotal ?? this.lineTotal,
  );
  InvoiceItem copyWithCompanion(InvoiceItemsCompanion data) {
    return InvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      isTaxable: data.isTaxable.present ? data.isTaxable.value : this.isTaxable,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('isTaxable: $isTaxable, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productName,
    quantity,
    unitPrice,
    isTaxable,
    lineTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productName == this.productName &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.isTaxable == this.isTaxable &&
          other.lineTotal == this.lineTotal);
}

class InvoiceItemsCompanion extends UpdateCompanion<InvoiceItem> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<String> productName;
  final Value<int> quantity;
  final Value<double> unitPrice;
  final Value<bool> isTaxable;
  final Value<double> lineTotal;
  const InvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.isTaxable = const Value.absent(),
    this.lineTotal = const Value.absent(),
  });
  InvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required bool isTaxable,
    required double lineTotal,
  }) : invoiceId = Value(invoiceId),
       productName = Value(productName),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       isTaxable = Value(isTaxable),
       lineTotal = Value(lineTotal);
  static Insertable<InvoiceItem> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<String>? productName,
    Expression<int>? quantity,
    Expression<double>? unitPrice,
    Expression<bool>? isTaxable,
    Expression<double>? lineTotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productName != null) 'product_name': productName,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (isTaxable != null) 'is_taxable': isTaxable,
      if (lineTotal != null) 'line_total': lineTotal,
    });
  }

  InvoiceItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<String>? productName,
    Value<int>? quantity,
    Value<double>? unitPrice,
    Value<bool>? isTaxable,
    Value<double>? lineTotal,
  }) {
    return InvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      isTaxable: isTaxable ?? this.isTaxable,
      lineTotal: lineTotal ?? this.lineTotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (isTaxable.present) {
      map['is_taxable'] = Variable<bool>(isTaxable.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<double>(lineTotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('isTaxable: $isTaxable, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountPaidMeta = const VerificationMeta(
    'amountPaid',
  );
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
    'amount_paid',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    amountPaid,
    paymentDate,
    paymentMethod,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
        _amountPaidMeta,
        amountPaid.isAcceptableOrUnknown(data['amount_paid']!, _amountPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      invoiceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}invoice_id'],
          )!,
      amountPaid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount_paid'],
          )!,
      paymentDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}payment_date'],
          )!,
      paymentMethod:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}payment_method'],
          )!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final int invoiceId;
  final double amountPaid;
  final DateTime paymentDate;
  final String paymentMethod;
  const Payment({
    required this.id,
    required this.invoiceId,
    required this.amountPaid,
    required this.paymentDate,
    required this.paymentMethod,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['amount_paid'] = Variable<double>(amountPaid);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['payment_method'] = Variable<String>(paymentMethod);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      amountPaid: Value(amountPaid),
      paymentDate: Value(paymentDate),
      paymentMethod: Value(paymentMethod),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
    };
  }

  Payment copyWith({
    int? id,
    int? invoiceId,
    double? amountPaid,
    DateTime? paymentDate,
    String? paymentMethod,
  }) => Payment(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    amountPaid: amountPaid ?? this.amountPaid,
    paymentDate: paymentDate ?? this.paymentDate,
    paymentMethod: paymentMethod ?? this.paymentMethod,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      amountPaid:
          data.amountPaid.present ? data.amountPaid.value : this.amountPaid,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      paymentMethod:
          data.paymentMethod.present
              ? data.paymentMethod.value
              : this.paymentMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, invoiceId, amountPaid, paymentDate, paymentMethod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.amountPaid == this.amountPaid &&
          other.paymentDate == this.paymentDate &&
          other.paymentMethod == this.paymentMethod);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<double> amountPaid;
  final Value<DateTime> paymentDate;
  final Value<String> paymentMethod;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required double amountPaid,
    required DateTime paymentDate,
    required String paymentMethod,
  }) : invoiceId = Value(invoiceId),
       amountPaid = Value(amountPaid),
       paymentDate = Value(paymentDate),
       paymentMethod = Value(paymentMethod);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<double>? amountPaid,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentMethod,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
    });
  }

  PaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<double>? amountPaid,
    Value<DateTime>? paymentDate,
    Value<String>? paymentMethod,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      amountPaid: amountPaid ?? this.amountPaid,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessProfilesTable businessProfiles = $BusinessProfilesTable(
    this,
  );
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceItemsTable invoiceItems = $InvoiceItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businessProfiles,
    customers,
    products,
    invoices,
    invoiceItems,
    payments,
  ];
}

typedef $$BusinessProfilesTableCreateCompanionBuilder =
    BusinessProfilesCompanion Function({
      Value<int> id,
      required String businessName,
      required String phone,
      required String email,
      required String physicalAddress,
      Value<String?> tin,
      required bool isVatRegistered,
      Value<double> vatRate,
      Value<double> nhilRate,
      Value<double> getfundRate,
      Value<double> covidLevyRate,
      Value<String?> pinHash,
    });
typedef $$BusinessProfilesTableUpdateCompanionBuilder =
    BusinessProfilesCompanion Function({
      Value<int> id,
      Value<String> businessName,
      Value<String> phone,
      Value<String> email,
      Value<String> physicalAddress,
      Value<String?> tin,
      Value<bool> isVatRegistered,
      Value<double> vatRate,
      Value<double> nhilRate,
      Value<double> getfundRate,
      Value<double> covidLevyRate,
      Value<String?> pinHash,
    });

class $$BusinessProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableFilterComposer({
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

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
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

  ColumnFilters<String> get physicalAddress => $composableBuilder(
    column: $table.physicalAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVatRegistered => $composableBuilder(
    column: $table.isVatRegistered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get vatRate => $composableBuilder(
    column: $table.vatRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nhilRate => $composableBuilder(
    column: $table.nhilRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get getfundRate => $composableBuilder(
    column: $table.getfundRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get covidLevyRate => $composableBuilder(
    column: $table.covidLevyRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableOrderingComposer({
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

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
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

  ColumnOrderings<String> get physicalAddress => $composableBuilder(
    column: $table.physicalAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVatRegistered => $composableBuilder(
    column: $table.isVatRegistered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get vatRate => $composableBuilder(
    column: $table.vatRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nhilRate => $composableBuilder(
    column: $table.nhilRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get getfundRate => $composableBuilder(
    column: $table.getfundRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get covidLevyRate => $composableBuilder(
    column: $table.covidLevyRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get physicalAddress => $composableBuilder(
    column: $table.physicalAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tin =>
      $composableBuilder(column: $table.tin, builder: (column) => column);

  GeneratedColumn<bool> get isVatRegistered => $composableBuilder(
    column: $table.isVatRegistered,
    builder: (column) => column,
  );

  GeneratedColumn<double> get vatRate =>
      $composableBuilder(column: $table.vatRate, builder: (column) => column);

  GeneratedColumn<double> get nhilRate =>
      $composableBuilder(column: $table.nhilRate, builder: (column) => column);

  GeneratedColumn<double> get getfundRate => $composableBuilder(
    column: $table.getfundRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get covidLevyRate => $composableBuilder(
    column: $table.covidLevyRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pinHash =>
      $composableBuilder(column: $table.pinHash, builder: (column) => column);
}

class $$BusinessProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessProfilesTable,
          BusinessProfile,
          $$BusinessProfilesTableFilterComposer,
          $$BusinessProfilesTableOrderingComposer,
          $$BusinessProfilesTableAnnotationComposer,
          $$BusinessProfilesTableCreateCompanionBuilder,
          $$BusinessProfilesTableUpdateCompanionBuilder,
          (
            BusinessProfile,
            BaseReferences<
              _$AppDatabase,
              $BusinessProfilesTable,
              BusinessProfile
            >,
          ),
          BusinessProfile,
          PrefetchHooks Function()
        > {
  $$BusinessProfilesTableTableManager(
    _$AppDatabase db,
    $BusinessProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$BusinessProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BusinessProfilesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$BusinessProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> physicalAddress = const Value.absent(),
                Value<String?> tin = const Value.absent(),
                Value<bool> isVatRegistered = const Value.absent(),
                Value<double> vatRate = const Value.absent(),
                Value<double> nhilRate = const Value.absent(),
                Value<double> getfundRate = const Value.absent(),
                Value<double> covidLevyRate = const Value.absent(),
                Value<String?> pinHash = const Value.absent(),
              }) => BusinessProfilesCompanion(
                id: id,
                businessName: businessName,
                phone: phone,
                email: email,
                physicalAddress: physicalAddress,
                tin: tin,
                isVatRegistered: isVatRegistered,
                vatRate: vatRate,
                nhilRate: nhilRate,
                getfundRate: getfundRate,
                covidLevyRate: covidLevyRate,
                pinHash: pinHash,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String businessName,
                required String phone,
                required String email,
                required String physicalAddress,
                Value<String?> tin = const Value.absent(),
                required bool isVatRegistered,
                Value<double> vatRate = const Value.absent(),
                Value<double> nhilRate = const Value.absent(),
                Value<double> getfundRate = const Value.absent(),
                Value<double> covidLevyRate = const Value.absent(),
                Value<String?> pinHash = const Value.absent(),
              }) => BusinessProfilesCompanion.insert(
                id: id,
                businessName: businessName,
                phone: phone,
                email: email,
                physicalAddress: physicalAddress,
                tin: tin,
                isVatRegistered: isVatRegistered,
                vatRate: vatRate,
                nhilRate: nhilRate,
                getfundRate: getfundRate,
                covidLevyRate: covidLevyRate,
                pinHash: pinHash,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessProfilesTable,
      BusinessProfile,
      $$BusinessProfilesTableFilterComposer,
      $$BusinessProfilesTableOrderingComposer,
      $$BusinessProfilesTableAnnotationComposer,
      $$BusinessProfilesTableCreateCompanionBuilder,
      $$BusinessProfilesTableUpdateCompanionBuilder,
      (
        BusinessProfile,
        BaseReferences<_$AppDatabase, $BusinessProfilesTable, BusinessProfile>,
      ),
      BusinessProfile,
      PrefetchHooks Function()
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      required String name,
      required String phone,
      Value<String?> address,
      Value<String?> tin,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String?> address,
      Value<String?> tin,
    });

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
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

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
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

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tin => $composableBuilder(
    column: $table.tin,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
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

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get tin =>
      $composableBuilder(column: $table.tin, builder: (column) => column);
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
          Customer,
          PrefetchHooks Function()
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                name: name,
                phone: phone,
                address: address,
                tin: tin,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String phone,
                Value<String?> address = const Value.absent(),
                Value<String?> tin = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                address: address,
                tin: tin,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
      Customer,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String name,
      required double price,
      Value<bool> isTaxable,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> price,
      Value<bool> isTaxable,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
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

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTaxable => $composableBuilder(
    column: $table.isTaxable,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
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

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTaxable => $composableBuilder(
    column: $table.isTaxable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
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

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get isTaxable =>
      $composableBuilder(column: $table.isTaxable, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<bool> isTaxable = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                name: name,
                price: price,
                isTaxable: isTaxable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double price,
                Value<bool> isTaxable = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                name: name,
                price: price,
                isTaxable: isTaxable,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      required String invoiceNumber,
      required int customerId,
      required DateTime dateCreated,
      Value<double> discountAmount,
      required double totalAmount,
      required double balanceDue,
      Value<String> status,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      Value<String> invoiceNumber,
      Value<int> customerId,
      Value<DateTime> dateCreated,
      Value<double> discountAmount,
      Value<double> totalAmount,
      Value<double> balanceDue,
      Value<String> status,
    });

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
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

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
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

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get balanceDue => $composableBuilder(
    column: $table.balanceDue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
          Invoice,
          PrefetchHooks Function()
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceNumber = const Value.absent(),
                Value<int> customerId = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<double> discountAmount = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> balanceDue = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                invoiceNumber: invoiceNumber,
                customerId: customerId,
                dateCreated: dateCreated,
                discountAmount: discountAmount,
                totalAmount: totalAmount,
                balanceDue: balanceDue,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceNumber,
                required int customerId,
                required DateTime dateCreated,
                Value<double> discountAmount = const Value.absent(),
                required double totalAmount,
                required double balanceDue,
                Value<String> status = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                invoiceNumber: invoiceNumber,
                customerId: customerId,
                dateCreated: dateCreated,
                discountAmount: discountAmount,
                totalAmount: totalAmount,
                balanceDue: balanceDue,
                status: status,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
      Invoice,
      PrefetchHooks Function()
    >;
typedef $$InvoiceItemsTableCreateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required String productName,
      required int quantity,
      required double unitPrice,
      required bool isTaxable,
      required double lineTotal,
    });
typedef $$InvoiceItemsTableUpdateCompanionBuilder =
    InvoiceItemsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<String> productName,
      Value<int> quantity,
      Value<double> unitPrice,
      Value<bool> isTaxable,
      Value<double> lineTotal,
    });

class $$InvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableFilterComposer({
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

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTaxable => $composableBuilder(
    column: $table.isTaxable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableOrderingComposer({
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

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTaxable => $composableBuilder(
    column: $table.isTaxable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTable> {
  $$InvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<bool> get isTaxable =>
      $composableBuilder(column: $table.isTaxable, builder: (column) => column);

  GeneratedColumn<double> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);
}

class $$InvoiceItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceItemsTable,
          InvoiceItem,
          $$InvoiceItemsTableFilterComposer,
          $$InvoiceItemsTableOrderingComposer,
          $$InvoiceItemsTableAnnotationComposer,
          $$InvoiceItemsTableCreateCompanionBuilder,
          $$InvoiceItemsTableUpdateCompanionBuilder,
          (
            InvoiceItem,
            BaseReferences<_$AppDatabase, $InvoiceItemsTable, InvoiceItem>,
          ),
          InvoiceItem,
          PrefetchHooks Function()
        > {
  $$InvoiceItemsTableTableManager(_$AppDatabase db, $InvoiceItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$InvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$InvoiceItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$InvoiceItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<bool> isTaxable = const Value.absent(),
                Value<double> lineTotal = const Value.absent(),
              }) => InvoiceItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                productName: productName,
                quantity: quantity,
                unitPrice: unitPrice,
                isTaxable: isTaxable,
                lineTotal: lineTotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required String productName,
                required int quantity,
                required double unitPrice,
                required bool isTaxable,
                required double lineTotal,
              }) => InvoiceItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productName: productName,
                quantity: quantity,
                unitPrice: unitPrice,
                isTaxable: isTaxable,
                lineTotal: lineTotal,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InvoiceItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceItemsTable,
      InvoiceItem,
      $$InvoiceItemsTableFilterComposer,
      $$InvoiceItemsTableOrderingComposer,
      $$InvoiceItemsTableAnnotationComposer,
      $$InvoiceItemsTableCreateCompanionBuilder,
      $$InvoiceItemsTableUpdateCompanionBuilder,
      (
        InvoiceItem,
        BaseReferences<_$AppDatabase, $InvoiceItemsTable, InvoiceItem>,
      ),
      InvoiceItem,
      PrefetchHooks Function()
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required double amountPaid,
      required DateTime paymentDate,
      required String paymentMethod,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<double> amountPaid,
      Value<DateTime> paymentDate,
      Value<String> paymentMethod,
    });

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
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

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
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

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
          Payment,
          PrefetchHooks Function()
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<double> amountPaid = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                invoiceId: invoiceId,
                amountPaid: amountPaid,
                paymentDate: paymentDate,
                paymentMethod: paymentMethod,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required double amountPaid,
                required DateTime paymentDate,
                required String paymentMethod,
              }) => PaymentsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                amountPaid: amountPaid,
                paymentDate: paymentDate,
                paymentMethod: paymentMethod,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
      Payment,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessProfilesTableTableManager get businessProfiles =>
      $$BusinessProfilesTableTableManager(_db, _db.businessProfiles);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceItemsTableTableManager get invoiceItems =>
      $$InvoiceItemsTableTableManager(_db, _db.invoiceItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
}
