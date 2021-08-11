import 'package:flutter/material.dart';
import 'package:gocal/models.dart';

import 'package:gocal/pages/components.dart';
import 'package:gocal/pages/home.dart';

class ResultsPage extends StatelessWidget {
  final ResultBasalModel result;
  const ResultsPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Aqui está o seu\n',
                      style: styleBase.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "resultado",
                      style: styleBase.copyWith(
                        color: Color(0xff37B874),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              customListTextSpan(
                [
                  "Seu ",
                  "metabolismo basal ",
                  "é de:\n",
                  "${result.metabolismoBasal} calorias.",
                ],
              ),
              SizedBox(height: 30),
              customListTextSpan(
                [
                  "Para ",
                  "manter o seu peso ",
                  "você\nprecisa consumir em média:\n",
                  "${result.caloriasParaManterPeso} calorias."
                ],
              ),
              SizedBox(height: 30),
              customListTextSpan(
                [
                  "Para ",
                  "perder peso ",
                  "você precisa\nconsumir em média:\n",
                  "${result.caloriasParaPerderPeso} calorias."
                ],
              ),
              SizedBox(height: 30),
              customListTextSpan(
                [
                  "Para ",
                  "ganhar peso ",
                  "você precisa\nconsumir em média:\n",
                  "${result.caloriasParaGanharPeso} calorias."
                ],
              ),
              SizedBox(height: 100),
              button(
                title: "Reiniciar",
                onPressed: () => {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
