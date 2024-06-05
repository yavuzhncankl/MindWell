import 'package:flutter/material.dart';
import 'package:mindwell/authentication/login.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class ProfilePage2 extends StatelessWidget {
  const ProfilePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Sayfası',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _ad = "Ahmet";
  final String _soyad = "Yılmaz";
  final String _kullaniciAdi = "@ahmetyilmaz";
  final int _yas = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1(),
      bottomNavigationBar: bottomBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _profilResmi(),
            const SizedBox(height: 20),
            _kisiBilgileri(),
            const SizedBox(height: 100),
            _cikisYapButonu(),
          ],
        ),
      ),
    );
  }

  Widget _profilResmi() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/logo.png'),
    );
  }

  Widget _kisiBilgileri() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '$_ad $_soyad',
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(_kullaniciAdi, style: const TextStyle(fontSize: 30)),
        const SizedBox(
          height: 20,
        ),
        Text('$_yas yaşında', style: const TextStyle(fontSize: 30)),
      ],
    );
  }

  Widget _cikisYapButonu() {
    return ElevatedButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginPage())),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.black,
          fixedSize: const Size(200, 20)),
      child: const Center(child: Text('Sign Out')),
    );
  }
}
