import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BodyQR extends StatelessWidget {
  final String text;
  final String? imageUrl;

  const BodyQR({super.key, required this.text, required this.imageUrl});

  String _generateUrl() {
    const username = "hazemattia7";
    const repoName = "movie-qr";

    final encodedName = Uri.encodeComponent(text);
    final encodedImage = Uri.encodeComponent(imageUrl ?? '');

    return "https://$username.github.io/$repoName/movie.html?name=$encodedName&image=$encodedImage";
  }

  @override
  Widget build(BuildContext context) {
    final url = _generateUrl();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(227, 75, 75, 1),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(78),
      ),
      child: Center(
        child: QrImageView(data: url, version: QrVersions.auto, size: 550),
      ),
    );
  }
}
