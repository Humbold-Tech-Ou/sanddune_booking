import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 300,
              color: Colors.grey.shade200,
              child: const Center(child: Icon(Icons.image, size: 60)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Thumbnail Images
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              final List<String> images = [
                'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=120&q=80',
                'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=120&q=80',
                'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=120&q=80',
                'https://images.unsplash.com/photo-1578662996442-48f60103fc96?auto=format&fit=crop&w=120&q=80',
                'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=120&q=80',
                'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=120&q=80',
              ];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    images[index],
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 120,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image, size: 30),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Ver las 22 fotos'),
          ),
        ),
      ],
    );
  }
}
