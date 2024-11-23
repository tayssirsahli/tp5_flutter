import 'package:flutter/material.dart';
import '../models/list_etudiants.dart';
import '../utile/dbuse.dart';

class ListStudentDialog {
  final txtNom = TextEditingController();
  final txtPrenom = TextEditingController();
  final txtdatNais = TextEditingController();
  Widget buildAlert(BuildContext context, ListEtudiants student, bool
  isNew) {
    dbuse helper = dbuse();
    helper.openDb();
    if (!isNew) {
      txtNom.text = student.nom;
      txtPrenom.text = student.prenom;
      txtdatNais.text = student.datNais;
    }
    return AlertDialog(
      title: Text((isNew) ? 'New student' : 'Edit student'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
                controller: txtNom,
                decoration: InputDecoration(hintText: 'Student Name')),
            TextField(
              controller: txtPrenom,
              decoration: InputDecoration(hintText: 'First name'),
            ),
            TextField(
              controller: txtdatNais,
              decoration: InputDecoration(hintText: 'Date naissance'),
            ),
            ButtonTheme(
              minWidth: 200.0, // You can adjust the width as needed
              height: 50.0,   // You can adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  student.nom = txtNom.text;
                  student.prenom = txtPrenom.text;
                  student.datNais = txtdatNais.text;
                  helper.insertEtudiants(student);
                  Navigator.pop(context);
                },
                child: Text('Save student'),
              ),
            )

          ],
        ),
      ),
    );
  }
}