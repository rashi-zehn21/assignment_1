class Training {
  final String Training_name;
  final String images;
  final double rating;
  final String totalTime;

  Training(
      {required this.Training_name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Training.fromJson(dynamic json) {
    return Training(
        Training_name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Training> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Training.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $Training_name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
