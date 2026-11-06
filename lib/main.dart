import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _clickButton() {
    debugPrint("Tombol di klik");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ..
              },
            ),
            ListTile(title: const Text('Item 2'), onTap: () {}),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),

              height: 400,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  Text('Input text', textAlign: TextAlign.center,),
                  Row(
                    spacing: 2,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama',
                            hintText: "Massukan nama anda...",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _clickButton,
                        icon: const Icon(Icons.add),
                        tooltip: "Add name",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
