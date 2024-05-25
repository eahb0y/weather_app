class CurrentPlaceRequestEntity {
  final double lat;
  final double lon;
  final String key;
  final int limit;

  CurrentPlaceRequestEntity({
    required this.lat,
    required this.lon,
    required this.key,
    required this.limit,
  });
}
