import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gocal/pages/components.dart';
import 'package:gocal/pages/result.dart';
import 'package:gocal/models.dart';
import 'package:gocal/utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputBasalInfoPage extends StatelessWidget {
  final name;
  InputBasalInfoPage({Key? key, this.name}) : super(key: key);

  final BasalModel basalmodel = BasalModel();
  final _formKey = GlobalKey<FormState>();
  final maskFormatter =
      new MaskTextInputFormatter(mask: '#,##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                      text: name,
                      style: styleBase.copyWith(
                        color: Color(0xff37B874),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Text(
                "Vamos calcular o seu gasto\nenergético basal!",
                style: styleBase.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
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
                maxLength: 3,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: inputDecorationTextform("Sua idade"),
                onSaved: (value) {
                  basalmodel.idade = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua idade. Ex: 20';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLength: 3,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: inputDecorationTextform("Seu peso"),
                onSaved: (value) {
                  basalmodel.peso = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu peso. Ex: 78';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.go,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: [maskFormatter],
                decoration: inputDecorationTextform("Sua altura"),
                onSaved: (value) {
                  basalmodel.altura = double.parse(value!.replaceAll(",", "."));
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua altura. Ex: 1,75';
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
              SizedBox(height: 20),
              button(
                title: "Calcular",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
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
