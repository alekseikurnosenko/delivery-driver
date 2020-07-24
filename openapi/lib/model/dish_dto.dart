            import 'package:openapi/model/money_view.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dish_dto.g.dart';

abstract class DishDTO implements Built<DishDTO, DishDTOBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'id')
    String get id;
    
        @nullable
    @BuiltValueField(wireName: r'name')
    String get name;
    
        @nullable
    @BuiltValueField(wireName: r'price')
    MoneyView get price;

    // Boilerplate code needed to wire-up generated code
    DishDTO._();

    factory DishDTO([updates(DishDTOBuilder b)]) = _$DishDTO;
    static Serializer<DishDTO> get serializer => _$dishDTOSerializer;

}

