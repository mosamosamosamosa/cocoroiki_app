import 'dart:developer';
import 'dart:io';

import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({Key? key}) : super(key: key);

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanFlag = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Scaffold(
        body: !scanFlag
            ? Stack(
                children: [
                  _buildQrView(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 80),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svg/batsu.svg')),
                  )
                ],
              )
            : Stack(alignment: Alignment.center, children: [
                SizedBox(
                    width: deviceW,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/image/back_test.png'))),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/image/qr_scan_result.png'),
                    Positioned(
                      top: 305,
                      child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                              radius: 32,
                              foregroundImage:
                                  NetworkImage(users_list[0].image))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 110),
                        Text(
                          'ともこ',
                          style: TextStyle(
                            fontFamily: 'Zen-Bl',
                            fontSize: 24,
                            color: Color(0xFF511C0B),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '既に家族登録されています',
                          style: TextStyle(
                            fontFamily: 'Zen-Bl',
                            fontSize: 22,
                            color: Color(0xFFFF6900),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   scanFlag = false;
                              // });
                            },
                            child: Image.asset('assets/image/qr_already.png')),
                      ],
                    )
                  ],
                )
              ]));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 500.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      print(scanData.code);
      setState(() {
        scanFlag = true;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }
}
