import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';


class choose_location extends StatefulWidget {
  const choose_location({super.key} );

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Addis_Ababa', location: 'Addis Ababa', flag: 'img.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void settime(index) async{
      worldTime w1 = locations[index];
      await w1.getTime();

      Navigator.pop(context,{
        'time':w1.time,
        'location':w1.location,
        'flag':w1.flag,
        'isday':w1.isday
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Your Location ',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(
           itemCount: locations.length,
          itemBuilder: (context,index) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
               child: Card(
                 child: ListTile(
                   onTap: () {
                     settime(index);
                   },
                   title: Text(locations[index].location),
                   leading: CircleAvatar(
                     backgroundImage: AssetImage('assets/${locations[index].flag}'),
                   )
                 ),
               ),
             );
          },
      ),
    );
  }
}
