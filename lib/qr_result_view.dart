import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/qr_scanner_view.dart';

class QrResultView extends StatefulWidget {

  final String? text;

  const QrResultView({
    super.key,
    required this.text
  });

  @override
  State<QrResultView> createState() => _QrResultViewState();
}

class _QrResultViewState extends State<QrResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Result'),
      leading: IconButton(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QrScannerView())),
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
      )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: QrImageView(
                  data: widget.text!,
                  version: QrVersions.auto,
                  size: 200,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(100, 100),
                  )
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              'Scanned Result',
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.text!,
                style: TextStyle(fontSize: 14, color: Colors.grey[600],),
                maxLines: 2,
              ),
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
              onPressed: () async{
                await Clipboard.setData(ClipboardData(text: widget.text!));
                ScaffoldMessenger.of(context).
                showSnackBar(
                  const SnackBar(content: Text('Copied to Clipboard'),),
                );
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
