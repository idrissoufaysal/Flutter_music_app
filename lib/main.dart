import 'package:flutter/material.dart';
import 'musique.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coda Musique',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Maitre gims'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Musique> maListeDeMusiques = [
     Musique(
        titre: 'Theme Swift',
        artist: 'Maitre gims',
        imagePath: 'assets/un.jpg',
        urlSong: 'https://codabee.com/wp-content/uploads/2018/06/un.mp3'),
     Musique(
        titre: 'Theme Swift',
        artist: 'Dadju',
        imagePath: 'assets/deux.jpg',
        urlSong: 'https://codabee.com/wp-content/uploads/2018/06/deux.mp3')
  ];
  late Musique maMusiqueActuel;
  late AudioPlayer audioPlayer; 
  double position=0.0;
  @override
  void initState() {
    super.initState();
    maMusiqueActuel = maListeDeMusiques[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),

      backgroundColor: Colors.grey[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 9.0,
              child: Container(
                width: MediaQuery.of(context).size.height / 2.5,
                child: Image.asset(maMusiqueActuel.imagePath),
              ),
            ),
            textAvecStyle(maMusiqueActuel.titre, 1.5),
            textAvecStyle(maMusiqueActuel.artist, 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                boutton(Icons.fast_rewind, 30.0, ActionMusic.rewind),
                boutton(Icons.play_arrow, 30, ActionMusic.play),
                boutton(Icons.fast_forward, 30, ActionMusic.forward),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [textAvecStyle('0:0', 0.8), textAvecStyle('0:22', 0.8)],
            ),
           Slider(value: position,
           min:0.0,
           max:30.0
           ,
          inactiveColor: Colors.white,
          activeColor: Colors.green,
            onChanged: (double d){
              setState(() {
                position = d;
              });
            })
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
IconButton boutton(IconData icone,double taille,ActionMusic action){
  return IconButton(
    iconSize: taille,
    color: Colors.white,
    icon: Icon(icone), 
    onPressed: (){
      switch(action){
        case ActionMusic.play:
        print('play');
        break;
        case ActionMusic.pause:
        print('pause');
        break;
        case ActionMusic.forward:
        print('forward');
        case ActionMusic.rewind:
        print('rewind');
        break;


      }
    },

  );
}

  Text textAvecStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
    );
  }
}

enum ActionMusic{
  play,
  pause,
  rewind,
  forward,
}