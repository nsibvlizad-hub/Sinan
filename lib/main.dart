import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Samsung Settings Clone",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 🔹 Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search settings",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Samsung account card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text("Sign in to your Samsung account",
                        style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Groups
            buildGroup(context, "Connections", [
              {"icon": Icons.wifi, "title": "Wi-Fi", "subtitle": "Off"},
              {"icon": Icons.bluetooth, "title": "Bluetooth", "subtitle": "Off"},
              {"icon": Icons.flight, "title": "Flight mode", "subtitle": ""},
              {"icon": Icons.network_cell, "title": "Mobile networks", "subtitle": ""},
              {"icon": Icons.data_usage, "title": "Data usage", "subtitle": ""},
              {"icon": Icons.wifi_tethering, "title": "Hotspot & tethering", "subtitle": ""},
            ]),

            buildGroup(context, "Sounds & Vibration", [
              {"icon": Icons.volume_up, "title": "Sounds and vibration", "subtitle": "Sound mode"},
              {"icon": Icons.notifications, "title": "Notifications", "subtitle": "Manage notifications"},
              {"icon": Icons.do_not_disturb_on, "title": "Do not disturb", "subtitle": "Off"},
            ]),

            buildGroup(context, "Display", [
              {"icon": Icons.display_settings, "title": "Display", "subtitle": "Brightness, Eye comfort"},
              {"icon": Icons.wallpaper, "title": "Wallpaper and style", "subtitle": ""},
              {"icon": Icons.brush, "title": "Themes", "subtitle": ""},
              {"icon": Icons.home, "title": "Home screen", "subtitle": ""},
              {"icon": Icons.lock, "title": "Lock screen", "subtitle": ""},
            ]),

            buildGroup(context, "Security", [
              {"icon": Icons.fingerprint, "title": "Biometrics and security", "subtitle": ""},
              {"icon": Icons.privacy_tip, "title": "Privacy", "subtitle": ""},
              {"icon": Icons.location_on, "title": "Location", "subtitle": ""},
              {"icon": Icons.warning, "title": "Safety and emergency", "subtitle": ""},
            ]),

            buildGroup(context, "Accounts", [
              {"icon": Icons.person, "title": "Accounts and backup", "subtitle": ""},
              {"icon": Icons.android, "title": "Google", "subtitle": ""},
              {"icon": Icons.star, "title": "Advanced features", "subtitle": ""},
            ]),

            buildGroup(context, "General Management", [
              {"icon": Icons.settings, "title": "General management", "subtitle": "Language, Date & time"},
              {"icon": Icons.accessibility, "title": "Accessibility", "subtitle": ""},
              {"icon": Icons.system_update, "title": "Software update", "subtitle": ""},
            ]),

            buildGroup(context, "About phone", [
              {"icon": Icons.phone_android, "title": "About phone", "subtitle": "Status, Software info"},
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildGroup(BuildContext context, String title, List<Map<String, dynamic>> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            ListTile(
              leading: Icon(items[i]["icon"], color: Colors.blue),
              title: Text(items[i]["title"]),
              subtitle: items[i]["subtitle"] != "" ? Text(items[i]["subtitle"]) : null,
              onTap: () {
                if (items[i]["title"] == "About phone") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutPhonePage()),
                  );
                }
              },
            ),
            if (i != items.length - 1) const Divider(height: 0),
          ]
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
      appBar: AppBar(
        title: const Text("About phone"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Device name"),
            subtitle: Text("Galaxy S23 Ultra"),
          ),
          Divider(height: 0),
          ListTile(
            title: Text("Model number"),
            subtitle: Text("SM-XYZ123"),
          ),
          Divider(height: 0),
          ListTile(
            title: Text("Android version"),
            subtitle: Text("13 (One UI 6.0)"),
          ),
          Divider(height: 0),
          ListTile(
            title: Text("Software information"),
            subtitle: Text("Kernel version, Build number"),
          ),
        ],
      ),
    );
  }
}
