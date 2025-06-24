import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageCompressorWidget extends StatefulWidget {
  const ImageCompressorWidget({Key? key}) : super(key: key);

  @override
  State<ImageCompressorWidget> createState() => _ImageCompressorWidgetState();
}

class _ImageCompressorWidgetState extends State<ImageCompressorWidget> {
  File? newImage;
  XFile? image;
  final picker = ImagePicker();
  bool isLoading = false;

  // method to pick single image while replacing the photo
  Future imagePickerFromGallery() async {
    setState(() {
      isLoading = true;
    });

    image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final bytes = await image!.readAsBytes();
    final kb = bytes.length / 1024;
    final mb = kb / 1024;

    if (kDebugMode) {
      print('original image size: ${mb.toStringAsFixed(2)} MB');
    }

    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = '${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // converting original image to compress it
    final result = await FlutterImageCompress.compressAndGetFile(
      image!.path,
      targetPath,
      minHeight: 500,
      minWidth: 500,
      quality: 90,
    );

    if (result == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final data = await result.readAsBytes();
    final newKb = data.length / 1024;
    final newMb = newKb / 1024;

    if (kDebugMode) {
      print('compressed image size: ${newMb.toStringAsFixed(2)} MB');
    }

    setState(() {
      newImage = File(result.path);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Compressor',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : imagePickerFromGallery,
        backgroundColor: Colors.teal,
        elevation: 4,
        tooltip: 'Pick Image',
        child: const Icon(
          Icons.add_photo_alternate,
          color: Colors.white,
          size: 28,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                if (image != null && newImage != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(newImage!.path),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 80,
                            color: Colors.teal,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No image selected',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                  strokeWidth: 5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}