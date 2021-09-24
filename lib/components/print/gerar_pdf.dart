import 'package:flutter/cupertino.dart';
import 'package:testes_e_pesquisas_flutter/components/DataTableDemo/data_table_demo.dart';
import 'package:testes_e_pesquisas_flutter/components/print/components/voucher.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

class ImprimirVoucher extends StatefulWidget {
  final String nome, cpf, valor;
  const ImprimirVoucher(
      {Key? key, required this.nome, required this.cpf, required this.valor})
      : super(key: key);

  @override
  _ImprimirVoucherState createState() => _ImprimirVoucherState();
}

class _ImprimirVoucherState extends State<ImprimirVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 1500,
          width: 1000,
          child: PdfPreview(
            build: (format) =>
                _generatePdf(format, widget.nome, widget.cpf, widget.valor),
            pdfFileName: 'Voucher',
            onPrinted: (context) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const MyStatelessWidget()),
                  (Route<dynamic> route) => false);
            },
            allowSharing: false,
            canChangeOrientation: false,
            canChangePageFormat: false,
            canDebug: false,
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, String nome, String cpf, String valor) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

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
              Voucher(nome, cpf, valor, imageLogo, qrCode),
              pw.Text(
                  '------------------------------------------------------------------------------------------------------------------------'),
              Voucher(nome, cpf, valor, imageLogo, qrCode),
              pw.Text(
                  '------------------------------------------------------------------------------------------------------------------------'),
              Voucher(nome, cpf, valor, imageLogo, qrCode),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
