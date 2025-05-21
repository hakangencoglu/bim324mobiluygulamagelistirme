import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginIslemleri/GirisModel.dart';
import 'LoginIslemleri/GirisServis.dart';
import 'LoginIslemleri/firebase_options.dart';
import 'Notlar.dart';
import 'NotlarArayuz.dart';
import 'SharedPrefer.dart';
import 'H4StatefulWidget.dart';
import 'OgrenciListesi.dart';
import 'SayfaBir.dart';
import 'SayfaIki.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPrefer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'Deneme2.dart';

//import 'Deneme.dart';

/*void main() {
  runApp(const MyApp());
}

// Uygulama
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GirisServis>(
          create: (_) => GirisServis(),
        ),
      ],
      child: MaterialApp(
        title: 'Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GirisModel(),
      ),
    );
  }
}
/*
class _MyAppState extends State<MyApp> {
//class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  // This widget is the root of your application.

  //shared preferences örneği için
  bool _karanlikMod = false; // Varsayılan olarak tema açık (light)

  @override
  void initState() {
    super.initState();
    _karanlikModuYukle(); // Başlangıçta shared_preferences'tan tema durumunu al
  }
  // shared_preferences'tan karanlık mod bilgisini alır
  void _karanlikModuYukle() async {
    final prefs = await SharedPreferences.getInstance(); // prefs örneği al
    setState(() {
      _karanlikMod = prefs.getBool('karanlikMod') ?? false; // kayıtlı değilse false
    });
  }

  // shared_preferences'a yeni karanlık mod bilgisini yazar
  void _karanlikModuDegistir(bool yeniDeger) async {
    final prefs = await SharedPreferences.getInstance(); // prefs al
    await prefs.setBool('karanlikMod', yeniDeger); // yeni değeri yaz
    setState(() {
      _karanlikMod = yeniDeger; // ekranı güncelle
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo', // uygulama başlığı
      theme: ThemeData(
        brightness: _karanlikMod ? Brightness.dark : Brightness.light, // tema seçimi
      ),
      //title: 'Flutter Demo',
      /*
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      */
      //home: Deneme(),
      //home: const MyHomePage(title: 'Ana sayfa'),
      //home: Deneme2(),
      //home: H4StatelessWidget(),
      //home: H4StatefulWidget(),
      //home: SayfaBir(),

      initialRoute: '/notlar',
      routes: {
        '/': (context) => SayfaBir(),
        '/iki': (context) => SayfaIki(),
        '/ogrenciListesi': (context) => OgrenciListesi(),
        '/shared': (context) => SharedPrefer(
          karanlikMod: _karanlikMod, // alt widget'a tema bilgisi gönder
          onTemaDegisti: _karanlikModuDegistir, // tema değişim fonksiyonu
        ),
        '/notlar': (context) => NotelarArayuz(),

      },

    );
  }
}
*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(


      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/