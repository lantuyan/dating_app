import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String placeId;
  final String name;
  final num lat;
  final num lon;

  const Location({
    this.placeId = '',
    this.name = '',
    required this.lat,
    required this.lon,
  });

  static const initialLocation = Location(lat: 0, lon: 0);

  Location copyWith({
    String? placeId,
    String? name,
    num? lat,
    num? lon,
  }) {
    return Location(
      placeId: placeId ?? this.placeId,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  List<Object?> get props => [placeId, name, lat, lon];

  factory Location.fromJson(Map<String, dynamic> json) {
    if (json.keys.contains('place_id')) {
      return Location(
        placeId: json['place_id'] as String,
        name: json['name'] as String,
        lat: json['geometry']['location']['lat'] as num,
        lon: json['geometry']['location']['lng'] as num,
      );
    } else {
      return Location(
        placeId: json['placeId'] as String,
        name: json['name']  as String,
        lat: json['lat'] as num,
        lon: json['lon'] as num,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'placeId': placeId,
      'name': name,
      'lat': lat,
      'lon': lon,
    };
  }
}
