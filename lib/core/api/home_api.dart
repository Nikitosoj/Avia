import 'dart:convert';
import 'dart:io';

import 'package:avia/features/home/domain/music_fly_model.dart';
import 'package:avia/features/tickets/domain/ticket_model.dart';

import 'package:http/http.dart' as http;

import '../../features/search/domain/direct_model.dart';

Future<MusicFlyModelList> fetchMusic(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(response.body);
      if (jsonData != null) {
        return MusicFlyModelList.fromJson(jsonData);
      } else {
        throw const FormatException('Invalid JSON data');
      }
    } else {
      throw HttpException('Failed to load data', uri: Uri.parse(url));
    }
  } catch (e) {
    throw Exception('Failed to fetch data ${e.toString()}');
  }
}

Future<List<DirectModel>> fetchDirect(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> jsonData =
          json.decode(response.body)['tickets_offers'];

      return jsonData
          .map((jsonItem) => DirectModel.fromJson(jsonItem))
          .toList();
    } else {
      throw HttpException('Failed to load data', uri: Uri.parse(url));
    }
  } catch (e) {
    throw Exception('Failed to fetch data ${e.toString()}');
  }
}

Future<List<TicketModel>> fetchTickets(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> jsonData = json.decode(response.body)['tickets'];
      return jsonData
          .map((jsonItem) => TicketModel.fromJson(jsonItem))
          .toList();
    } else {
      throw HttpException('Failed to load data', uri: Uri.parse(url));
    }
  } catch (e) {
    throw Exception('Failed to fetch data ${e.toString()}');
  }
}
