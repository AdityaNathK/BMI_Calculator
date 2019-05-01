import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeClass();
  }
}
// ========== State Class Starts here ==========

class _HomeClass extends State<HomePage> {
  // State Values Goes here

  final _margin = 5.0;

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.0;
  String status = "";

  void calculateBmi() {
    String weight = _weightController.text;
    String age = _ageController.text;
    String height = _heightController.text;

    setState(() {
      if (weight.isNotEmpty && age.isNotEmpty && height.isNotEmpty) {
        _bmi = ((double.parse(weight) /
            (double.parse(height) * double.parse(height)))*10000);

        debugPrint('$_bmi');

        if (_bmi < 18.5)
          status = "Under Weight";
        else if (_bmi >= 18.5 && _bmi <= 24.9)
          status = "Normal Weight";
        else if (_bmi >= 25 && _bmi <= 29.9)
          status = "Over Weight";
        else
          status = "Obese";
      } else
        status = "input all values";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            'BMI calculator',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(_margin),
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'images/bmi.png',
                  width: 200.0,
                  height: 150.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: _margin),
                  child: Container(
                    padding: EdgeInsets.all(_margin * 2),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _ageController,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              hintText: 'Enter Age',
                              icon: Icon(Icons.person)),
                        ),
                        Padding(padding: EdgeInsets.all(_margin)),
                        TextField(
                          controller: _heightController,
                          decoration: InputDecoration(
                              labelText: 'Height',
                              hintText: 'in cms',
                              icon: Icon(Icons.view_column)),
                        ),
                        Padding(padding: EdgeInsets.all(_margin)),
                        TextField(
                          controller: _weightController,
                          decoration: InputDecoration(
                              labelText: 'Weight',
                              hintText: 'in Kgs',
                              icon: Icon(Icons.android)),
                        ),
                        Padding(padding: EdgeInsets.all(_margin * 3)),
                        Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.purple,
                            onPressed: calculateBmi,
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(_margin)),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'BMI is ${_bmi.toStringAsFixed(1)}',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.green),
                    )),
                Padding(padding: EdgeInsets.all(_margin * 2)),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$status',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange),
                    )),
              ],
            ),
          ),
        ));
  }
}

// ========== State Class Ends here ==========
