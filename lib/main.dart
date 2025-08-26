import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ayarlar",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const SettingsHome(),
    );
  }
}

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  void _openSystemSetting(String action) {
    final intent = AndroidIntent(
      action: action,
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Ayarlar"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          // Samsung Account
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: const Text("Samsung Account"),
            subtitle: const Text("Giriş yapın"),
            onTap: () {},
          ),

          const Divider(),

          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ayarları ara",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          const Divider(),

          // 🔹 1. Grup
          SettingsGroup(title: "Bağlantılar", tiles: [
            SettingsTile("Wi-Fi", Icons.wifi, () => _openSystemSetting("android.settings.WIFI_SETTINGS")),
            SettingsTile("Bluetooth", Icons.bluetooth, () => _openSystemSetting("android.settings.BLUETOOTH_SETTINGS")),
            SettingsTile("Uçak Modu", Icons.flight, () => _openSystemSetting("android.settings.AIRPLANE_MODE_SETTINGS")),
            SettingsTile("Mobil Ağlar", Icons.network_cell, () => _openSystemSetting("android.settings.DATA_ROAMING_SETTINGS")),
          ]),

          // 🔹 2. Grup
          SettingsGroup(title: "Ses ve Titreşim", tiles: [
            SettingsTile("Ses", Icons.volume_up, () => _openSystemSetting("android.settings.SOUND_SETTINGS")),
            SettingsTile("Titreşim", Icons.vibration, () => _openSystemSetting("android.settings.SOUND_SETTINGS")),
          ]),

          // 🔹 3. Grup
          SettingsGroup(title: "Görüntü", tiles: [
            SettingsTile("Ekran", Icons.phone_android, () => _openSystemSetting("android.settings.DISPLAY_SETTINGS")),
            SettingsTile("Duvar Kağıdı", Icons.wallpaper, () => _openSystemSetting("android.settings.WALLPAPER_SETTINGS")),
            SettingsTile("Tema", Icons.color_lens, () {}),
          ]),

          // 🔹 4. Grup
          SettingsGroup(title: "Biyometrik ve Güvenlik", tiles: [
            SettingsTile("Parmak izi", Icons.fingerprint, () => _openSystemSetting("android.settings.SECURITY_SETTINGS")),
            SettingsTile("Yüz Tanıma", Icons.face, () {}),
            SettingsTile("Knox Güvenliği", Icons.shield, () {}),
          ]),

          // 🔹 5. Grup
          SettingsGroup(title: "Hesaplar", tiles: [
            SettingsTile("Google", Icons.account_circle, () => _openSystemSetting("android.settings.ADD_ACCOUNT_SETTINGS")),
            SettingsTile("Samsung Account", Icons.cloud, () {}),
          ]),

          // 🔹 6. Grup
          SettingsGroup(title: "Sistem", tiles: [
            SettingsTile("Dil ve Girdi", Icons.language, () => _openSystemSetting("android.settings.LOCALE_SETTINGS")),
            SettingsTile("Yedekleme", Icons.backup, () => _openSystemSetting("android.settings.BACKUP_AND_RESET_SETTINGS")),
            SettingsTile("Geliştirici Seçenekleri", Icons.code, () => _openSystemSetting("android.settings.APPLICATION_DEVELOPMENT_SETTINGS")),
            SettingsTile("Telefon Hakkında", Icons.info, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPhonePage()),
              );
            }),
          ]),
        ],
      ),
    );
  }
}

class SettingsGroup extends StatelessWidget {
  final String title;
  final List<SettingsTile> tiles;

  const SettingsGroup({super.key, required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ...tiles,
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsTile(this.title, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telefon Hakkında"),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text("Cihaz Adı"), subtitle: Text("Galaxy S25 Ultra")),
          ListTile(title: Text("Model Numarası"), subtitle: Text("SM-S928B")),
          ListTile(title: Text("One UI Sürümü"), subtitle: Text("8.0")),
          ListTile(title: Text("Android Sürümü"), subtitle: Text("16")),
          ListTile(title: Text("Knox Sürümü"), subtitle: Text("Knox 4.1")),
          ListTile(title: Text("Yapım Numarası"), subtitle: Text("QP1A.190711.020.S928BXXU1AWF1")),
        ],
      ),
    );
  }
}
