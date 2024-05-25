import 'package:inhetited_test/features/home/domain/entity/current_place_response_entity.dart';

class GetCurrentPlaceModal {
  GetCurrentPlaceModal({
      this.name,
      this.country,});

  GetCurrentPlaceModal.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
  }
  String? name;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    return map;
  }
  CurrentPlaceResponseEntity toEntity(){
    return CurrentPlaceResponseEntity(
      name: name,
      country: country,
    );
  }
}