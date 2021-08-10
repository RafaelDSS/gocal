import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gocal/pages/components.dart';
import 'package:gocal/pages/result.dart';
import 'package:gocal/models.dart';
import 'package:gocal/utils.dart';

class InputBasalInfoPage extends StatefulWidget {
  final name;
  InputBasalInfoPage({Key? key, this.name}) : super(key: key);

  @override
  _InputBasalInfoPageState createState() => _InputBasalInfoPageState();
}

class _InputBasalInfoPageState extends State<InputBasalInfoPage> {
  final BasalModel basalmodel = BasalModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Olá,\n',
                      style: styleBase.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: widget.name,
                      style: styleBase.copyWith(
                        color: Color(0xff37B874),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              Text(
                "Vamos calcular o seu gasto\nenergético basal!",
                style: styleBase.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 17),
              DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: inputDecorationTextform("Seu sexo"),
                items: [
                  DropdownMenuItem(
                    child: Text("Masculino"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Feminino"),
                    value: 2,
                  )
                ],
                onChanged: (int? value) {
                  basalmodel.sexo = value!;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, escolha uma das opções.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: inputDecorationTextform("Sua idade"),
                onChanged: (value) {
                  basalmodel.idade = int.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua idade.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: inputDecorationTextform("Seu peso"),
                onChanged: (value) {
                  basalmodel.peso = double.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu peso.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // keyboardType: TextInputType.number,
                decoration: inputDecorationTextform("Sua altura"),
                onChanged: (value) {
                  basalmodel.altura = double.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua altura.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:
                    inputDecorationTextform("Seu nível de atividade física"),
                items: [
                  DropdownMenuItem(
                    child: Text("Leve"),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("Moderada"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Intensa"),
                    value: 2,
                  ),
                ],
                onChanged: (int? value) {
                  basalmodel.codigoNivelAtividade = value!;
                },
                validator: (int? value) {
                  if (value == null) {
                    return 'Por favor, escolha uma das opções.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              button(
                title: "Calcular",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ResultBasalModel result;
                    result = calcGastoEnergeticoBasal(basalmodel);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(result: result),
                      ),
                    );
                  }
                },
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    "Voltar",
                    style: styleBase.copyWith(
                      color: Color(0xff37B874),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
