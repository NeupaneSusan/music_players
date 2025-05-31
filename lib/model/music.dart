class MusicModel {
  final String title;
  final String artist;
  final String image;
  final String path;

  MusicModel({required this.title, required this.artist, required this.image, required this.path});

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      title: json['title'],
      artist: json['artist'],
      image: json['image'],
      path: json['path'],
    );
  }
}