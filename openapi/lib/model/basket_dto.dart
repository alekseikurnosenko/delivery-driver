            import 'package:built_collection/built_collection.dart';
            import 'package:openapi/model/basket_item_dto.dart';
            import 'package:openapi/model/money_view.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'basket_dto.g.dart';

abstract class BasketDTO implements Built<BasketDTO, BasketDTOBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'items')
    BuiltList<BasketItemDTO> get items;
    
        @nullable
    @BuiltValueField(wireName: r'totalAmount')
    MoneyView get totalAmount;
    
        @nullable
    @BuiltValueField(wireName: r'isAboveMinimumOrder')
    bool get isAboveMinimumOrder;
    
        @nullable
    @BuiltValueField(wireName: r'aboveMinimumOrder')
    bool get aboveMinimumOrder;

    // Boilerplate code needed to wire-up generated code
    BasketDTO._();

    factory BasketDTO([updates(BasketDTOBuilder b)]) = _$BasketDTO;
    static Serializer<BasketDTO> get serializer => _$basketDTOSerializer;

}

