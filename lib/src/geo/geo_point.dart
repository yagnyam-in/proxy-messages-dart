import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'geo_point.g.dart';

@JsonSerializable()
class GeoPoint extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final double latitude;

  @JsonKey(nullable: false)
  final double longitude;

  GeoPoint({
    @required this.latitude,
    @required this.longitude,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return latitude != null && longitude != null;
  }

  @override
  void assertValid() {
    assert(latitude != null);
    assert(longitude != null);
  }

  static GeoPoint fromJson(Map json) => _$GeoPointFromJson(json);

  Map<String, dynamic> toJson() => _$GeoPointToJson(this);
}
