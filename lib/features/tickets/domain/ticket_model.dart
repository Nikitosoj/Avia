import 'package:equatable/equatable.dart';

class TicketModel extends Equatable {
  const TicketModel({
    required this.id,
    required this.badge,
    required this.value,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  final int id;
  final String badge;
  final int value;
  final String providerName;
  final String company;
  final TicketLocation departure;
  final TicketLocation arrival;
  final bool hasTransfer;
  final bool hasVisaTransfer;
  final TicketLuggage luggage;
  final TicketHandLuggage handLuggage;
  final bool isReturnable;
  final bool isExchangable;

  @override
  List<Object?> get props => [];

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as int? ?? 0,
      badge: json['badge'] as String? ?? '',
      value: json['price']['value'] as int? ?? 0,
      providerName: json['provider_name'] as String? ?? '',
      company: json['company'] as String? ?? '',
      departure: TicketLocation.fromJson(json['departure']),
      arrival: TicketLocation.fromJson(json['arrival']),
      hasTransfer: json['has_transfer'] as bool? ?? false,
      hasVisaTransfer: json['has_visa_transfer'] as bool? ?? false,
      luggage: TicketLuggage.fromJson(json['luggage']),
      handLuggage: TicketHandLuggage.fromJson(json['hand_luggage']),
      isReturnable: json['is_returnable'] as bool? ?? false,
      isExchangable: json['is_exchangable'] as bool? ?? false,
    );
  }
}

class TicketLocation extends Equatable {
  const TicketLocation({
    required this.town,
    required this.date,
    required this.airport,
  });

  final String town;
  final DateTime date;
  final String airport;

  @override
  List<Object?> get props => [];

  factory TicketLocation.fromJson(Map<String, dynamic> json) {
    return TicketLocation(
      town: json['town'] as String? ?? '',
      date: DateTime.parse(json['date'] as String? ?? ''),
      airport: json['airport'] as String? ?? '',
    );
  }
}

class TicketLuggage extends Equatable {
  const TicketLuggage({
    required this.hasLuggage,
    required this.value,
  });

  final bool hasLuggage;
  final int value;

  @override
  List<Object?> get props => [];

  factory TicketLuggage.fromJson(Map<String, dynamic> json) {
    return TicketLuggage(
      hasLuggage: json['has_luggage'] as bool? ?? false,
      value: json['value'] as int? ?? 0,
    );
  }
}

class TicketHandLuggage extends Equatable {
  const TicketHandLuggage({
    required this.hasHandLuggage,
    required this.size,
  });

  final bool hasHandLuggage;
  final String size;

  @override
  List<Object?> get props => [];

  factory TicketHandLuggage.fromJson(Map<String, dynamic> json) {
    return TicketHandLuggage(
      hasHandLuggage: json['has_hand_luggage'] as bool? ?? false,
      size: json['size'] as String? ?? '',
    );
  }
}
