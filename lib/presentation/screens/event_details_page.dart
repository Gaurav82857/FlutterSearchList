import 'package:flutter/material.dart';
import 'package:katim_task/data/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatelessWidget {

  final Events events;

  EventDetailsPage({required this.events});

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${events.title}'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Hero(
                tag: events.id,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.network(events.performers[0].images[0].image, fit: BoxFit.cover),
                  ),
                )
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              '${events.announce_date}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              '${events.venue[0].state+ ", "+events.venue[0].country}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
