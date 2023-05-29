import 'package:flutter/material.dart';
import 'package:katim_task/data/data_model.dart';
import 'package:katim_task/domain/repository.dart';
import 'package:katim_task/presentation/components/event_tile.dart';
import 'package:animated_search_bar/animated_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Events> _events = <Events>[];
  List<Events> _eventsDisplay = <Events>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events List'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
                return index == 0 ? _searchBar() : EventTile(events: this._eventsDisplay[index - 1]);
            },
            itemCount: _eventsDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child:AnimatedSearchBar(
        label: "Enter event to search..",
        onChanged: (searchText) {
          fetchEvents(searchText).then((value) {
            setState(() {
              _events.addAll(value);
              _eventsDisplay = _events;
              print(_eventsDisplay.length);
            });
          });
        },
      ),
    );
  }
}
