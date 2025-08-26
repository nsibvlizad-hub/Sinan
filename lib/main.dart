import 'package:flutter/material.dart';

void main() {
  runApp(const MySettingsApp());
}

class MySettingsApp extends StatelessWidget {
  const MySettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayarlar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SettingsHomePage(),
    );
  }
}

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "icon": Icons.wifi,
        "title": "Bağlantılar",
        "subtitle": "Wi-Fi • Bluetooth • Mobil veri"
      },
      {
        "icon": Icons.volume_up,
        "title": "Ses ve titreşim",
        "subtitle": "Ses modu • Zil sesi • Ses seviyesi"
      },
      {
        "icon": Icons.display_settings,
        "title": "Ekran",
        "subtitle": "Parlaklık • Göz konforu • Ekran süresi"
      },
      {
        "icon": Icons.lock,
        "title": "Güvenlik ve gizlilik",
        "subtitle": "Ekran kilidi • Güvenli klasör • İzinler"
      },
      {
        "icon": Icons.account_circle,
        "title": "Samsung account",
        "subtitle": "Oturum aç • Hesabını yönet"
      },
      {
        "icon": Icons.info,
        "title": "Telefon hakkında",
        "subtitle": "Durum bilgileri • Android sürümü"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ayarları ara",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var cat = categories[index];
                return ListTile(
                  leading: Icon(cat["icon"] as IconData),
                  title: Text(cat["title"] as String),
                  subtitle: Text(cat["subtitle"] as String),
                  onTap: () {
                    if (cat["title"] == "Telefon hakkında") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPhonePage(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final info = {
      "Cihaz adı": "Galaxy S23 Ultra (Fake)",
      "Model numarası": "SM-G998B",
      "Android sürümü": "16",
      "One UI sürümü": "8.0",
      "Knox sürümü": "3.10",
      "Çekirdek sürümü": "5.15.89-gabcdef",
      "Yapım numarası": "QPR1.240905.001 test-keys",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Telefon hakkında")),
      body: ListView(
        children: info.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            subtitle: Text(e.value),
          );
        }).toList(),
      ),
    );
  }
}
