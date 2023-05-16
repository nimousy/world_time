import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  final WorldTime worldTime;
  const Home({required this.worldTime, Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime worldTime = WorldTime(
    location: 'Berlin',
    flag: 'germany.png',
    url: 'Europe/Berlin',
  );

  @override
  void initState() {
    worldTime = widget.worldTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String bgImage = worldTime.isDaytime ?? true ? 'day.png' : 'night.png';
    Color bgcolor = worldTime.isDaytime ?? true ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseLocation(
                        updateWorldTime: (WorldTime newWorldTime) async {
                          worldTime = newWorldTime;
                          await worldTime.getTime();
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // data['location']
                    worldTime.location,
                    // }
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                worldTime.time ?? '',
                style: const TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


