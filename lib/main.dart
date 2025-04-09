import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'QuickShare',
  theme: ThemeData.dark(),
  home: QuickShareHomePage(),
));

class QuickShareHomePage extends StatefulWidget {
  @override
  _QuickShareHomePageState createState() => _QuickShareHomePageState();
}

class _QuickShareHomePageState extends State<QuickShareHomePage> {
  int _index = 4;

  final _screens = [
    Center(child: Text('Download')),
    Center(child: Text('App')),
    Center(child: Text('Photo')),
    Center(child: Text('Music')),
    FileManagerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QuickShare'), backgroundColor: Colors.green[700]),
      drawer: QuickShareDrawer(),
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Download'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'App'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Photo'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file), label: 'File'),
        ],
      ),
    );
  }
}

class FileManagerScreen extends StatelessWidget {
  Widget fileItem(String title, String subtitle, int count) => ListTile(
    leading: Icon(Icons.folder, color: Colors.blue),
    title: Text('$title ($count)'),
    subtitle: Text(subtitle),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          title: Text("Phone Storage"),
          subtitle: Text("Total: 244GB Available: 135GB"),
        ),
        Divider(),
        fileItem("Documents", "Includes Word, PPT, Excel, WPS, etc.", 20),
        fileItem("Ebooks", "Includes .umd, .ebk, .txt, .chm, etc.", 88),
        fileItem("Apks", "Includes .apk files", 5),
        fileItem("Archives", "Includes .7z, .rar, .zip, .iso, etc.", 4),
        fileItem("Big files", "Includes files > 50 MB", 45),
      ],
    );
  }
}

class QuickShareDrawer extends StatelessWidget {
  Widget drawerItem(IconData icon, String title) => ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF4C56AF)),
            child: Text('QuickShare Settings', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          drawerItem(Icons.language, 'Language'),
          SwitchListTile(
            title: Text('High-speed Mode supported'),
            subtitle: Text('Send via High-speed Mode'),
            value: true,
            onChanged: (_) {},
          ),
          drawerItem(Icons.settings, 'Settings'),
          SwitchListTile(
            title: Text('Night mode'),
            value: true,
            onChanged: (_) {},
          ),
          drawerItem(Icons.phone_android, 'Phone Settings'),
          drawerItem(Icons.feedback, 'Help & Feedback'),
          drawerItem(Icons.star, 'Ratings'),
          drawerItem(Icons.info, 'About'),
        ],
      ),
    );
  }
}
