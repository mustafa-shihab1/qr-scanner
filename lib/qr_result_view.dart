import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrResultView extends StatelessWidget {
  const QrResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 170,
              height: 170,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: QrImageView(
                  data: 'https://www.google.com',
                  version: QrVersions.auto,
                  size: 170,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              'Scanned Result',
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            const SizedBox(height: 10),
            Text(
              'https://www.google.com',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            //button to copy the result
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                fixedSize: const Size(300, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {

              },
              child: const Text(
                  'Copy',
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
