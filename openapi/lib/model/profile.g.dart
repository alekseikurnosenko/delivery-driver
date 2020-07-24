// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Profile> _$profileSerializer = new _$ProfileSerializer();

class _$ProfileSerializer implements StructuredSerializer<Profile> {
  @override
  final Iterable<Type> types = const [Profile, _$Profile];
  @override
  final String wireName = 'Profile';

  @override
  Iterable<Object> serialize(Serializers serializers, Profile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.userId != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(String)));
    }
    if (object.deliveryAddress != null) {
      result
        ..add('deliveryAddress')
        ..add(serializers.serialize(object.deliveryAddress,
            specifiedType: const FullType(Address)));
    }
    if (object.paymentMethodId != null) {
      result
        ..add('paymentMethodId')
        ..add(serializers.serialize(object.paymentMethodId,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Profile deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveryAddress':
          result.deliveryAddress.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address)) as Address);
          break;
        case 'paymentMethodId':
          result.paymentMethodId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Profile extends Profile {
  @override
  final String id;
  @override
  final String userId;
  @override
  final Address deliveryAddress;
  @override
  final String paymentMethodId;

  factory _$Profile([void Function(ProfileBuilder) updates]) =>
      (new ProfileBuilder()..update(updates)).build();

  _$Profile._(
      {this.id, this.userId, this.deliveryAddress, this.paymentMethodId})
      : super._();

  @override
  Profile rebuild(void Function(ProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileBuilder toBuilder() => new ProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
        id == other.id &&
        userId == other.userId &&
        deliveryAddress == other.deliveryAddress &&
        paymentMethodId == other.paymentMethodId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), userId.hashCode),
            deliveryAddress.hashCode),
        paymentMethodId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Profile')
          ..add('id', id)
          ..add('userId', userId)
          ..add('deliveryAddress', deliveryAddress)
          ..add('paymentMethodId', paymentMethodId))
        .toString();
  }
}

class ProfileBuilder implements Builder<Profile, ProfileBuilder> {
  _$Profile _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  AddressBuilder _deliveryAddress;
  AddressBuilder get deliveryAddress =>
      _$this._deliveryAddress ??= new AddressBuilder();
  set deliveryAddress(AddressBuilder deliveryAddress) =>
      _$this._deliveryAddress = deliveryAddress;

  String _paymentMethodId;
  String get paymentMethodId => _$this._paymentMethodId;
  set paymentMethodId(String paymentMethodId) =>
      _$this._paymentMethodId = paymentMethodId;

  ProfileBuilder();

  ProfileBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userId = _$v.userId;
      _deliveryAddress = _$v.deliveryAddress?.toBuilder();
      _paymentMethodId = _$v.paymentMethodId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Profile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Profile;
  }

  @override
  void update(void Function(ProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Profile build() {
    _$Profile _$result;
    try {
      _$result = _$v ??
          new _$Profile._(
              id: id,
              userId: userId,
              deliveryAddress: _deliveryAddress?.build(),
              paymentMethodId: paymentMethodId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'deliveryAddress';
        _deliveryAddress?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Profile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
