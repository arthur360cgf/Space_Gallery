class ApodModel {
  ApodModel({
    required this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    this.copyright,
  });

  DateTime date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;
  String? copyright;

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"] ?? "",
        hdurl: json["hdurl"] ?? "",
        mediaType: json["media_type"] ?? "",
        serviceVersion: json["service_version"] ?? "",
        title: json["title"] ?? "",
        url: (json["url"] as String).contains('.jpg')
            ? json["url"]
            : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
        copyright: json["copyright"] ?? "",
      );
}
