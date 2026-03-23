import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ScreenA()));

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('screen one 1')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ScreenB()));
          },
          child: const Hero(
            tag: 'star-icon',
            child: Icon(Icons.star, size: 50, color: Colors.orange),
          ),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('screen tow 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'star-icon',
              child: Icon(Icons.star, size: 250, color: Colors.orange),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}