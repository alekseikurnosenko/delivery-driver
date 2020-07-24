// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BasketDTO> _$basketDTOSerializer = new _$BasketDTOSerializer();

class _$BasketDTOSerializer implements StructuredSerializer<BasketDTO> {
  @override
  final Iterable<Type> types = const [BasketDTO, _$BasketDTO];
  @override
  final String wireName = 'BasketDTO';

  @override
  Iterable<Object> serialize(Serializers serializers, BasketDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.items != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.items,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BasketItemDTO)])));
    }
    if (object.totalAmount != null) {
      result
        ..add('totalAmount')
        ..add(serializers.serialize(object.totalAmount,
            specifiedType: const FullType(MoneyView)));
    }
    if (object.isAboveMinimumOrder != null) {
      result
        ..add('isAboveMinimumOrder')
        ..add(serializers.serialize(object.isAboveMinimumOrder,
            specifiedType: const FullType(bool)));
    }
    if (object.aboveMinimumOrder != null) {
      result
        ..add('aboveMinimumOrder')
        ..add(serializers.serialize(object.aboveMinimumOrder,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  BasketDTO deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BasketDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BasketItemDTO)]))
              as BuiltList<Object>);
          break;
        case 'totalAmount':
          result.totalAmount.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoneyView)) as MoneyView);
          break;
        case 'isAboveMinimumOrder':
          result.isAboveMinimumOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'aboveMinimumOrder':
          result.aboveMinimumOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$BasketDTO extends BasketDTO {
  @override
  final BuiltList<BasketItemDTO> items;
  @override
  final MoneyView totalAmount;
  @override
  final bool isAboveMinimumOrder;
  @override
  final bool aboveMinimumOrder;

  factory _$BasketDTO([void Function(BasketDTOBuilder) updates]) =>
      (new BasketDTOBuilder()..update(updates)).build();

  _$BasketDTO._(
      {this.items,
      this.totalAmount,
      this.isAboveMinimumOrder,
      this.aboveMinimumOrder})
      : super._();

  @override
  BasketDTO rebuild(void Function(BasketDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BasketDTOBuilder toBuilder() => new BasketDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BasketDTO &&
        items == other.items &&
        totalAmount == other.totalAmount &&
        isAboveMinimumOrder == other.isAboveMinimumOrder &&
        aboveMinimumOrder == other.aboveMinimumOrder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, items.hashCode), totalAmount.hashCode),
            isAboveMinimumOrder.hashCode),
        aboveMinimumOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BasketDTO')
          ..add('items', items)
          ..add('totalAmount', totalAmount)
          ..add('isAboveMinimumOrder', isAboveMinimumOrder)
          ..add('aboveMinimumOrder', aboveMinimumOrder))
        .toString();
  }
}

class BasketDTOBuilder implements Builder<BasketDTO, BasketDTOBuilder> {
  _$BasketDTO _$v;

  ListBuilder<BasketItemDTO> _items;
  ListBuilder<BasketItemDTO> get items =>
      _$this._items ??= new ListBuilder<BasketItemDTO>();
  set items(ListBuilder<BasketItemDTO> items) => _$this._items = items;

  MoneyViewBuilder _totalAmount;
  MoneyViewBuilder get totalAmount =>
      _$this._totalAmount ??= new MoneyViewBuilder();
  set totalAmount(MoneyViewBuilder totalAmount) =>
      _$this._totalAmount = totalAmount;

  bool _isAboveMinimumOrder;
  bool get isAboveMinimumOrder => _$this._isAboveMinimumOrder;
  set isAboveMinimumOrder(bool isAboveMinimumOrder) =>
      _$this._isAboveMinimumOrder = isAboveMinimumOrder;

  bool _aboveMinimumOrder;
  bool get aboveMinimumOrder => _$this._aboveMinimumOrder;
  set aboveMinimumOrder(bool aboveMinimumOrder) =>
      _$this._aboveMinimumOrder = aboveMinimumOrder;

  BasketDTOBuilder();

  BasketDTOBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _totalAmount = _$v.totalAmount?.toBuilder();
      _isAboveMinimumOrder = _$v.isAboveMinimumOrder;
      _aboveMinimumOrder = _$v.aboveMinimumOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BasketDTO other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BasketDTO;
  }

  @override
  void update(void Function(BasketDTOBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BasketDTO build() {
    _$BasketDTO _$result;
    try {
      _$result = _$v ??
          new _$BasketDTO._(
              items: _items?.build(),
              totalAmount: _totalAmount?.build(),
              isAboveMinimumOrder: isAboveMinimumOrder,
              aboveMinimumOrder: aboveMinimumOrder);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
        _$failedField = 'totalAmount';
        _totalAmount?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BasketDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
