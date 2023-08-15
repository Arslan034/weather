import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
        home: Scaffold(
            appBar: AppBar(
      title: const Text(
        'Weather',
      style: TextStyle(color: Colors.black87,),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){},),
      iconTheme: const IconThemeData(color: Colors.black54),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.settings), onPressed: () {},),
      ],
            ),
      body: buildBody(),
        ),
  );
}
}


Widget buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget> [
      headerImage(),
      SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
          weahterDescription(),
          const Divider(),
          temperature(),
          const Divider(),
          temperatureForecast(), 
          const Divider(),
          footerRatings(),
        ],
        ),
        ),
        ),
    ],
    ),
  );
}


Image headerImage() {
  return const Image(
    image: NetworkImage('https://www.novascotia.com/sites/default/files/2022-09/Rainbow_Skyline-Trail-1920x1080.jpg'),
    fit: BoxFit.cover,
  );
}


Column weahterDescription(){
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text('Tuesday - august 15',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      ),
      Divider(),
      Text('Погода в Алматы ожидается пасмурная с небольшим дождём и прохладная. Вероятность осадков 66%. Атмосферное давление в пределах нормы (690—692 мм рт.ст.). Температура воздуха +14...+18°C. Ветер слабый (0—1 м/с). Относительная влажность 56—69%.',
      style:TextStyle(color: Colors.black54,),
      ),
    ],
    ); 
} 


Row temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
    Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Icon(
          Icons.wb_sunny, color:Colors.yellow,
        ),
      ],
    ),
      SizedBox(width: 16,),
        Column(
          children: <Widget>[
          Row(
            children: <Widget>[
              Text(
              '18°C Cloudy',
              style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
              'Almaty',
              style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
        ),
  ],
  );
}


Wrap temperatureForecast(){
  return Wrap(
    spacing: 10,
    children:
      List.generate(8, (int index){
      return Chip(
        label: Text(
          '${index+20}°C',
          style: TextStyle(fontSize: 15),
        ),
        avatar: const Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey),
      ),
      backgroundColor: Colors.grey.shade100,
      );
      }),
  );
}


Row footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    Icon(Icons.star, size: 15, color:Colors.yellow[500],),
    Icon(Icons.star, size: 15, color:Colors.yellow[500],),
    Icon(Icons.star, size: 15, color:Colors.yellow[500],),
    Icon(Icons.star, size: 15, color:Colors.yellow[500],),
    Icon(Icons.star, size: 15, color:Colors.grey[500],),
  ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      const Text('Info with openweathermap.org',
      style:TextStyle(fontSize: 15),
      ),
      stars,
    ],
    );
}