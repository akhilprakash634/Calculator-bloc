import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_event.dart';
import '../bloc/calculator_state.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  return Text(
                    state.display,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, '1'),
                    buildButton(context, '2'),
                    buildButton(context, '3'),
                    buildButton(context, ' + '),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, '4'),
                    buildButton(context, '5'),
                    buildButton(context, '6'),
                    buildButton(context, ' - '),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, '7'),
                    buildButton(context, '8'),
                    buildButton(context, '9'),
                    buildButton(context, ' * '),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, 'C'),
                    buildButton(context, '0'),
                    buildButton(context, ' = '),
                    buildButton(context, ' / '),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[900],
    );
  }

  Widget buildButton(BuildContext context, String value) {
    return Container(
      height: 80.0,
      width: 90,
      child: FilledButton(
        onPressed: () {
          if (value == ' = ') {
            BlocProvider.of<CalculatorBloc>(context).add(EqualsPressed());
          } else if (value == 'C') {
            BlocProvider.of<CalculatorBloc>(context).add(ClearPressed());
          } else {
            BlocProvider.of<CalculatorBloc>(context).add(NumberPressed(value));
          }
        },
        style: FilledButton.styleFrom(
            padding: EdgeInsets.only(left: 2, right: 2, top: 0, bottom: 0),
            backgroundColor: (value == ' + ' ||
                    value == ' - ' ||
                    value == ' * ' ||
                    value == ' / ' ||
                    value == ' = ' ||
                    value == 'C')
                ? Colors.grey
                : Colors.orange[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Text(
          value,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
