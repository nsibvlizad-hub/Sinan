import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SettingsCloneApp());
}

class SettingsCloneApp extends StatelessWidget {
  const SettingsCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ayarlar",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SettingsHomePage(),
    );
  }
}

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  Future<void> _openSystem(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsGroups = [
      {
        "title": "Bağlantılar",
        "items": [
          {
            "icon": Icons.wifi,
            "title": "Wi-Fi",
            "subtitle": "Ağlara bağlanın",
            "url": "android.settings.WIFI_SETTINGS"
          },
          {
            "icon": Icons.bluetooth,
            "title": "Bluetooth",
            "subtitle": "Cihazlara bağlanın",
            "url": "android.settings.BLUETOOTH_SETTINGS"
          },
          {
            "icon": Icons.sim_card,
            "title": "SIM Kart ve Mobil Ağlar",
            "subtitle": "Operatör ayarları",
            "url": "android.settings.DATA_ROAMING_SETTINGS"
          },
        ]
      },
      {
        "title": "Cihaz",
        "items": [
          {
            "icon": Icons.notifications,
            "title": "Bildirimler",
            "subtitle": "Bildirim tercihleri",
            "url": "android.settings.NOTIFICATION_SETTINGS"
          },
          {
            "icon": Icons.volume_up,
            "title": "Ses ve Titreşim",
            "subtitle": "Zil, medya ve sistem sesleri",
            "url": "android.settings.SOUND_SETTINGS"
          },
          {
            "icon": Icons.display_settings,
            "title": "Ekran",
            "subtitle": "Parlaklık, karanlık mod",
            "url": "android.settings.DISPLAY_SETTINGS"
          },
        ]
      },
      {
        "title": "Kişisel",
        "items": [
          {
            "icon": Icons.lock,
            "title": "Güvenlik",
            "subtitle": "Parola, biyometrik veriler",
            "url": "android.settings.SECURITY_SETTINGS"
          },
          {
            "icon": Icons.privacy_tip,
            "title": "Gizlilik",
            "subtitle": "Uygulama izinleri",
            "url": "android.settings.PRIVACY_SETTINGS"
          },
          {
            "icon": Icons.language,
            "title": "Genel Yönetim",
            "subtitle": "Dil, klavye, tarih & saat",
            "url": "android.settings.LOCALE_SETTINGS"
          },
        ]
      },
      {
        "title": "Diğer",
        "items": [
          {
            "icon": Icons.battery_full,
            "title": "Pil",
            "subtitle": "Pil kullanımı ve optimizasyon",
            "url": "android.settings.BATTERY_SAVER_SETTINGS"
          },
          {
            "icon": Icons.storage,
            "title": "Depolama",
            "subtitle": "Kullanılan alanı kontrol et",
            "url": "android.settings.INTERNAL_STORAGE_SETTINGS"
          },
          {
            "icon": Icons.system_update,
            "title": "Yazılım Güncellemesi",
            "subtitle": "Android sürümü ve güncellemeler",
            "url": "android.settings.SYSTEM_UPDATE_SETTINGS"
          },
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Arama kutusu
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ayarları ara",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Samsung Account Kartı
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Samsung Account"),
                subtitle: Text("Oturum açın, verilerinizi senkronize edin"),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Gruplar
          for (var group in settingsGroups) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(group["title"] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                children: [
                  for (var i = 0; i < (group["items"] as List).length; i++) ...[
                    ListTile(
                      leading: Icon((group["items"] as List)[i]["icon"] as IconData),
                      title: Text((group["items"] as List)[i]["title"]),
                      subtitle: Text((group["items"] as List)[i]["subtitle"]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        final url =
                            "android-app://${(group["items"] as List)[i]["url"]}";
                        _openSystem(url);
                      },
                    ),
                    if (i != (group["items"] as List).length - 1)
                      const Divider(indent: 70, height: 0),
                  ]
                ],
              ),
            )
          ],

          const SizedBox(height: 20),

          // Telefon Hakkında
          Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.blue),
                title: const Text("Telefon Hakkında"),
                subtitle: const Text("Model: OneUI 8 • Android
