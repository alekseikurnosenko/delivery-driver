            import 'package:openapi/model/address.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'profile.g.dart';

abstract class Profile implements Built<Profile, ProfileBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'id')
    String get id;
    
        @nullable
    @BuiltValueField(wireName: r'userId')
    String get userId;
    
        @nullable
    @BuiltValueField(wireName: r'deliveryAddress')
    Address get deliveryAddress;
    
        @nullable
    @BuiltValueField(wireName: r'paymentMethodId')
    String get paymentMethodId;

    // Boilerplate code needed to wire-up generated code
    Profile._();

    factory Profile([updates(ProfileBuilder b)]) = _$Profile;
    static Serializer<Profile> get serializer => _$profileSerializer;

}

