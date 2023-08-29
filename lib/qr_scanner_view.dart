import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/qr_result_view.dart';

class QrScannerView extends StatefulWidget {
  const QrScannerView({Key? key}) : super(key: key);

  @override
  State<QrScannerView> createState() => QrScannerViewState();
}

class QrScannerViewState extends State<QrScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Place the QR code in the area',
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 300,
                height: 400,
                child: QRView(key: qrKey, onQRViewCreated: onQRViewCreated),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QrResultView(
                  text:result!.code
              ),
            )
        );
      });
    });

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
