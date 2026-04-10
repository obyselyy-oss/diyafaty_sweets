import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ScreenA()));

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شاشة الهبوط')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScreenB()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo-hero',
                child: Image.asset('assets/logo.png', height: 200),
              ),
              const SizedBox(height: 50),
              const Text(
                "الذهاب الى المنيو",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  final List<Map<String, String>> products = const [
    {'name': 'ديسباسيتو', 'image': 'assets/despacito.png'},
    {'name': 'ترليشة', 'image': 'assets/tres_leches.png'},
    {'name': 'كرانشي', 'image': 'assets/crunchy.png'},
    {'name': 'كيك بركاني', 'image': 'assets/lava.png'},
    {'name': 'انقلش كيك', 'image': 'assets/english.png'},
    {'name': 'تشيز كيك', 'image': 'assets/cheese.png'},
    {'name': 'ترميسيو', 'image': 'assets/tiramisu.png'},
    {'name': 'حلاوة الجوزية', 'image': 'assets/walnut.png'},
    {'name': 'كيك سيكلز', 'image': 'assets/sickles.png'},
    {'name': 'شكلاتة بون بون', 'image': 'assets/bonbon.png'},
    {'name': 'ألواح شوكولاتة', 'image': 'assets/bars.png'},
    {'name': 'براونيز', 'image': 'assets/brownies.png'},
    {'name': 'حلاوة نحل', 'image': 'assets/honey.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنيو')),
      body: Center(
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 4.0,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 1080, 
              height: 1920, 
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/menu.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  _buildHiddenButton(context, products[0], 250, 100, 400, 180),
                  _buildHiddenButton(context, products[1], 250, 580, 400, 180),
                  _buildHiddenButton(context, products[2], 470, 100, 400, 180),
                  _buildHiddenButton(context, products[3], 470, 580, 400, 180),
                  _buildHiddenButton(context, products[4], 690, 100, 400, 180),
                  _buildHiddenButton(context, products[5], 690, 580, 400, 180),
                  _buildHiddenButton(context, products[6], 910, 100, 400, 180),
                  _buildHiddenButton(context, products[7], 910, 580, 400, 180),
                  _buildHiddenButton(context, products[8], 1130, 100, 400, 180),
                  _buildHiddenButton(context, products[9], 1130, 580, 400, 180),
                  _buildHiddenButton(context, products[10], 1350, 100, 400, 180),
                  _buildHiddenButton(context, products[11], 1350, 580, 400, 180),
                  _buildHiddenButton(context, products[12], 1600, 340, 400, 180),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHiddenButton(BuildContext context, Map<String, String> product, double top, double left, double width, double height) {
    return Positioned(
      top: top,
      left: left,
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(
                productName: product['name']!,
                productImage: product['image']!,
              ),
            ),
          );
        },
        child: Container(color: Colors.transparent),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String productImage;

  const ProductDetailScreen({
    super.key, 
    required this.productName,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: productName,
                child: Image.asset(
                  productImage,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 150, color: Colors.grey);
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                productName,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/code.png',
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.qr_code_2, size: 150, color: Colors.grey);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}