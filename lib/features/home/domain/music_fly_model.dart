import 'package:equatable/equatable.dart';

class MusicFlyModel extends Equatable {
  const MusicFlyModel(this.id, this.title, this.town, this.value);

  @override
  List<Object?> get props => [];

  final int id;
  final String title;
  final String town;
  final int value;
  factory MusicFlyModel.fromJson(Map<String, dynamic> json) {
    return MusicFlyModel(
      json['id'] as int? ?? 0,
      json['title'] as String? ?? '',
      json['town'] as String? ?? '',
      json['price']['value'] as int? ?? 0,
    );
  }
}

class MusicFlyModelList {
  final List<MusicFlyModel> music;

  MusicFlyModelList({required this.music});

  factory MusicFlyModelList.fromJson(Map<String, dynamic> json) {
    List<dynamic> offersJson = json['offers'];
    List<MusicFlyModel> musicFlyModels =
        offersJson.map((offer) => MusicFlyModel.fromJson(offer)).toList();
    return MusicFlyModelList(music: musicFlyModels);
  }
}
