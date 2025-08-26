import 'package:flutter/material.dart';

void main() {
  runApp(const MySettingsApp());
}

class MySettingsApp extends StatelessWidget {
  const MySettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Samsung Account
          Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("Samsung Account"),
              subtitle: const Text("Oturum açın veya hesabınızı yönetin"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),

          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Ayarlar ara",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const Divider(),

          // Kategoriler
          ..._settingsCategories.map((cat) => ListTile(
                leading: Icon(cat["icon"] as IconData, color: Colors.blue),
                title: Text(cat["title"] as String),
                subtitle: Text(cat["subtitle"] as String),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  if (cat["title"] == "Telefon hakkında") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AboutPhonePage(),
                      ),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}

// Telefon Hakkında Sayfası
class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telefon hakkında")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Cihaz Adı"),
            subtitle: Text("Galaxy S25 Ultra"),
          ),
          ListTile(
            title: Text("Model numarası"),
            subtitle: Text("SM-S928B/DS"),
          ),
          ListTile(
            title: Text("Android sürümü"),
            subtitle: Text("16"),
          ),
          ListTile(
            title: Text("One UI sürümü"),
            subtitle: Text("8.0"),
          ),
          ListTile(
            title: Text("Knox sürümü"),
            subtitle: Text("3.10"),
          ),
          ListTile(
            title: Text("Çekirdek sürümü"),
            subtitle: Text("5.15.89-g1234567"),
          ),
          ListTile(
            title: Text("Yapım numarası"),
            subtitle: Text("UP1A.240905.001 test-keys"),
          ),
        ],
      ),
    );
  }
}

// Kategoriler Listesi
final List<Map<String, Object>> _settingsCategories = [
  {"icon": Icons.wifi, "title": "Bağlantılar", "subtitle": "Wi-Fi • Bluetooth • Uçak modu"},
  {"icon": Icons.speaker, "title": "Ses ve titreşim", "subtitle": "Ses modu ve zil sesi"},
  {"icon": Icons.notifications, "title": "Bildirimler", "subtitle": "Uygulama bildirimleri"},
  {"icon": Icons.palette, "title": "Görüntüleme", "subtitle": "Parlaklık, ekran modu, göz rahatlığı"},
  {"icon": Icons.lock, "title": "Güvenlik ve gizlilik", "subtitle": "Ekran kilidi, biyometri"},
  {"icon": Icons.apps, "title": "Uygulamalar", "subtitle": "Varsayılan uygulamalar"},
  {"icon": Icons.battery_full, "title": "Pil ve cihaz bakımı", "subtitle": "Pil, depolama, RAM"},
  {"icon": Icons.language, "title": "Genel yönetim", "subtitle": "Dil, tarih ve saat"},
  {"icon": Icons.accessibility, "title": "Erişilebilirlik", "subtitle": "Görme, işitme, etkileşim"},
  {"icon": Icons.account_circle, "title": "Hesaplar ve yedekleme", "subtitle": "Samsung Cloud, Smart Switch"},
  {"icon": Icons.security, "title": "Biometrik ve güvenlik", "subtitle": "Yüz tanıma, parmak izi"},
  {"icon": Icons.lock_outline, "title": "Parola ve güvenlik", "subtitle": "Şifre ve PIN"},
  {"icon": Icons.cloud, "title": "Google", "subtitle": "Google hizmetleri ve ayarları"},
  {"icon": Icons.child_care, "title": "Dijital sağlık", "subtitle": "Ekran süresi, cihaz kullanımı"},
  {"icon": Icons.update, "title": "Yazılım güncellemesi", "subtitle": "Son güncellemeleri kontrol et"},
  {"icon": Icons.help, "title": "Kılavuz ve destek", "subtitle": "Yardım ve ipuçları"},
  {"icon": Icons.phone_android, "title": "Telefon hakkında", "subtitle": "Durum, cihaz bilgileri"},
];
