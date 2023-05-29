import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:katim_task/data/data_model.dart';

final String prefix = "https://api.seatgeek.com/2/events?client_id=";
final String clientID = "MzM3MDg4Nzl8MTY4NDE1NjEyOC42MjEwNDky&q=";

List<Events> parseUser(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var events = list.map((e) => Events.fromJson(e)).toList();
  return events;
}

Future<List<Events>> fetchEvents(String searchText) async{
  String url = prefix+clientID+searchText;
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseUser,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
