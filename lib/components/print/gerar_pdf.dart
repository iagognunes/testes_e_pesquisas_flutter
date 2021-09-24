import 'package:uuid/uuid.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

class ImprimirVoucher extends StatefulWidget {
  const ImprimirVoucher({Key? key}) : super(key: key);

  @override
  _ImprimirVoucherState createState() => _ImprimirVoucherState();
}

class _ImprimirVoucherState extends State<ImprimirVoucher> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => _generatePdf(format),
      pdfFileName: 'Voucher',
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    var uuid = const Uuid().v4();
    final ByteData logo =
        await rootBundle.load('assets/images/simbolo-lider.png');
    final Uint8List imageLogo = logo.buffer.asUint8List();

    final ByteData qr = await rootBundle.load('assets/images/qrCode.png');
    final Uint8List qrCode = qr.buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.Container(
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
                    pw.Text('Nome do Cliente: Iago Guedelha Nunes'),
                    pw.Text('CPF do Cliente: 451.854.789.25'),
                    pw.Text('Valor do resgate: R\$ 25,00'),
                    pw.Text('Data: 23/09/2021'),
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
              ),
              pw.Text(
                  '------------------------------------------------------------------------------------------------------------------------'),
              pw.Container(
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
                    pw.Text('Nome do Cliente: Iago Guedelha Nunes'),
                    pw.Text('CPF do Cliente: 451.854.789.25'),
                    pw.Text('Valor do resgate: R\$ 25,00'),
                    pw.Text('Data: 23/09/2021'),
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
              ),
              pw.Text(
                  '------------------------------------------------------------------------------------------------------------------------'),
              pw.Container(
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
                    pw.Text('Nome do Cliente: Iago Guedelha Nunes'),
                    pw.Text('CPF do Cliente: 451.854.789.25'),
                    pw.Text('Valor do resgate: R\$ 25,00'),
                    pw.Text('Data: 23/09/2021'),
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
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
