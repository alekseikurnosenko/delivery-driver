            import 'package:openapi/model/dish.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'basket_item_dto.g.dart';

abstract class BasketItemDTO implements Built<BasketItemDTO, BasketItemDTOBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'dish')
    Dish get dish;
    
        @nullable
    @BuiltValueField(wireName: r'quantity')
    int get quantity;

    // Boilerplate code needed to wire-up generated code
    BasketItemDTO._();

    factory BasketItemDTO([updates(BasketItemDTOBuilder b)]) = _$BasketItemDTO;
    static Serializer<BasketItemDTO> get serializer => _$basketItemDTOSerializer;

}

