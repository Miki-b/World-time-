import 'package:flutter/material.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data= {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments as Map? ?? {});
    print(data);
    String bgImage = data['isday'] ? 'day.jpeg' : 'night.jpeg';

    return Scaffold(
      backgroundColor: data['isday'] ? Colors.blue[200] : Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                    await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'url': result['url'],
                        'flag': result['flag'],
                        'isday': result['isday'], // Ensure to update this key as well
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: data['isday'] ? Colors.black : Colors.white,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: data['isday'] ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'] ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: data['isday'] ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  data['time'] ?? 'Unknown time',
                  style: TextStyle(
                    fontSize: 66.0,
                    color: data['isday'] ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}