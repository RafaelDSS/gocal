import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gocal/pages/input.dart';
import 'package:gocal/pages/components.dart';

const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: const Color(0xffF3F3F3),
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? name;

    Future.delayed(Duration(microseconds: 500), () {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });

    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Para começar \ncomo podemos te chamar?",
                style: styleBase.copyWith(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: inputDecorationTextform("Digite o seu nome"),
                onChanged: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu nome.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              button(
                title: "Avançar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputBasalInfoPage(name: name),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
