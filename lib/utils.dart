import 'package:gocal/models.dart';

const HOMEM = 1;
const MULHER = 2;

ResultBasalModel calcGastoEnergeticoBasal(BasalModel basalModel) {
  ResultBasalModel result = ResultBasalModel();
  double metabolismoBasal;
  Map valoresNivelAtividadeFisica = {
    HOMEM: [1.56, 1.78, 2.10],
    MULHER: [1.56, 1.64, 1.82]
  };

  if (basalModel.sexo == HOMEM) {
    metabolismoBasal = 66.5 +
        (13.75 * basalModel.peso) +
        (5.0 * (basalModel.altura * 100)) -
        (6.8 * basalModel.idade);
  } else {
    metabolismoBasal = 665.1 +
        (9.56 * basalModel.peso) +
        (1.8 * (basalModel.altura * 100)) -
        (4.7 * basalModel.idade);
  }

  double nivelAtividade = valoresNivelAtividadeFisica[basalModel.sexo]
      [basalModel.codigoNivelAtividade];

  result.metabolismoBasal = metabolismoBasal.round();
  result.caloriasParaManterPeso = (metabolismoBasal * nivelAtividade).round();
  result.caloriasParaGanharPeso =
      (metabolismoBasal * nivelAtividade * 1.15).round();
  result.caloriasParaPerderPeso =
      (metabolismoBasal * nivelAtividade * 0.85).round();
  return result;
}
