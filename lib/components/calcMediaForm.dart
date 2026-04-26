import 'package:flutter/material.dart';

class CalcMediaForm extends StatefulWidget {
  const CalcMediaForm({super.key});

  @override
  State<CalcMediaForm> createState() => _CalcMediaFormState();
}

class _CalcMediaFormState extends State<CalcMediaForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nota1Controller = TextEditingController();
  final _nota2Controller = TextEditingController();
  final _nota3Controller = TextEditingController();

  String _resultNome = '';
  String _resultEmail = '';
  String _resultNota1 = '-';
  String _resultNota2 = '-';
  String _resultNota3 = '-';
  double? _averageResult;

  void _calculateAverage() {
    setState(() {
      _resultNome = _nameController.text;
      _resultEmail = _emailController.text;

      final n1 = double.tryParse(_nota1Controller.text) ?? 0;
      final n2 = double.tryParse(_nota2Controller.text) ?? 0;
      final n3 = double.tryParse(_nota3Controller.text) ?? 0;

      _resultNota1 = n1.toString();
      _resultNota2 = n2.toString();
      _resultNota3 = n3.toString();
      _averageResult = (n1 + n2 + n3) / 3;
    });
  }

  void clearFields() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _nota1Controller.clear();
      _nota2Controller.clear();
      _nota3Controller.clear();

      _resultNome = '';
      _resultEmail = '';
      _resultNota1 = '-';
      _resultNota2 = '-';
      _resultNota3 = '-';
      _averageResult = null;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nota1Controller.dispose();
    _nota2Controller.dispose();
    _nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Title(titleText: 'Calculadora de Média'),

          SizedBox(height: 8),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Digite seu nome',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 8),

          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Digite seu email',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nota1Controller,
                  decoration: const InputDecoration(
                    labelText: 'Nota 1',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: TextField(
                  controller: _nota2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Nota 2',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: TextField(
                  controller: _nota3Controller,
                  decoration: const InputDecoration(
                    labelText: 'Nota 3',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _calculateAverage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Calcular média',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const Title(titleText: 'Resultado:'),

          SizedBox(height: 8),

          Text('Nome: $_resultNome'),
          Text('E-mail: $_resultEmail'),
          Text('Notas:  $_resultNota1  -  $_resultNota2 -  $_resultNota3'),
          Text(
            'Média: ${_averageResult != null ? _averageResult!.toStringAsFixed(2) : ''}',
          ),

          SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: clearFields,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Apagar campos',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String titleText;

  const Title({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
