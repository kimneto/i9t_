import 'dart:typed_data';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CompartilhaPage extends StatelessWidget {
  const CompartilhaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FctModel fctModel = ModalRoute.of(context)?.settings.arguments as FctModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: brancoi9t,
            ),
            onPressed: () {
              Modular.to.pop();
            }),
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: pretoi9t,
        centerTitle: false,
        title: Container(
          child: Text(
            'PDF',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: brancoi9t, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Theme(
        data: ThemeData(primaryColor: pretoi9t),
        child: PdfPreview(
          canDebug: false,
          allowPrinting: false,
          canChangeOrientation: true,
          pdfPreviewPageDecoration: BoxDecoration(
            color: brancoi9t,
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          initialPageFormat: PdfPageFormat.a4.landscape,
          canChangePageFormat: false,
          build: (format) =>
              _generatePdf(format.landscape, 'FCT 001', fctModel),
        ),
      ),
    );
  }

//
  Future<Uint8List> _generatePdf(
      PdfPageFormat format, String title, FctModel fctModel) async {
    final pdf = pw.Document(
        version: PdfVersion.pdf_1_5,
        compress: true,
        theme: pw.ThemeData(
            textAlign: pw.TextAlign.center,
            defaultTextStyle: pw.TextStyle(font: pw.Font.times())));

    final brasao = pw.MemoryImage(
      (await rootBundle.load('assets/image/brasao.png')).buffer.asUint8List(),
    );
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.only(top: 13, left: 18),
        pageFormat: format,
        build: (context) {
          return pw.Row(children: [
            //PAGINA 01
            pw.Column(children: [
              pw.Container(
                  child: pw.Column(children: [
                pw.Row(children: [
                  pw.Column(children: [
                    pw.Row(
                      children: [
                        pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(10, 0, 8, 4),
                          height: 76.41,
                          width: 77.825,
                          decoration: tabela(),
                          //BRASAO
                          child: pw.Image(brasao, height: 68),
                        ),
                        pw.Container(
                          height: 76.41,
                          width: 166.97,
                          decoration: tabela(),
                          //SECRETARIA
                          child: pw.Column(
                            children: [
                              pw.Container(
                                height: 24.0,
                                width: 166.97,
                                decoration: tabela(),
                                padding: pw.EdgeInsets.only(top: 10, left: 2),
                                child: pw.Text(
                                    'Secretaria ...........................................',
                                    style: pw.TextStyle(fontSize: 10)),
                              ),
                              pw.Container(
                                padding: pw.EdgeInsets.only(
                                    left: 2, top: 10, right: 2),
                              ),
                              pw.Column(
                                children: [
                                  pw.Text(
                                      'Subfrota..............................................',
                                      style: pw.TextStyle(fontSize: 10)),
                                  pw.SizedBox(height: 10),
                                  pw.Text(
                                      'Cidade.................................................',
                                      style: pw.TextStyle(fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ),
                        pw.Container(
                          height: 76.41,
                          width: 121.69,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.Text(
                                    'Autenticação Mecânica\nPartida\n(data hora)\n................................................\nretorno\n(data e hora)\n................................................',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 9.5)),
                              ]),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 14.15),
                    //NUMERO DA FICHA
                    pw.Container(
                      width: 365,
                      height: 22.5,
                      padding: pw.EdgeInsets.only(top: 5),
                      decoration: tabela(),
                      child: pw.Text(
                          'Controle de Tráfego Nº                                                     (Decreto nº 979, de 23-1-1973)',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(fontSize: 10)),
                    ),
                    pw.SizedBox(height: 7.15),
                    //PLACA PATRIMONIO TIPO
                    pw.Container(
                      width: 365,
                      decoration: tabela(),
                      child: pw.Row(
                        children: [
                          pw.Column(
                            children: [
                              pw.Container(
                                width: 96.22,
                                height: 11.32,
                                decoration: tabela(),
                                child: pw.Text('PLACA',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 10)),
                              ),
                              pw.Container(
                                width: 96.22,
                                height: 15.0,
                                decoration: tabela(),
                              )
                            ],
                          ),
                          pw.Column(
                            children: [
                              pw.Container(
                                width: 93.39,
                                height: 11.32,
                                decoration: tabela(),
                                child: pw.Text('PATRIMÔNIO',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 10)),
                              ),
                              pw.Container(
                                width: 93.39,
                                height: 15.0,
                                decoration: tabela(),
                              )
                            ],
                          ),
                          pw.Column(
                            children: [
                              pw.Container(
                                width: 93.39,
                                height: 11.32,
                                decoration: tabela(),
                                child: pw.Text('TIPO',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 10)),
                              ),
                              pw.Container(
                                width: 93.39,
                                height: 15.0,
                                decoration: tabela(),
                              )
                            ],
                          ),
                          pw.Column(
                            children: [
                              pw.Container(
                                width: 81.9,
                                height: 11.32,
                                decoration: tabela(),
                                child: pw.Text('GRUPO',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(fontSize: 10)),
                              ),
                              pw.Container(
                                width: 81.9,
                                height: 15.0,
                                decoration: tabela(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    pw.Container(
                      width: 365,
                      height: 62.26,
                      decoration: tabela(),
                      padding: pw.EdgeInsets.only(left: 8, right: 0),
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Stack(children: [
                            pw.Container(
                                // color: PdfColor.fromHex('#111111'),
                                padding: pw.EdgeInsets.symmetric(
                                    vertical: -1.5, horizontal: 0),
                                margin: pw.EdgeInsets.only(bottom: 1, left: 50),
                                child: pw.Text(
                                  '${fctModel.condutorModel!.nome}      CPF: ${formataCpf(fctModel.condutorModel!.cpf ?? 'Erro')}',
                                  style: pw.TextStyle(fontSize: 9),
                                )),
                            pw.Text(
                                'Condutor: ..........................................................................................................................',
                                style: pw.TextStyle(fontSize: 10)),
                          ]),
                          pw.Text(
                              'Apresentar-se em ..............................................às....................horas e................minutos',
                              style: pw.TextStyle(fontSize: 10)),
                          pw.Text(
                              'Ao Sr ................................................................................................................................',
                              style: pw.TextStyle(fontSize: 10)),
                          pw.Stack(children: [
                            pw.Container(
                              // color: PdfColor.fromHex('#111111'),
                              padding: pw.EdgeInsets.symmetric(
                                  vertical: -1.5, horizontal: 230),
                              margin: pw.EdgeInsets.only(bottom: 1, left: 20),
                              child: pw.Text(
                                '${fctModel.condutorModel!.codUnidade}',
                                style: pw.TextStyle(fontSize: 9),
                              ),
                            ),
                            pw.Text(
                                'Função ..................................................................Unidade..............................................',
                                style: pw.TextStyle(fontSize: 10))
                          ]),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 2.83),
                    pw.Container(
                      child: pw.Row(children: [
                        pw.Container(
                          width: 135.84,
                          height: 70.85,
                          decoration: tabela(),
                          child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Container(
                                height: 16,
                                width: 55.84,
                                margin: pw.EdgeInsets.only(left: 5),
                                child: pw.Transform.rotateBox(
                                  angle: 1.57,
                                  child: pw.Text(
                                    'Quilometragem',
                                    textDirection: pw.TextDirection.rtl,
                                    style: pw.TextStyle(fontSize: 8),
                                  ),
                                ),
                              ),
                              pw.Container(
                                height: 71.85,
                                decoration: tabela(),
                                child: pw.Column(
                                  children: [
                                    pw.Container(
                                      width: 115.0,
                                      height: 19.5,
                                      padding: pw.EdgeInsets.only(top: 7),
                                      decoration: tabela(),
                                      child: pw.Text(
                                        'HODOMÊTRO',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    pw.Row(children: [
                                      pw.Container(
                                          child: pw.Text(
                                            ' Retorno',
                                            textAlign: pw.TextAlign.left,
                                            style: pw.TextStyle(fontSize: 9),
                                          ),
                                          width: 49.43,
                                          height: 16.98,
                                          decoration: tabela()),
                                      pw.Container(
                                          width: 65,
                                          height: 16.98,
                                          decoration: tabela()),
                                    ]),
                                    pw.Row(children: [
                                      pw.Container(
                                          child: pw.Text(
                                            ' Partida',
                                            textAlign: pw.TextAlign.left,
                                            style: pw.TextStyle(fontSize: 9),
                                          ),
                                          width: 49.43,
                                          height: 16.98,
                                          decoration: tabela()),
                                      pw.Container(
                                          width: 65,
                                          height: 16.98,
                                          decoration: tabela()),
                                    ]),
                                    pw.Row(children: [
                                      pw.Container(
                                          child: pw.Text(
                                            ' Diferença',
                                            textAlign: pw.TextAlign.left,
                                            style: pw.TextStyle(fontSize: 9),
                                          ),
                                          width: 49.43,
                                          height: 16.98,
                                          decoration: tabela()),
                                      pw.Container(
                                          width: 65,
                                          height: 16.98,
                                          decoration: tabela()),
                                    ]),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 45),
                        pw.Container(
                          width: 183.95,
                          height: 70.85,
                          decoration: tabela(),
                          child: pw.Row(children: [
                            pw.Container(
                              height: 20,
                              width: 58.84,
                              margin: pw.EdgeInsets.only(left: 5),
                              child: pw.Transform.rotateBox(
                                angle: 1.57,
                                child: pw.Text(
                                  'Abastecimento',
                                  textAlign: pw.TextAlign.center,
                                  textDirection: pw.TextDirection.rtl,
                                  style: pw.TextStyle(fontSize: 9),
                                ),
                              ),
                            ),
                            pw.Column(children: [
                              pw.Row(children: [
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Natureza',
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 53.77,
                                    height: 12,
                                    decoration: tabela()),
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Quantidade',
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 62.26,
                                    height: 12,
                                    decoration: tabela()),
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Req. Nº',
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 42.45,
                                    height: 12,
                                    decoration: tabela()),
                              ]),
                              pw.Row(children: [
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Gasolina',
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 53.77,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 62.26,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 42.45,
                                    height: 19.6,
                                    decoration: tabela()),
                              ]),
                              pw.Row(children: [
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Óleo',
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 53.77,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 62.26,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 42.45,
                                    height: 19.6,
                                    decoration: tabela()),
                              ]),
                              pw.Row(children: [
                                pw.Container(
                                    child: pw.Center(
                                      child: pw.Text(
                                        'Diesel',
                                        style: pw.TextStyle(fontSize: 9),
                                      ),
                                    ),
                                    width: 53.77,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 62.26,
                                    height: 19.6,
                                    decoration: tabela()),
                                pw.Container(
                                    width: 42.45,
                                    height: 19.6,
                                    decoration: tabela()),
                              ]),
                            ])
                          ]),
                        ),
                      ]),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.centerRight,
                      width: 365,
                      height: 49.52,
                      child: pw.Text(
                        '.................................................................\nEXPEDIDOR',
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ),
                    pw.Container(
                      width: 365,
                      height: 200.93,
                      decoration: tabela(),

                      //O USUARIO PREENCHERA
                      child: pw.Column(
                        children: [
                          pw.Container(
                            width: 365,
                            decoration: tabela(),
                            child: pw.Text(
                              'O USUÁRIO PREENCHERÁ',
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ),
                          pw.Container(
                              padding: pw.EdgeInsets.only(
                                  left: 20, top: 15, right: 20),
                              width: 365,
                              child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.stretch,
                                children: [
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'O veículo foi apresentado na hora e no local certos?      sim      ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                      pw.Container(
                                        width: 6,
                                        height: 6,
                                        decoration: tabela(),
                                      ),
                                      pw.Text(
                                        '         não    ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                      pw.Container(
                                        width: 6,
                                        height: 6,
                                        decoration: tabela(),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Dispensado às ............ horas ...........minutos',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Local: ......................................................................................................................',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Nova Apresentação?      ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                      pw.Text(
                                        '        sim      ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                      pw.Container(
                                        width: 6,
                                        height: 6,
                                        decoration: tabela(),
                                      ),
                                      pw.Text(
                                        '                     não    ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                      pw.Container(
                                        width: 6,
                                        height: 6,
                                        decoration: tabela(),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Especificar para o caso de sim: dia - hora - local ',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        '.................................................................................................................................',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Considerações gerais sobre o veículo condutor: e/ou',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        '.................................................................................................................................',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        '.................................................................................................................................',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        '.................................................................................................................................',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Column(children: [
                                        pw.Text(
                                          '                                                                        .........................................................',
                                          style: pw.TextStyle(fontSize: 10),
                                        ),
                                        pw.SizedBox(height: 3),
                                        pw.Text(
                                          '                                                                            USUÁRIO',
                                          style: pw.TextStyle(fontSize: 10),
                                        ),
                                      ])
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    pw.Container(
                        width: 365,
                        height: 7.15,
                        child: pw.Row(children: [
                          pw.Text('     PM - L9',
                              style: pw.TextStyle(fontSize: 10)),
                          pw.Text(
                              '                                                                                           Gerado através do aplicativo i9t - CPI-9',
                              style: pw.TextStyle(fontSize: 8))
                        ])),
                  ]),
                  pw.Column(),
                ]),
              ])),
            ]),
            pw.SizedBox(width: 10),
            //PAGINA 02
            pw.Column(children: [
              pw.Container(
                child: pw.Column(
                  children: [
                    pw.Container(
                      width: 365,
                      height: 347.58,
                      decoration: tabela(),
                      child: pw.Column(children: [
                        pw.Container(
                          width: 365,
                          height: 18.30,
                          decoration: tabela(),
                          child: pw.Center(
                            child: pw.Text(
                              'O CONDUTOR PREENCHERÁ',
                              style: pw.TextStyle(
                                fontSize: 9,
                                font: pw.Font.timesBold(),
                              ),
                            ),
                          ),
                        ),
                        pw.Row(children: [
                          pw.Container(
                            width: 182.53,
                            height: 182.95,
                            decoration: tabela(),
                            child: pw.Column(children: [
                              pw.Container(
                                padding: pw.EdgeInsets.only(top: 10),
                                width: 182.53,
                                height: 24.95,
                                decoration: tabela(),
                                child: pw.Text(
                                  'Destino (s)',
                                  style: pw.TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 182.53,
                                height: 17.5,
                                decoration: tabela(),
                              )
                            ]),
                          ),
                          pw.SizedBox(width: 1.5),
                          pw.Container(
                            width: 104.71,
                            height: 182.95,
                            decoration: tabela(),
                            child: pw.Column(children: [
                              pw.Column(children: [
                                pw.Container(
                                  height: 12.47,
                                  child: pw.Text(
                                    'Horários',
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
                                ),
                                pw.Column(children: [
                                  pw.Row(children: [
                                    pw.Container(
                                      width: 48.11,
                                      height: 12.8,
                                      decoration: tabela(),
                                      child: pw.Text(
                                        'Chegada',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    pw.Container(
                                      width: 56.5,
                                      height: 12.8,
                                      decoration: tabela(),
                                      child: pw.Text(
                                        'Partida',
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    )
                                  ]),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  )
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 48.11,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                  pw.Container(
                                    width: 56.5,
                                    height: 17.5,
                                    decoration: tabela(),
                                  ),
                                ]),
                              ]),
                            ]),
                          ),
                          pw.SizedBox(width: 1.0),
                          pw.Container(
                            width: 74.58,
                            height: 182.95,
                            decoration: tabela(),
                            child: pw.Column(children: [
                              pw.Container(
                                width: 76.60,
                                height: 24.95,
                                decoration: tabela(),
                                child: pw.Center(
                                  child: pw.Text('HODÔMETRO',
                                      style: pw.TextStyle(fontSize: 10)),
                                ),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              ),
                              pw.Container(
                                width: 76.60,
                                height: 17.5,
                                decoration: tabela(),
                              )
                            ]),
                          ),
                        ]),
                        pw.Container(
                          padding: pw.EdgeInsets.only(
                            left: 5,
                            top: 15,
                          ),
                          height: 146,
                          decoration: tabela(),
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                              children: [
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'O condutor anotará os defeitos verificados.........................................................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '.............................................................................................................................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '.............................................................................................................................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'O condutor fará observações sobre multas, irregularidades e acidentes:............................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '.............................................................................................................................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '.............................................................................................................................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '                                                                                                .............................................',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      '                                                                                                              CONDUTOR',
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                    ),
                    pw.SizedBox(height: 6),
                    pw.Container(
                      padding: pw.EdgeInsets.only(
                        left: 5,
                        top: 15,
                      ),
                      height: 181.12,
                      width: 365,
                      decoration: tabela(),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                          children: [
                            pw.Row(
                              children: [
                                pw.Text(
                                  'O Expedidor preencherá quando do retorno do veículo:',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Text(
                                  '1) Foram preenchidos os itens referentes ao condutor e o usuário?',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Container(
                                  width: 6,
                                  height: 6,
                                  decoration: tabela(),
                                ),
                                pw.Text(
                                  '   sim      ',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.Container(
                                  width: 6,
                                  height: 6,
                                  decoration: tabela(),
                                ),
                                pw.Text(
                                  '   não      ',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Text(
                                  '2) Estão corretos os itens preenchidos pelo condutor?',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Container(
                                  width: 6,
                                  height: 6,
                                  decoration: tabela(),
                                ),
                                pw.Text(
                                  '   sim      ',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.Container(
                                  width: 6,
                                  height: 6,
                                  decoration: tabela(),
                                ),
                                pw.Text(
                                  '   não      ',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Text(
                                  '3) O veículo percorreu .................................. Km',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Text(
                                  'Tempo de utilização ................horas e .......................minutos.',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Text(
                                  '                                                                                                .............................................',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  '                                                                                                              EXPEDIDOR',
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ])
          ]);
        },
      ),
    );

    return pdf.save();
  }

  tabela() {
    return pw.BoxDecoration(
      border: pw.Border.all(color: PdfColor.fromHex('#111111'), width: 0.5),
    );
  }
}
