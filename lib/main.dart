import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Name Generator',
      home: FullName(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
      )));
}

class FullName extends StatefulWidget {
  @override
  _FullNameState createState() => _FullNameState();
}

class _FullNameState extends State<FullName> {
  String firstName;
  String middleName;
  String lastName;
  String fullName = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Name Generator'),
      ),
      body: Builder(
        builder: (context) => Form(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                          labelText: 'First name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: middleNameController,
                      decoration: InputDecoration(
                          labelText: 'Middle Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      fullName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Expanded(
                        child: FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          fullName = _generateFullName();
                        });

                        _showSnackBar(context);
                      },
                      child: Text("Generate"),
                    )),
                  )
                ]))),
      ),
    );
  }

  String _generateFullName() {
    String firstName = firstNameController.text;
    String middleName = middleNameController.text;
    String lastName = lastNameController.text;
    return '$firstName $middleName $lastName';
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Full Name Generated!'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
