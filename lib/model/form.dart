import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({Key? key}) : super(key: key);

  @override
  _FormulaireState createState() => _FormulaireState();
}

enum Groups { group1, group2 }

class _FormulaireState extends State<Formulaire> {
  final nom = TextEditingController();
  final prenom = TextEditingController();
  final email = TextEditingController();
  bool agree=false;
  Groups ?_group=Groups.group1;

  void nomListener() {
    if(nom.text.isNotEmpty) {
      setState(() {
        nom.text=nom.text.toUpperCase();
        nom.selection = TextSelection.fromPosition(TextPosition(offset: nom.text.length));
      });
    }
  }
  void prenomListener() {}
  void emailListener() {}
  @override
  void initState() {
    super.initState();
    nom.addListener(nomListener);
    prenom.addListener(prenomListener);
    email.addListener(emailListener);
  }
  @override
  void dispose() {
    super.dispose();
    nom.removeListener(nomListener);
    prenom.removeListener(prenomListener);
    email.removeListener(emailListener);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Formulaire"),
        )
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        child: Image(
                          image: AssetImage("assets/amjad.png"),
                          width: 400,
                          height: 400,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 40)
                  ],
                ),
                SizedBox(height: 100),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 15, 6, 15),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(7.0),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    controller: nom,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Nom",
                        border: InputBorder.none
                    ),
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 15, 6, 15),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(7.0),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    controller: prenom,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Prénom",
                        border: InputBorder.none),
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 15, 6, 15),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(7.0),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Email",
                        border: InputBorder.none),
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    ListTile(
                      title: Text("Group1"),
                      leading: Radio<Groups>(
                        value: Groups.group1,
                        groupValue: _group,
                        onChanged: (value) {
                          setState(() {
                            _group = value;
                            print("Group1 selected");
                          });
                        },
                      )
                    ),
                    ListTile(
                        title: Text("Group2"),
                        leading: Radio<Groups>(
                          value: Groups.group2,
                          groupValue: _group,
                          onChanged: (value) {
                            setState(() {
                              _group = value;
                            });
                          },
                        )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState(() {
                          agree=!agree;
                        });
                      },
                      value: agree,
                    ),
                    SizedBox(width: 5),
                    Text(
                        "Agree with term and condtion"
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "s'inscrire",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

