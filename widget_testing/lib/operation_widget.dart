import 'package:flutter/material.dart';
import 'package:widget_testing/calculator.dart';
import 'package:widget_testing/operation.dart';

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
  final _topTextController = TextEditingController();
  final _bottomTextController = TextEditingController();

  String _operationResult = '';
  String _resultAfterAnimation = '';

  @override
  void initState() {
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
          AnimatedContainer(
            padding: const EdgeInsets.all(8),
            duration: const Duration(milliseconds: 1000),
            onEnd: () {
              setState(() {
                _resultAfterAnimation = _operationResult.toString();
              });
            },
            color: _operationResult.isEmpty ? Colors.transparent : Colors.green,
            curve: Curves.easeInOut,
            child: Text(
              _resultAfterAnimation.isNotEmpty
                  ? 'Result: $_resultAfterAnimation'
                  : 'Result: ',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.end,
            ),
          ),
          // Text(
          //   'Result: $_operationResult',
          //   style: Theme.of(context).textTheme.titleLarge,
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
