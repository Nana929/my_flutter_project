import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 122, 129, 112)),
        useMaterial3: true,
      ),
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
  var numCounter = 0;
  var myFontSize = 30.0;
  var isChecked = false;
  String _loadedText = '';

  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();

  void setNewValue(double value){ 
    setState(() {
      myFontSize = value;
    });
  }

   @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _num1.text = prefs.getString('saved_username') ?? ''; 
      _num2.text = prefs.getString('saved_password') ?? ''; 
    });
  }


  void _saveLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_username', _num1.text); // 存储用户名
    await prefs.setString('saved_password', _num2.text); // 存储密码
  }

  Future<void> _removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_username');
    await prefs.remove('saved_password');
    setState(() {
      _num1.clear();
      _num2.clear();
    });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notion'),
          content: Text(
              'Would you like to save your username and password for the next time ？'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _removeData();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                _saveLoginData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("images/ac_logo.jpg", width: 300),
            TextField(
              controller: _num1,
              decoration: const InputDecoration(
                  hintText: "Please enter the login account:",
                  labelText: "Login",
                  border: OutlineInputBorder()),
                   obscureText: true,
            ),
            TextField(
              controller: _num2,
              decoration: const InputDecoration(
                  hintText: "Please enter the password:",
                  labelText: "Password",
                  border: OutlineInputBorder()),
                   obscureText: true,
            ),
            
            ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context);

                },
                child: const Text("login"),
                 ),
          ],
        ),
      ),
    );
  }}

                  