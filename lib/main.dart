import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'LoginIslemleri/ProfilEkrani.dart';
import 'LoginIslemleri/AnaSayfa.dart';
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
import 'package:provider/provider.dart' as flutter_provider;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_provider;

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
  await Supabase.initialize(
    url: 'https://tlxvnhmofwfovdyriuye.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRseHZuaG1vZndmb3ZkeXJpdXllIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUwNDc2MTEsImV4cCI6MjA2MDYyMzYxMX0._eElsZ2QLAy9_fm80xyNqM0BstFd6OqYlEAChcRMCgg',
  );
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*
    return MultiProvider(
      title: 'Drawer Routing Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const AnaSayfa(),
        '/profil': (context) => const ProfilEkrani(),
      },
    );
*/


    return MultiProvider(
      providers: [
        flutter_provider.Provider<GirisServis>(
          create: (_) => GirisServis(),
        ),
      ],
      child: MaterialApp(
        title: 'Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GirisModel(),
        //home: LoginScreen(),
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
