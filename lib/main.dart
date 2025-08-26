import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ayarlar",
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const SettingsHome(),
    );
  }
}

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  // Sistem ayarlarını açan fonksiyon
  Future<void> _openSystem(String action) async {
    final uri = Uri(scheme: 'android', host: 'settings', path: action);
    if (!await launchUrl(uri)) {
      debugPrint("❌ Açılamadı: $action");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<SettingsGroup> groups = [
      SettingsGroup("Bağlantılar", [
        SettingsItem("Wi-Fi", Icons.wifi, () => _openSystem("wifi")),
        SettingsItem("Bluetooth", Icons.bluetooth, () => _openSystem("bluetooth")),
        SettingsItem("Uçak Modu", Icons.airplanemode_active, () => _openSystem("airplane_mode")),
        SettingsItem("Mobil Ağlar", Icons.network_cell, () => _openSystem("network")),
      ]),
      SettingsGroup("Ses & Görüntü", [
        SettingsItem("Ses", Icons.volume_up, () => _openSystem("sound")),
        SettingsItem("Titreşim", Icons.vibration, () => _openSystem("sound")),
        SettingsItem("Bildirimler", Icons.notifications, () => _openSystem("app_notification")),
        SettingsItem("Ekran", Icons.display_settings, () => _openSystem("display")),
        SettingsItem("Duvar Kağıdı", Icons.wallpaper, () => _openSystem("wallpaper")),
        SettingsItem("Karanlık Mod", Icons.dark_mode, () => _openSystem("display")),
      ]),
      SettingsGroup("Cihaz", [
        SettingsItem("Pil", Icons.battery_full, () => _openSystem("battery")),
        SettingsItem("Depolama", Icons.sd_storage, () => _openSystem("internal_storage")),
        SettingsItem("Uygulamalar", Icons.apps, () => _openSystem("applications")),
        SettingsItem("Güvenlik", Icons.security, () => _openSystem("security")),
        SettingsItem("Konum", Icons.location_on, () => _openSystem("location")),
        SettingsItem("Biyometrik & Parmak İzi", Icons.fingerprint, () => _openSystem("fingerprint")),
        SettingsItem("Erişilebilirlik", Icons.accessibility, () => _openSystem("accessibility")),
      ]),
      SettingsGroup("Hesaplar & Yedekleme", [
        SettingsItem("Google", FontAwesomeIcons.google, () => _openSystem("account")),
        SettingsItem("Samsung Account", FontAwesomeIcons.user, () {}),
        SettingsItem("Yedekleme", Icons.backup, () => _openSystem("backup")),
        SettingsItem("Dil ve Girdi", Icons.language, () => _openSystem("locale")),
      ]),
      SettingsGroup("Sistem", [
        SettingsItem("Tarih & Saat", Icons.access_time, () => _openSystem("date")),
        SettingsItem("Geliştirici Seçenekleri", Icons.developer_mode, () => _openSystem("development")),
        SettingsItem("Yazılım Güncelleme", Icons.system_update, () => _openSystem("software_update")),
        SettingsItem("Telefon Hakkında", Icons.info, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AboutPhonePage()),
          );
        }),
      ]),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // 🔹 Samsung Account + Arama Çubuğu
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text("Samsung Account"),
              subtitle: const Text("Oturum açın"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: "Ara",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Gruplar
          for (var group in groups) ...[
            Text(group.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  for (int i = 0; i < group.items.length; i++) ...[
                    ListTile(
                      leading: Icon(group.items[i].icon),
                      title: Text(group.items[i].title),
                      onTap: group.items[i].onTap,
                    ),
                    if (i < group.items.length - 1) const Divider(height: 1),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class SettingsGroup {
  final String title;
  final List<SettingsItem> items;
  SettingsGroup(this.title, this.items);
}

class SettingsItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  SettingsItem(this.title, this.icon, this.onTap);
}

class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telefon Hakkında")),
      body: ListView(
        children: const [
          ListTile(title: Text("Cihaz Adı"), subtitle: Text("Galaxy S25 Ultra")),
          ListTile(title: Text("Model Numarası"), subtitle: Text("SM-S925F")),
          ListTile(title: Text("Android Sürümü"), subtitle: Text("16")),
          ListTile(title: Text("One UI Sürümü"), subtitle: Text("8.0")),
          ListTile(title: Text("Knox Sürümü"), subtitle: Text("4.0")),
          ListTile(title: Text("Yapım Numarası"), subtitle: Text("U12345.ABC.DEF")),
        ],
      ),
    );
  }
}
