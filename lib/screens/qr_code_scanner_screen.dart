import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../utils/tlv_utils.dart';
import 'qr_code_generator_screen.dart';

class QrCodeScannerScreen extends StatefulWidget {
  @override
  _QrCodeScannerScreenState createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  final MobileScannerController _scannerController = MobileScannerController();

  void _onScan(BarcodeCapture barcodeCapture) {
    if (barcodeCapture.barcodes.isNotEmpty) {
      String tlv = barcodeCapture.barcodes.first.rawValue ??
          ''; // Fallback to empty string
      print('Scanned TLV: $tlv'); // Debug output

      if (tlv.isNotEmpty) {
        Map<String, String> decodedData = decodeTLV(tlv);

        // Redirect to the generator screen with the decoded values
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                QrCodeGeneratorScreen(initialValues: decodedData),
          ),
        );
      } else {
        // Handle the case where tlv is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No valid QR code found.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: MobileScanner(
        controller: _scannerController,
        onDetect: (BarcodeCapture barcodeCapture) {
          _onScan(barcodeCapture); // Call the method to handle scanned code
        },
      ),
    );
  }
}
