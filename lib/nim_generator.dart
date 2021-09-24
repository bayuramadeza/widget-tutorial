import 'package:first/constanta.dart';
import 'package:flutter/material.dart';

import 'models/student.dart';

class NimGenerator extends StatefulWidget {
  static const routeName = '/nimGeneratorRoute';
  final String idStudent;

  const NimGenerator({Key? key, required this.idStudent}) : super(key: key);

  @override
  _NimGeneratorState createState() => _NimGeneratorState();
}

enum GenderType {MALE, FEMALE}

class _NimGeneratorState extends State<NimGenerator> {
  Student student1 = Student(name: "Shinta", gender: 'Female');
  Student student2 = Student(name: "Iqbal", gender: 'male');
  Student student3 = Student(name: "Joko", gender: 'Male');
  Student student4 = Student(name: "Indah", gender: 'Female');
  Student student5 = Student(name: "Anita", gender: 'Female');
  Student student6 = Student(name: "Maman", gender: 'Male');
  Student student7 = Student(name: "Iksan", gender: 'Male');
  final _nameController = TextEditingController();
  GenderType gender = GenderType.MALE;
  List<Student> students = [];

  @override
  void initState() {
    students.add(student1);
    students.add(student2);
    students.add(student3);
    students.add(student4);
    students.add(student5);
    students.add(student6);
    students.add(student7);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nim Generator ${widget.idStudent}"),
        actions: [
          GestureDetector(
            onTap: (){
              showDatePicker(context: context, initialDate: DateTime(2021), firstDate: DateTime(2021), lastDate: DateTime(2021));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.date_range),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/avatar.png', width: size.width/4, height: size.width/4),
            Image.network('https://toppng.com/uploads/preview/avatar-png-11554021661asazhxmdnu.png', width: size.width/4, height: size.width/4),
            GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (context){
                 return AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text('This is a demo alert dialog.'),
                        Text('Would you like to approve of this message?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Approve'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
                });
              },
              child: FadeInImage(
                placeholder: AssetImage('assets/avatar.png'), 
                image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/527/825/146/hot-girl-hd-1920x1200-wallpaper-preview.jpg'), 
                width: size.width,)
              ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: INPUT_YOUR_NAME
              ),
            ),
            Text("Pilih Jenis Kelamin"),
            ListTile(
              title: const Text('Pria'),
              leading: Radio<GenderType>(
                value: GenderType.MALE,
                groupValue: gender,
                onChanged: (GenderType? value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Wanita'),
              leading: Radio<GenderType>(
                value: GenderType.FEMALE,
                groupValue: gender,
                onChanged: (GenderType? value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),
            // ElevatedButton(onPressed: (){
            //   setState(() {
            //     student1.name = _nameController.text;
            //   });
            // }, child: Text("Generate NIM")),

            // Text(student1.name??"Nama masih kosong"),
            // Text(student1.generateNIM()??"NIM masih kosong"),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: ()=>print(students[index].name),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${students[index].name!} - ${students[index].gender}"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}