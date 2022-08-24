import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:mocktail_example/calculator.dart';
import 'package:mocktail_example/operation.dart';
import 'package:mocktail_example/service/number_api_service.dart';

class OperationWidget extends StatefulWidget {
  final Operation operation;
  final Calculator calculator;

  const OperationWidget(
      {Key? key, required this.operation, required this.calculator})
      : super(key: key);

  @override
  State<OperationWidget> createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {
  late NumberApiService _numberApiService;
  
  final _topTextController = TextEditingController();
  final _bottomTextController = TextEditingController();

  String _operationResult = '';
  final String _resultAfterAnimation = '';
  String numberInfo = '';

  @override
  void initState() {
    _numberApiService = NumberApiService(client: http.Client());
    _topTextController.addListener(_getResult);
    _bottomTextController.addListener(_getResult);
    super.initState();
  }

  @override
  void dispose() {
    _topTextController.dispose();
    _bottomTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(
        widget.operation.descriptionOperation,
        style: const TextStyle(fontSize: 20),
      ),
      leading:  widget.operation.iconOperation,
      subtitle: Column(
        children: [
          TextField(
            key: Key('textField_top_${widget.operation.descriptionOperation}'),
            controller: _topTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter 1st number'),
          ),
          TextField(
            key: Key('textField_bottom_${widget.operation.descriptionOperation}'),
            controller: _bottomTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter 2nd number'),
          ),
          const SizedBox(height: 20),
          Text(
            'Result: $_operationResult',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          Text(
            numberInfo,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),

          ElevatedButton(
            key:
                Key('elevated_button_${widget.operation.descriptionOperation}'),
            child: const Text('Get Number Info'),
            onPressed: () async {
              if (_operationResult.isNotEmpty) {
                var value = await _numberApiService
                    .getNumberFact((double.parse(_operationResult)).round());

                setState(() {
                  numberInfo = value.text;
                });
              }
            },
          ),

          // AnimatedContainer(
          //   padding: const EdgeInsets.all(8),
          //   duration: const Duration(milliseconds: 1000),
          //   onEnd: () {
          //     setState(() {
          //       _resultAfterAnimation = _operationResult.toString();
          //     });
          //   },
          //   color: _operationResult.isEmpty ? Colors.transparent : Colors.green,
          //   curve: Curves.easeInOut,
          //   child: Text(
          //     _resultAfterAnimation.isNotEmpty
          //         ? 'Result: $_resultAfterAnimation'
          //         : 'Result: ',
          //     style: Theme.of(context).textTheme.bodyText1,
          //     textAlign: TextAlign.end,
          //   ),
          // ),
          
        ],
      ),
    );
  }

  void _getResult() {
    try {
      final result = _calculate(
        double.tryParse(_topTextController.text)!,
        double.tryParse(_bottomTextController.text)!,
      );
      setState(() {
        _operationResult = result.toString();
      });
    } catch (_) {
      setState(() {
        _operationResult = '';
      });
    }
  }

  double _calculate(double top, double bottom) {
    double result;
    switch (widget.operation) {
      case Operation.add:
        result = widget.calculator.add(top, bottom);
        break;
      case Operation.substract:
        result = widget.calculator.substract(top, bottom);
        break;
      case Operation.multiply:
        result = widget.calculator.multiply(top, bottom);
        break;
      case Operation.divide:
        result = widget.calculator.divide(top, bottom);
        break;
    }
    return result;
  }
}
