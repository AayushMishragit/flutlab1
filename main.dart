import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.lightBlue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0f13ea),
        title: Text(
          " BMI App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI ",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 19,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtcontroller.text.toString();
                    var ft = ftcontroller.text.toString();
                    var inch = incontroller.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);
                      var tInch = (ift * 12) + iInch;
                      var tcm = tInch * 2.54;
                      var tm = tcm / 100;
                      var bmi = iwt / (tm * tm);
                      var msg = " ";

                      if (bmi > 25) {
                        msg = "you are overweight";
                        bgcolor = Colors.red.shade200;
                      } else if (bmi < 18) {
                        msg = "you are underweight";
                        bgcolor = Colors.orange.shade100;
                      } else {
                        msg = "you are fit";
                        bgcolor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "$msg  \n Your BMI is:${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "please give all inputs!";
                      });
                    }
                  },
                  child: Text("Calculate"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
