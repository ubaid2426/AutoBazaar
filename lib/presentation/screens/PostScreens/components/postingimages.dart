import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animated_reorderable_list/animated_reorderable_list.dart';

class PostingImages extends StatefulWidget {
  const PostingImages({super.key});

  @override
  _PostingImagesState createState() => _PostingImagesState();
}

class _PostingImagesState extends State<PostingImages> {
  final List<File> selectedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages.addAll(images.map((e) => File(e.path)));
      });
    }
  }

  void _replaceImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? newImage = await picker.pickImage(source: ImageSource.gallery);

    if (newImage != null) {
      setState(() {
        selectedImages[index] = File(newImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Show the images in a grid when images are uploaded
          if (selectedImages.isNotEmpty)
            Expanded(
              child: AnimatedReorderableGridView<File>(
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    final item = selectedImages.removeAt(oldIndex);
                    selectedImages.insert(newIndex, item);
                  });
                },
                items: selectedImages,
                sliverGridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final image = selectedImages[index];

                  return GestureDetector(
                    key: ValueKey("${image.path}_$index"),
                    onTap: () => _replaceImage(index),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            image,
                            width: 80,
                            height: 78,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          index == 0 ? "Main Image" : "Image ${index + 1}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                isSameItem: (Object a, Object b) {
                  if (a is File && b is File) {
                    return a.path == b.path;
                  }
                  return false;
                },
              ),
            ),

          // Show the "Add Image" button only if more than 1 image is uploaded
          if (selectedImages.length > 1 && selectedImages.length < 10)
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          
          // Add "Add Image" button only when no images are uploaded
          if (selectedImages.isEmpty)
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
