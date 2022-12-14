class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  get getLat => lat ?? '';
  get getLng => lng ?? '';

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
