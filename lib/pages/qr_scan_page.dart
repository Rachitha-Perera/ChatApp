import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key? key}) : super(key: key); // remove const

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String? scannedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (barcodeCapture) {
                // barcodeCapture contains a list of barcodes
                final List<Barcode> barcodes = barcodeCapture.barcodes;
                if (barcodes.isNotEmpty) {
                  final String code = barcodes.first.rawValue ?? 'Unknown';

                  if (scannedData != code) {
                    setState(() {
                      scannedData = code;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Scanned: $code')),
                    );

                    // TODO: Navigate to chat page with scannedData
                  }
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: scannedData != null
                  ? Text('Scanned: $scannedData')
                  : const Text('Scan a code to start chat'),
            ),
          ),
        ],
      ),
    );
  }
}
