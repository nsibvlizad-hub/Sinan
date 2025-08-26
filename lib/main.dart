import 'package:flutter/material.dart';

void main() {
  runApp(const FakeSettingsApp());
}

class FakeSettingsApp extends StatelessWidget {
  const FakeSettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Settings',
      home: SettingsHome(),
    );
  }
}

class SettingsHome extends StatelessWidget {
  final List<String> menus = [
    "Bağlantılar",
    "Ses",
    "Bildirimler",
    "Ekran",
    "Duvar Kağıdı",
    "Gelişmiş Özellikler",
    "Dijital Sağlık",
    "Güvenlik",
    "Gizlilik",
    "Hesaplar",
    "Yedekleme",
    "Google",
    "Erişilebilirlik",
    "Genel Yönetim",
    "Yazılım Güncelleme",
    "Cihaz Hakkında"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final item = menus[index];
          return ListTile(
            title: Text(item),
            onTap: () {
              if (item == "Cihaz Hakkında") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPhonePage()),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cihaz Hakkında")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Model Numarası"),
            subtitle: Text("SM-G998B"),
          ),
          ListTile(
            title: Text("Android Sürümü"),
            subtitle: Text("16"),
          ),
          ListTile(
            title: Text("One UI Sürümü"),
            subtitle: Text("8.0"),
          ),
          ListTile(
            title: Text("Yapım Numarası"),
            subtitle: Text("FAKE123456"),
          ),
        ],
      ),
    );
  }
}
