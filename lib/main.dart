import 'package:flutter/material.dart';
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
      title: 'Ayarlar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SettingsHome(),
    );
  }
}

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  Future<void> _openSystemSettings() async {
    const url = 'package:com.android.settings';
    try {
      await launchUrl(Uri.parse('android-app://$url'));
    } catch (e) {
      debugPrint("Sistem ayarları açılamadı: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": Icons.wifi, "title": "Bağlantılar", "desc": "Wi-Fi • Bluetooth • Uçak modu"},
      {"icon": Icons.speaker, "title": "Ses ve titreşim", "desc": "Ses modu • Zil sesi • Ses seviyesi"},
      {"icon": Icons.notifications, "title": "Bildirimler", "desc": "Bildirim geçmişi • Baloncuklar"},
      {"icon": Icons.do_not_disturb, "title": "Rahatsız Etme", "desc": "Zamanlama • İstisnalar"},
      {"icon": Icons.wallpaper, "title": "Duvar kağıdı ve stil", "desc": "Ana ekran • Kilit ekranı"},
      {"icon": Icons.display_settings, "title": "Ekran", "desc": "Parlaklık • Göz rahatlığı • Karanlık mod"},
      {"icon": Icons.accessibility, "title": "Erişilebilirlik", "desc": "Görme • İşitme • Etkileşim"},
      {"icon": Icons.lock, "title": "Güvenlik ve gizlilik", "desc": "Ekran kilidi • Google Play Protect"},
      {"icon": Icons.battery_full, "title": "Pil ve cihaz bakımı", "desc": "Pil • Depolama • RAM"},
      {"icon": Icons.apps, "title": "Uygulamalar", "desc": "Varsayılan uygulamalar • İzinler"},
      {"icon": Icons.language, "title": "Genel yönetim", "desc": "Dil ve klavye • Tarih ve saat"},
      {"icon": Icons.account_circle, "title": "Hesaplar ve yedekleme", "desc": "Samsung Cloud • Smart Switch"},
      {"icon": Icons.child_care, "title": "Dijital sağlık ve ebeveyn denetimi", "desc": "Ekran süresi • Uyku modu"},
      {"icon": Icons.location_on, "title": "Konum", "desc": "Uygulama izinleri • Hizmetler"},
      {"icon": Icons.safety_check, "title": "Güvenlik güncellemeleri", "desc": "Knox • Google Play sistemi"},
      {"icon": Icons.info, "title": "Telefon hakkında", "desc": "Android sürümü, One UI bilgisi"},
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Ayarlar"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Arama kutusu
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Ayarlar içinde ara",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Samsung account kartı
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: const Text("Samsung Account"),
                      subtitle: const Text("Hesabınıza giriş yapın"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final cat = categories[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(cat["icon"] as IconData, color: Colors.blue),
                    title: Text(cat["title"] as String),
                    subtitle: Text(cat["desc"] as String),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      if (cat["title"] == "Telefon hakkında") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutPhonePage(),
                          ),
                        );
                      } else {
                        _openSystemSettings();
                      }
                    },
                  ),
                );
              },
              childCount: categories.length,
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
    return Scaffold(
      appBar: AppBar(title: const Text("Telefon hakkında")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Cihaz adı"),
            subtitle: Text("Galaxy S25 Ultra"),
          ),
          Divider(),
          ListTile(
            title: Text("Model numarası"),
            subtitle: Text("SM-S928B"),
          ),
          Divider(),
          ListTile(
            title: Text("Android sürümü"),
            subtitle: Text("16"),
          ),
          Divider(),
          ListTile(
            title: Text("One UI sürümü"),
            subtitle: Text("8.0"),
          ),
          Divider(),
          ListTile(
            title: Text("Knox sürümü"),
            subtitle: Text("4.1"),
          ),
          Divider(),
          ListTile(
            title: Text("Çekirdek sürümü"),
            subtitle: Text("5.15.68"),
          ),
          Divider(),
          ListTile(
            title: Text("Yapım numarası"),
            subtitle: Text("UP1A.250805.001"),
          ),
        ],
      ),
    );
  }
}
