import 'package:equatable/equatable.dart';

class DirectModel extends Equatable {
  const DirectModel(this.id, this.title, this.value, this.timeRange);

  @override
  List<Object?> get props => [];

  final int id;
  final String title;
  final int value;
  final List<String> timeRange;
  factory DirectModel.fromJson(Map<String, dynamic> json) {
    return DirectModel(
      json['id'] as int? ?? 0,
      json['title'] as String? ?? '',
      json['price']['value'] as int? ?? 0,
      List<String>.from(json['time_range'] ?? []),
    );
  }
}
