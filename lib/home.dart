import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double icon_S = 300;
  double red = 0;
  double blue = 0;
  double green = 0;

  bool isChecked1 = true;
  bool isChecked2 = true;
  var resize;
  var color;

  void changeRed(value, [bool reset = false]) {
    if (isChecked2) {
      setState(() {
        if (reset) {
          green = 0;
          blue = 0;
        }
        red = value;
      });
    }
  }

  void changeBlue(value, [bool reset = false]) {
    if (isChecked2) {
      setState(() {
        if (reset) {
          green = 0;
          red = 0;
        }
        blue = value;
      });
    }
  }

  void changeGreen(value, [bool reset = false]) {
    if (isChecked2) {
      setState(() {
        if (reset) {
          red = 0;
          blue = 0;
        }
        green = value;
      });
    }
  }

  void _changeSize(double v) {
    icon_S = v;
  }

  void _changeSizep() {
    icon_S += 50;
  }

  void _changeSizem() {
    icon_S -= 50;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Icon'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (isChecked1) _changeSizem();
              });
            },
          ),
          IconButton(
            icon: const Text("S"),
            onPressed: () {
              setState(() {
                if (isChecked1) _changeSize(100);
              });
            },
          ),
          IconButton(
            icon: const Text("M"),
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              setState(() {
                if (isChecked1) _changeSize(300);
              });
            },
          ),
          IconButton(
            icon: const Text("L"),
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              setState(() {
                if (isChecked1) _changeSize(500);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              setState(() {
                if (isChecked1) _changeSizep();
              });
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            CheckboxListTile(
              title: const Text('Allow Resize?'),
              value: resize != 1.0,
              onChanged: (bool? value) {
                setState(() {
                  resize = value! ? 10.0 : 1.0;
                  isChecked1 = !isChecked1;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Allow change primary color?'),
              value: color != 1.0,
              onChanged: (bool? value) {
                setState(() {
                  color = value! ? 10.0 : 1.0;
                  isChecked2 = !isChecked2;
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.alarm,
              size: icon_S,
              color:
                  Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        width: 100,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Slider(
                    value: red,
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      if (isChecked2) setState(() => red = value);
                    },
                    divisions: 255,
                    activeColor: Colors.red,
                  )),
                  FloatingActionButton(
                    child: Text(red.toString()),
                    onPressed: () {
                      if (isChecked2) setState(() => red = 255);
                    },
                    backgroundColor: Colors.red,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Slider(
                    value: green,
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      if (isChecked2) setState(() => green = value);
                    },
                    divisions: 255,
                    activeColor: Colors.green,
                  )),
                  FloatingActionButton(
                    child: Text(green.toString()),
                    onPressed: () {
                      if (isChecked2) setState(() => green = 255);
                    },
                    backgroundColor: Colors.green,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Slider(
                    value: blue,
                    min: 0,
                    max: 255,
                    onChanged: (value) {
                      if (isChecked2) setState(() => blue = value);
                    },
                    divisions: 255,
                    activeColor: Colors.blue,
                  )),
                  FloatingActionButton(
                    child: Text(blue.toString()),
                    onPressed: () {
                      if (isChecked2) setState(() => blue = 255);
                    },
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final MaterialColor color;
  final Function chgColor;

  ColorSlider(this.color, this.chgColor);

  @override
  Widget build(BuildContext context) {
    double value = 0;
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: (newvalue) => {
              setState(() => value = newvalue),
              chgColor(newvalue),
            },
          ),
          flex: 8,
        ),
        Expanded(
          child: FloatingActionButton(
            child: Text("123"),
            backgroundColor: color,
            onPressed: () {},
          ),
          flex: 8,
        ),
      ],
    );
  }

  setState(double Function() param0) {}
}

class _myValue {}
