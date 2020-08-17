// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BasketItemDTO> _$basketItemDTOSerializer =
    new _$BasketItemDTOSerializer();

class _$BasketItemDTOSerializer implements StructuredSerializer<BasketItemDTO> {
  @override
  final Iterable<Type> types = const [BasketItemDTO, _$BasketItemDTO];
  @override
  final String wireName = 'BasketItemDTO';

  @override
  Iterable<Object> serialize(Serializers serializers, BasketItemDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.dish != null) {
      result
        ..add('dish')
        ..add(serializers.serialize(object.dish,
            specifiedType: const FullType(Dish)));
    }
    if (object.quantity != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BasketItemDTO deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BasketItemDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'dish':
          result.dish.replace(serializers.deserialize(value,
              specifiedType: const FullType(Dish)) as Dish);
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BasketItemDTO extends BasketItemDTO {
  @override
  final Dish dish;
  @override
  final int quantity;

  factory _$BasketItemDTO([void Function(BasketItemDTOBuilder) updates]) =>
      (new BasketItemDTOBuilder()..update(updates)).build();

  _$BasketItemDTO._({this.dish, this.quantity}) : super._();

  @override
  BasketItemDTO rebuild(void Function(BasketItemDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BasketItemDTOBuilder toBuilder() => new BasketItemDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BasketItemDTO &&
        dish == other.dish &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, dish.hashCode), quantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BasketItemDTO')
          ..add('dish', dish)
          ..add('quantity', quantity))
        .toString();
  }
}

class BasketItemDTOBuilder
    implements Builder<BasketItemDTO, BasketItemDTOBuilder> {
  _$BasketItemDTO _$v;

  DishBuilder _dish;
  DishBuilder get dish => _$this._dish ??= new DishBuilder();
  set dish(DishBuilder dish) => _$this._dish = dish;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  BasketItemDTOBuilder();

  BasketItemDTOBuilder get _$this {
    if (_$v != null) {
      _dish = _$v.dish?.toBuilder();
      _quantity = _$v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BasketItemDTO other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BasketItemDTO;
  }

  @override
  void update(void Function(BasketItemDTOBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BasketItemDTO build() {
    _$BasketItemDTO _$result;
    try {
      _$result = _$v ??
          new _$BasketItemDTO._(dish: _dish?.build(), quantity: quantity);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'dish';
        _dish?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BasketItemDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
