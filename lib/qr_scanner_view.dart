import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/qr_result_view.dart';

class QrScannerView extends StatelessWidget {
  const QrScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Place the QR code in the area',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const QrResultView(),) );
            }, child: Text('asdasdsdasd')),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 400,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: MobileScanner(
                    onDetect: (barcodes){

                    },
                ),
              ),

            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
