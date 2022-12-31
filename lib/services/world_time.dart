import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  final String location; //location name for the UI
  String? time; //the time in that location
  final String flag; //url to an asset flag icon
  final String url; //location url for api endpoints
  bool? isDaytime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now =  now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 4 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'Could not get time data';
    }

  }

}


