import 'package:flutter/material.dart';

void main() {
  runApp(SamsungSettingsClone());
}

class SamsungSettingsClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ayarlar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: SettingsHomePage(),
    );
  }
}

class SettingsHomePage extends StatefulWidget {
  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  TextEditingController searchController = TextEditingController();
  String query = "";

  List<Map<String, dynamic>> settingsCategories = [
    {"title": "Bağlantılar", "icon": Icons.wifi, "page": null},
    {"title": "Ses ve titreşim", "icon": Icons.volume_up, "page": null},
    {"title": "Bildirimler", "icon": Icons.notifications, "page": null},
    {"title": "Ekran", "icon": Icons.phone_android, "page": null},
    {"title": "Duvar kağıtları ve tema", "icon": Icons.wallpaper, "page": null},
    {"title": "Gelişmiş özellikler", "icon": Icons.star, "page": null},
    {"title": "Dijital sağlık ve ebeveyn denetimleri", "icon": Icons.health_and_safety, "page": null},
    {"title": "Cihaz bakımı", "icon": Icons.security, "page": null},
    {"title": "Uygulamalar", "icon": Icons.apps, "page": null},
    {"title": "Genel yönetim", "icon": Icons.settings, "page": null},
    {"title": "Erişilebilirlik", "icon": Icons.accessibility, "page": null},
    {"title": "Güvenlik ve konum", "icon": Icons.privacy_tip, "page": null},
    {"title": "Samsung Account", "icon": Icons.person, "page": null},
    {"title": "Google", "icon": Icons.g_mobiledata, "page": null},
    {"title": "Telefon hakkında", "icon": Icons.info, "page": null},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCategories = settingsCategories
        .where((cat) => cat["title"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // 🔍 Arama çubuğu
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Ayarları ara",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (val) {
                setState(() {
                  query = val;
                });
              },
            ),
          ),

          // 📂 Kategoriler listesi
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: filteredCategories.length,
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemBuilder: (context, index) {
                var cat = filteredCategories[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: Icon(cat["icon"], color: Colors.blue),
                    title: Text(cat["title"], style: TextStyle(fontSize: 16)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Alt sayfalara yönlendirme buraya gelecek (Parça 2-7)
                    },
                  ),
                );
              },
            ),
          ),
        ],
        // =================== BAĞLANTILAR SAYFALARI ===================

// Wi-Fi Alt Sayfası
class WifiPage extends StatelessWidget {
  const WifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wi-Fi")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Wi-Fi Aç/Kapat"),
            subtitle: const Text("Wi-Fi özelliğini aç veya kapat"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("Kullanılabilir Ağlar", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text("Ev Wi-Fi"),
            subtitle: const Text("Güvenli"),
            trailing: const Icon(Icons.lock),
          ),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text("Ofis Wi-Fi"),
            subtitle: const Text("WPA2"),
            trailing: const Icon(Icons.lock),
          ),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text("Misafir"),
            subtitle: const Text("Açık ağ"),
          ),
        ],
      ),
    );
  }
}

// Bluetooth Alt Sayfası
class BluetoothPage extends StatelessWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bluetooth")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Bluetooth Aç/Kapat"),
            subtitle: const Text("Yakındaki cihazlarla bağlantı kur"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("Eşleştirilmiş Cihazlar", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Galaxy Buds Pro"),
            subtitle: const Text("Bağlandı"),
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Galaxy Watch 5"),
            subtitle: const Text("Bağlantı yok"),
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Araç Ses Sistemi"),
            subtitle: const Text("Bağlı"),
          ),
        ],
      ),
    );
  }
}

