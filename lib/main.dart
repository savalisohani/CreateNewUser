import 'package:date_field/date_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savali Project',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Profile Forms'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String name = 'Allergies';
  String secname = 'Co-morbidities';

  final List<String> gender =['Male', 'Female', 'Others'];
  late String _currentgender;

  final List<String> bloodgroup =['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  late String _currentbloodgroup;
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 10.0,
          ),
          child: _buildForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            debugPrint('All validations passed!!!');
          }
        },
        child: Icon(Icons.done),
      ),
    );
  }

  Form _buildForm() {

    int _value = 1;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Date of birth cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateTimeFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Time of Birth',
              ),
              mode: DateTimeFieldPickerMode.time,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
          ),
          DropdownButtonFormField(
            hint: Text("Gender"),
              items: gender.map((gender){
                return DropdownMenuItem(
                    value: gender,
                    child: Text('$gender')
                );
           }).toList(),
            onChanged: (val) => setState(() => _currentgender ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Pincode cannot be empty';
                } else if (value.length < 6 || value.length > 6) {
                  return 'Invalid Pin Code';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Pin Code',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length > 10 || value.length < 10) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Emergency Contact Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          DropdownButtonFormField(
            hint: Text("Blood Group"),
            items: bloodgroup.map((bloodgroup){
              return DropdownMenuItem(
                  value: bloodgroup,
                  child: Text('$bloodgroup')
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentbloodgroup ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ExpansionTile(
            title: Text(this.name),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            children: [
              ListTile(
                title: Text('Drug Allergy'),
                onTap: (){
                  setState(() {
                    this.name ='Drug Allergy';
                  });
                },
              ),
              ListTile(
                title: Text('Food Allergy'),
                onTap: (){
                  setState(() {
                    this.name ='Food Allergy';

                  });
                },
              ),
              ListTile(
                title: Text('Contact Allergy'),
                onTap: (){
                  setState(() {
                    this.name ='Contact Allergy';
                  });
                },
              ),
              ListTile(
                title: Text('Nasal Allergy'),
                onTap: (){
                  setState(() {
                    this.name ='Nasal Allergy';
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ExpansionTile(
            title: Text(this.secname),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            children: [
              ListTile(
                title: Text('Anxiety'),
                onTap: (){
                  setState(() {
                    this.secname ='Anxiety';
                  });
                },
              ),
              ListTile(
                title: Text('OCD'),
                onTap: (){
                  setState(() {
                    this.secname ='OCD';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}