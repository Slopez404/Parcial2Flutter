import 'package:flutter/material.dart';
void main() => runApp(FibonacciCal());


class FibonacciCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci',
      home: FibonacciHome(),
    );
  }
}



class FibonacciHome extends StatefulWidget {
  @override
  _FibonacciHomeState createState() => _FibonacciHomeState();
}

class _FibonacciHomeState extends State<FibonacciHome> {
  late int _fibonacciNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 149, 55, 5),
        title: Text('Cálculo Fibonacci'),
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número a calcular',
              ),
              onChanged: (value) {
                setState(() {
                  _fibonacciNumber = int.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: (){
                if (_fibonacciNumber != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('El resultado de la secuencia es'),
                        content: Text(_calculateFibonacci()),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } 
              },
              
              child: Text('Calcular Secuencia'),
              style: ElevatedButton.styleFrom(
    primary: Color.fromRGBO(232, 90, 35, 1),
  ),
            ),
          ],
        ),
      ),
    );
  }


  String _calculateFibonacci() {
    if (_fibonacciNumber == 0) return '0';
    if (_fibonacciNumber == 1) return '0, 1';
    List<int> sequence = [0, 1];
    for (int i = 2; i <= _fibonacciNumber; i++) {
      sequence.add(sequence[i - 2] + sequence[i - 1]);
    }
    return sequence.join(', ');
  }
}