import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("My first app"),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 42, 42),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network('https://picsum.photos/350'),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 42, 42),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF42A5F5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 42, 42),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.access_alarm, size: 40, color: Color(0xFF42A5F5)),
                    SizedBox(width: 25),
                    Icon(Icons.accessibility, size: 40, color: Color(0xFF42A5F5)),
                    SizedBox(width: 25),
                    Icon(Icons.account_balance, size: 40, color: Color(0xFF42A5F5)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                iconColor: Color(0xFF42A5F5),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 24),
              ),
              child: Text('Click Me'),
            ),
            CounterCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF42A5F5),
        child: Text('click'),
      ),
    ),
  ));
}

class CounterCard extends StatefulWidget {
  const CounterCard({super.key});

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int _counter = 0; // This is the state (data) that changes.

  void _incrementCounter() {
    setState(() {
      _counter++; // Update the state.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.cyan[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Counter here: $_counter", style: TextStyle(fontSize: 16)),
          Container(
            color: Colors.cyan[200],
            padding: EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: _incrementCounter,
              icon: Icon(Icons.add, color: Colors.black, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
