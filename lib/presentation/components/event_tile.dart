import 'package:flutter/material.dart';
import 'package:katim_task/data/data_model.dart';
import 'package:katim_task/presentation/screens/event_details_page.dart';

class EventTile extends StatelessWidget {
  final Events events;

  EventTile({required this.events});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: events.id,
              child:ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.network(events.performers[0].images[0].image, fit: BoxFit.cover),
                ),
              ),
            ),
            title: Text('${events.title}'),
            subtitle: Text(events.venue[0].state+ ", "+events.venue[0].country),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventDetailsPage(events: events)));
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