// Mobil Veri Alt Sayfası
class MobileDataPage extends StatelessWidget {
  const MobileDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobil Veri")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Mobil Veri"),
            subtitle: const Text("İnternet bağlantısını mobil ağ üzerinden kullan"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Ağ modu"),
            subtitle: const Text("5G/4G/3G/2G (Otomatik)"),
          ),
          ListTile(
            title: const Text("Veri dolaşımı"),
            subtitle: const Text("Yurtdışında internet kullanımı"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}

// Hotspot Alt Sayfası
class HotspotPage extends StatelessWidget {
  const HotspotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobil Hotspot ve Paylaşım")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Mobil Hotspot"),
            subtitle: const Text("Diğer cihazlarla internetinizi paylaşın"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Hotspot Adı"),
            subtitle: const Text("Galaxy-Hotspot"),
          ),
          ListTile(
            title: const Text("Şifre"),
            subtitle: const Text("••••••••"),
          ),
          ListTile(
            title: const Text("USB paylaşımı"),
            subtitle: const Text("Cihazı USB kablo ile bağlayın"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Bluetooth paylaşımı"),
            subtitle: const Text("Bluetooth üzerinden internet paylaşımı"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}

// Uçak Modu Alt Sayfası
class AirplaneModePage extends StatelessWidget {
  const AirplaneModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Uçak Modu")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Uçak Modu"),
            subtitle: const Text("Tüm kablosuz bağlantıları kapatır"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("Not", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("Uçak modu açıkken Wi-Fi ve Bluetooth'u manuel olarak açabilirsiniz."),
          ),
        ],
      ),
    );
  }
}

// =================== BAĞLANTILAR ANA KATEGORİSİ ===================

Widget buildConnectionsSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Bağlantılar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text("Wi-Fi"),
              subtitle: const Text("Wi-Fi ağlarını yönetin"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WifiPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.bluetooth),
              title: const Text("Bluetooth"),
              subtitle: const Text("Bluetooth cihazlarını yönetin"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BluetoothPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.network_cell),
              title: const Text("Mobil Veri"),
              subtitle: const Text("Mobil ağ ayarları"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MobileDataPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Hotspot ve Paylaşım"),
              subtitle: const Text("İnternet bağlantınızı paylaşın"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HotspotPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.airplanemode_active),
              title: const Text("Uçak Modu"),
              subtitle: const Text("Kablosuz bağlantıları kapatın"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AirplaneModePage()),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
      ),
    );
  }
}
// =================== SES VE TİTREŞİM ===================

