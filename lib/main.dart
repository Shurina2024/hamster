import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const HamsterGacha());
}

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0;
  int e = 0;
  bool loading = false;

  final List<String> emojis = ['🐩', '💃', '🐩', '🫰'];

    final images = [
    "https://images.unsplash.com/photo-1767792764615-3839ed34e3ff?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fCVFMyU4MiVCNSVFMyU4MyVBMiVFMyU4MiVBOCVFMyU4MyU4OXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1785940491939-b9ab73334434?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8JUUzJTgyJUI1JUUzJTgzJUEyJUUzJTgyJUE4JUUzJTgzJTg5fGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1767792607379-76ae8aeef519?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fCVFMyU4MiVCNSVFMyU4MyVBMiVFMyU4MiVBOCVFMyU4MyU4OXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1718420432340-3ae70488ebd5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUUzJTgyJUI1JUUzJTgzJUEyJUUzJTgyJUE4JUUzJTgzJTg5fGVufDB8fDB8fHww",
    "https://plus.unsplash.com/premium_photo-1683121435740-e290468c71c3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fCVFMyU4MiVCNSVFMyU4MyVBMiVFMyU4MiVBOCVFMyU4MyU4OXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1636998094434-96c8e4635184?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fCVFMyU4MiVCNSVFMyU4MyVBMiVFMyU4MiVBOCVFMyU4MyU4OXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1636998196796-8fec5c29bc5d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fCVFMyU4MiVCNSVFMyU4MyVBMiVFMyU4MiVBOCVFMyU4MyU4OXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1706183861983-4997cbe9bd08?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8JUUzJTgyJUI1JUUzJTgzJUEyJUUzJTgyJUE4JUUzJTgzJTg5fGVufDB8fDB8fHww",

  ];
  Future<void> gacha() async {
    setState(() {
      loading = true;
    });

    for (int i = 0; i < 10; i++) {
      await Future.delayed(
        const Duration(milliseconds: 50),
      );

      if (!mounted) return;

      setState(() {
        e = (e + 1) % emojis.length;
      });
    }

    if (!mounted) return;

    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🐩 サモエド'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: loading
                    ? Center(
                        child: Text(
                          emojis[e],
                          style: const TextStyle(
                            fontSize: 100,
                          ),
                        ),
                      )
                    : Image.network(
                        images[n],
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: 30),
              const Text('🛸', style: TextStyle(fontSize: 72)),
              ElevatedButton(
                onPressed: loading ? null : gacha,
                child: const Text('ガチャを回す！'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}