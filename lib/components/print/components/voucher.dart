// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:uuid/uuid.dart';

Voucher(
  String nome,
  String cpf,
  String valor,
  imageLogo,
  qrCode,
) {
  
  var uuid = const Uuid().v4();
  DateTime now = DateTime.now();
  var formatter = DateFormat('dd/MM/yy');
  String date = formatter.format(now);

  return pw.Container(
    // decoration: pw.BoxDecoration(border: pw.Border.all()),
    child: pw.Column(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(
                pw.MemoryImage(imageLogo),
                height: 50,
                width: 50,
              ),
              pw.Text('Via da Atendente')
            ],
          ),
        ),
        pw.Text('Nome do Cliente: ' + nome),
        pw.Text('CPF do Cliente: ' + cpf),
        pw.Text('Valor do resgate: R\$ ' + valor),
        pw.Text('Data: ' + date.toString()),
        pw.Text('Nome da Atendente: Camila da Silva'),
        pw.Text('Nome do Gerente: Leonardo Peixoto'),
        pw.Padding(
          padding: const pw.EdgeInsets.only(top: 10),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.Column(
                children: [
                  pw.Text(
                    '_____________________________  ',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Assinatura do Gerente',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
              pw.Column(
                children: [
                  pw.Text(
                    '_____________________________  ',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Assinatura do Atendente',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
              pw.Column(
                children: [
                  pw.Text(
                    '_____________________________  ',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Assinatura do Cliente',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ],
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(10),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('ID: ' + uuid),
              pw.Image(
                pw.MemoryImage(qrCode),
                height: 50,
                width: 50,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
