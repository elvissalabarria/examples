import 'package:examples/biometric.dart';
import 'package:examples/home.dart';
import 'package:examples/scree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey parentKey = GlobalKey();
  int countItems = 0;
  late TextEditingController textController;
  List<String> list = ["item1", "item2", "item3", "item4", "item5"];
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    void showTextFields() {
      setState(() {
        countItems = int.parse(textController.text);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Examples"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Text fields number'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: showTextFields, child: const Text('Press to show text field')),
            const SizedBox(
              height: 10,
            ),
            (countItems > 0)
                ? Flexible(
                    child: ListView.builder(
                        itemCount: countItems,
                        itemBuilder: (BuildContext context, int index) {
                          return TextField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "TextField " + index.toString(),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          );
                        }),
                  )
                : const SizedBox(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                },
                child: const Text("Color container")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NosVoyages(),
                      ));
                },
                child: const Text("Imput container")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BiometricScreen(),
                      ));
                },
                child: const Text("BioMetric"))
          ],
        ),
      ),
    );
  }
}