class SoundPage extends StatelessWidget {
  const SoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ses ve Titreşim")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Zil Sesi"),
            subtitle: const Text("Varsayılan zil sesi seç"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Titreşim"),
            subtitle: const Text("Titreşim ayarlarını değiştir"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Medya Sesi"),
            subtitle: const Text("Müzik, video ve oyun ses düzeyi"),
            trailing: Slider(
              value: 0.7,
              onChanged: (val) {},
            ),
          ),
          ListTile(
            title: const Text("Bildirim Sesi"),
            subtitle: const Text("Uyarı ve mesaj ses düzeyi"),
            trailing: Slider(
              value: 0.5,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}

// =================== BİLDİRİMLER ===================

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bildirimler")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Bildirimleri Göster"),
            subtitle: const Text("Tüm uygulama bildirimlerini aç/kapat"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Durum Çubuğu"),
            subtitle: const Text("Simge sayısını sınırlayın"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Uygulama Bildirimleri"),
            subtitle: const Text("Her uygulamanın bildirimlerini yönetin"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== EKRAN ===================

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ekran")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Parlaklık"),
            subtitle: const Text("Ekran parlaklığını ayarla"),
            trailing: Slider(
              value: 0.8,
              onChanged: (val) {},
            ),
          ),
          ListTile(
            title: const Text("Karanlık Mod"),
            subtitle: const Text("Koyu tema kullan"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Ekran Zaman Aşımı"),
            subtitle: const Text("30 saniye"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Ekran Çözünürlüğü"),
            subtitle: const Text("FHD+ (2400x1080)"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Ekran Yenileme Hızı"),
            subtitle: const Text("120Hz"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== KATEGORİ BLOKLARI ===================

Widget buildSoundSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Ses ve Bildirimler",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.volume_up),
              title: const Text("Ses ve Titreşim"),
              subtitle: const Text("Ses düzeyi, titreşim ve ses ayarları"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SoundPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Bildirimler"),
              subtitle: const Text("Bildirim ayarlarını değiştirin"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.display_settings),
              title: const Text("Ekran"),
              subtitle: const Text("Parlaklık, tema ve çözünürlük"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DisplayPage()),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
// =================== DUVAR KAĞIDI ===================

class WallpaperPage extends StatelessWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Duvar Kağıdı")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Ana Ekran"),
            subtitle: const Text("Ana ekran için duvar kağıdı seçin"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Kilit Ekranı"),
            subtitle: const Text("Kilit ekranı için duvar kağıdı seçin"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Dinamik Duvar Kağıdı"),
            subtitle: const Text("Günlük değişen duvar kağıdı"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}

// =================== TEMALAR ===================

class ThemesPage extends StatelessWidget {
  const ThemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Temalar")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Tema Mağazası"),
            subtitle: const Text("Binlerce tema arasından seçim yapın"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Renk Paleti"),
            subtitle: const Text("Sistem renklerini özelleştirin"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Simge Paketleri"),
            subtitle: const Text("Uygulama simgelerini değiştirin"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== KİLİT EKRANI ===================

class LockScreenPage extends StatelessWidget {
  const LockScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kilit Ekranı")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Ekran Kilidi Türü"),
            subtitle: const Text("Şifre, PIN, Desen"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Always On Display"),
            subtitle: const Text("Saat, tarih ve bildirimleri göster"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Hızlı Kısayollar"),
            subtitle: const Text("Kilit ekranı alt kısayollarını ayarla"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== BİYOMETRİK VE GÜVENLİK ===================

class BiometricsPage extends StatelessWidget {
  const BiometricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biyometrik ve Güvenlik")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Parmak İzi"),
            subtitle: const Text("Telefonu parmak iziyle açın"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Yüz Tanıma"),
            subtitle: const Text("Telefonu yüz tanıma ile açın"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Samsung Knox"),
            subtitle: const Text("Kurumsal güvenlik koruması"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Şifreleme"),
            subtitle: const Text("Cihaz verilerini şifreleyin"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== KATEGORİ BLOKLARI ===================

Widget buildPersonalizationSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Kişiselleştirme ve Güvenlik",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.wallpaper),
              title: const Text("Duvar Kağıdı"),
              subtitle: const Text("Ana ekran ve kilit ekranı arka planı"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WallpaperPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text("Temalar"),
              subtitle: const Text("Tema, renk ve simgeler"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemesPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Kilit Ekranı"),
              subtitle: const Text("Ekran kilidi ve AOD"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LockScreenPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text("Biyometrik ve Güvenlik"),
              subtitle: const Text("Parmak izi, yüz tanıma, Knox"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BiometricsPage()),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
// =================== GENEL YÖNETİM ===================

class GeneralManagementPage extends StatelessWidget {
  const GeneralManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Genel Yönetim")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dil ve Girdi"),
            subtitle: const Text("Klavye, dil ayarları"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Tarih ve Saat"),
            subtitle: const Text("Otomatik tarih ve saat"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Yedekleme"),
            subtitle: const Text("Verilerinizi Samsung Cloud’a yedekleyin"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Sıfırla"),
            subtitle: const Text("Cihazı fabrika ayarlarına döndür"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== PİL ===================

class BatteryPage extends StatelessWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pil")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Pil Kullanımı"),
            subtitle: const Text("Uygulama bazlı pil tüketimi"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Güç Tasarrufu Modu"),
            subtitle: const Text("Pil ömrünü uzatın"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Uyarlanabilir Pil"),
            subtitle: const Text("Kullanıma göre pil optimizasyonu"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}

// =================== DEPOLAMA ===================

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Depolama")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Toplam Depolama"),
            subtitle: const Text("128 GB / 256 GB"),
          ),
          ListTile(
            title: const Text("Uygulamalar"),
            subtitle: const Text("Kurulu uygulamalar ve boyutları"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Önbellek Verileri"),
            subtitle: const Text("Önbelleği temizle"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("SD Kart"),
            subtitle: const Text("Harici depolama ayarları"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== ERİŞİLEBİLİRLİK ===================

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Erişilebilirlik")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Görme"),
            subtitle: const Text("Ekran okuyucu, renk ayarları"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("İşitme"),
            subtitle: const Text("Altyazı, ses dengeleme"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Etkileşim"),
            subtitle: const Text("Yardımcı menü, dokunma ayarları"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== DİJİTAL SAĞLIK ===================

class DigitalWellbeingPage extends StatelessWidget {
  const DigitalWellbeingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dijital Sağlık ve Ebeveyn Denetimleri")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Ekran Süresi"),
            subtitle: const Text("Telefon kullanım süresi"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Uygulama Zamanlayıcılar"),
            subtitle: const Text("Belirli uygulamalara sınır koyun"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Uyku Modu"),
            subtitle: const Text("Gece telefonu kısıtla"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Ebeveyn Denetimleri"),
            subtitle: const Text("Çocuklarınız için yönetim"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== KATEGORİ BLOKLARI ===================

Widget buildSystemSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Sistem Yönetimi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: const Text("Genel Yönetim"),
              subtitle: const Text("Dil, klavye, tarih, sıfırla"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GeneralManagementPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.battery_full),
              title: const Text("Pil"),
              subtitle: const Text("Pil kullanımı ve tasarruf"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BatteryPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.sd_storage),
              title: const Text("Depolama"),
              subtitle: const Text("Telefon ve SD kart kullanımı"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StoragePage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.accessibility_new),
              title: const Text("Erişilebilirlik"),
              subtitle: const Text("Görme, işitme, etkileşim"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccessibilityPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text("Dijital Sağlık"),
              subtitle: const Text("Ekran süresi ve ebeveyn denetimleri"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DigitalWellbeingPage()),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
// =================== UYGULAMALAR ===================

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Uygulamalar")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Yüklü Uygulamalar"),
            subtitle: const Text("Tüm uygulamaları görüntüle"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Varsayılan Uygulamalar"),
            subtitle: const Text("Tarayıcı, SMS, Telefon ayarla"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Uygulama İzinleri"),
            subtitle: const Text("Kamera, mikrofon, konum izinleri"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Özel Erişim"),
            subtitle: const Text("Pil optimizasyonu, VPN kontrolü"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== YAZILIM GÜNCELLEME ===================

class SoftwareUpdatePage extends StatelessWidget {
  const SoftwareUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yazılım Güncelleme")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Güncellemeleri İndir ve Yükle"),
            subtitle: const Text("Mevcut güncellemeleri kontrol et"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Otomatik İndir"),
            subtitle: const Text("Wi-Fi üzerinden otomatik indir"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Son Güncelleme"),
            subtitle: const Text("Android 16 OneUI 8 - 01.08.2025"),
          ),
        ],
      ),
    );
  }
}

// =================== TELEFON HAKKINDA ===================

class AboutPhonePage extends StatelessWidget {
  const AboutPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telefon Hakkında")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cihaz Adı"),
            subtitle: const Text("Galaxy S25 Ultra"),
          ),
          ListTile(
            title: const Text("Model Numarası"),
            subtitle: const Text("SM-S928B/DS"),
          ),
          ListTile(
            title: const Text("Android Sürümü"),
            subtitle: const Text("16"),
          ),
          ListTile(
            title: const Text("One UI Sürümü"),
            subtitle: const Text("8.0"),
          ),
          ListTile(
            title: const Text("Yapım Numarası"),
            subtitle: const Text("UP1A.250805.001"),
          ),
          ListTile(
            title: const Text("Durum Bilgileri"),
            subtitle: const Text("IMEI, SIM kart, IP adresi"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Yasal Bilgiler"),
            subtitle: const Text("Açık kaynak lisansları"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== GELİŞTİRİCİ SEÇENEKLERİ ===================

class DeveloperOptionsPage extends StatelessWidget {
  const DeveloperOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Geliştirici Seçenekleri")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("USB Hata Ayıklama"),
            subtitle: const Text("ADB ile hata ayıklamaya izin ver"),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("OEM Kilit Açma"),
            subtitle: const Text("Bootloader kilidini aç"),
            value: false,
            onChanged: (val) {},
          ),
          ListTile(
            title: const Text("Animasyon Ölçeği"),
            subtitle: const Text("Geçiş animasyon hızını ayarla"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Arka Plan İşlemleri"),
            subtitle: const Text("Arka plan uygulama sınırları"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("GPU İşlemleri"),
            subtitle: const Text("GPU profilleme, HW overlay"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// =================== KATEGORİ BLOKLARI ===================

Widget buildAppsSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("Uygulamalar ve Sistem",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text("Uygulamalar"),
              subtitle: const Text("Uygulama ayarlarını yönetin"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppsPage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.system_update),
              title: const Text("Yazılım Güncelleme"),
              subtitle: const Text("Android ve güvenlik güncellemeleri"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SoftwareUpdatePage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Telefon Hakkında"),
              subtitle: const Text("Cihaz bilgilerini görüntüle"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPhonePage()),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.developer_mode),
              title: const Text("Geliştirici Seçenekleri"),
              subtitle: const Text("USB hata ayıklama, animasyon ölçekleri"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeveloperOptionsPage()),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
