import 'dart:io';


import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/core/utils/attachment_selection_mixin.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/caption_text.dart';
import 'package:aashirwad/widgets/spaced_column.dart';

enum PhotoState { capture, view }

class PhotoSelectionWidget extends StatefulWidget {
  const PhotoSelectionWidget({
    super.key,
    this.title,
    this.isRequired = false,
    this.isReadOnly = false,
    this.imageUrl,
    this.defaultValue,
    required this.onFileCapture,
  });

  final String? title;
  final bool isRequired;
  final String? imageUrl;
  final File? defaultValue;
  final Function(File? file) onFileCapture;
  final bool isReadOnly;

  @override
  State<PhotoSelectionWidget> createState() => _PhotoSelectionWidgetState();
}

class _PhotoSelectionWidgetState extends State<PhotoSelectionWidget>
    with AttahcmentSelectionMixin {
  File? _selectedImage;
  PhotoState _photoState = PhotoState.capture;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue.isNotNull) {
      _selectedImage = widget.defaultValue;
      _photoState = PhotoState.view;
    }
    if (widget.imageUrl.isNotNull) {
      _selectedImage = null;
      _photoState = PhotoState.view;
    }
  }

  Future<void> _capture() async {
    final capturedFile = await captureImage();
    if (capturedFile != null) {
      setState(() {
        _selectedImage = capturedFile;
        _photoState = PhotoState.view;
      });
      widget.onFileCapture(capturedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4,
      margin: EdgeInsets.zero,
      children: [
        if (widget.title.containsValidValue) ...[
          CaptionText(
              title: widget.title.valueOrEmpty, isRequired: widget.isRequired),
        ],
        GestureDetector(
          onTap: _photoState == PhotoState.view
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePreviewPage(
                        title: widget.title.valueOrEmpty,
                        imageUrl: widget.imageUrl,
                        image: _selectedImage,
                      ),
                    ),
                  );
                }
              : null,
          child: Container(
            height: 48,
            width: context.sizeOfWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color:AppColors.registration, width: 1.4),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_photoState == PhotoState.capture)
                  Center(
                    child: IconButton(
                      onPressed: widget.isReadOnly ? null : () async => await _capture(),
                      icon: Icon(Icons.add_a_photo,
                          size: 24, color: widget.isReadOnly ? AppColors.grey : AppColors.registration),
                    ),
                  )
                else if (_photoState == PhotoState.view)
                  const Center(
                    child: Text(
                      'View',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImagePreviewPage extends StatelessWidget {

  const ImagePreviewPage({
    super.key,
    required this.image,
    required this.imageUrl, 
    required this.title,
  });
  final String title;
  final File? image;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          if (image != null) ...[
            SizedBox(
              height: 400,
              width: context.sizeOfWidth,
              child: Card(
                shape: Border.all(color: AppColors.green),
                child: Image.file(
                  image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            
          ] else if (imageUrl.containsValidValue) ...[
            SizedBox(
              height: 400,
              width: context.sizeOfWidth,
              child: Card(
                shape: Border.all(color: AppColors.green),
                child: Image.network(
                  Urls.filepath(imageUrl!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
