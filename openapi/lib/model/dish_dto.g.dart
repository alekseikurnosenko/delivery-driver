// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DishDTO> _$dishDTOSerializer = new _$DishDTOSerializer();

class _$DishDTOSerializer implements StructuredSerializer<DishDTO> {
  @override
  final Iterable<Type> types = const [DishDTO, _$DishDTO];
  @override
  final String wireName = 'DishDTO';

  @override
  Iterable<Object> serialize(Serializers serializers, DishDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.price != null) {
      result
        ..add('price')
        ..add(serializers.serialize(object.price,
            specifiedType: const FullType(MoneyView)));
    }
    return result;
  }

  @override
  DishDTO deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DishDTOBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoneyView)) as MoneyView);
          break;
      }
    }

    return result.build();
  }
}

class _$DishDTO extends DishDTO {
  @override
  final String id;
  @override
  final String name;
  @override
  final MoneyView price;

  factory _$DishDTO([void Function(DishDTOBuilder) updates]) =>
      (new DishDTOBuilder()..update(updates)).build();

  _$DishDTO._({this.id, this.name, this.price}) : super._();

  @override
  DishDTO rebuild(void Function(DishDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DishDTOBuilder toBuilder() => new DishDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DishDTO &&
        id == other.id &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DishDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('price', price))
        .toString();
  }
}

class DishDTOBuilder implements Builder<DishDTO, DishDTOBuilder> {
  _$DishDTO _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MoneyViewBuilder _price;
  MoneyViewBuilder get price => _$this._price ??= new MoneyViewBuilder();
  set price(MoneyViewBuilder price) => _$this._price = price;

  DishDTOBuilder();

  DishDTOBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _price = _$v.price?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DishDTO other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DishDTO;
  }

  @override
  void update(void Function(DishDTOBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DishDTO build() {
    _$DishDTO _$result;
    try {
      _$result =
          _$v ?? new _$DishDTO._(id: id, name: name, price: _price?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'price';
        _price?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DishDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
