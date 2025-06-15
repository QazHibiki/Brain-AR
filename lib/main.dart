import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BrainAnatomyApp());
}

class BrainAnatomyApp extends StatelessWidget {
  const BrainAnatomyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brain Anatomy AR',
      home: BrainAnatomyARScreen(),
    );
  }
}

// Home Screen
class BrainAnatomyARScreen extends StatelessWidget {
  const BrainAnatomyARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Center(
    child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFFB044FF), Color(0xFF9335D0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/unimas_logo.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20),
              const Text(
                'Brain Anatomy AR',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Learn the Brain. See it in 3D.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ARExperienceScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Begin AR Experience', style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
    ),
      ),
    );
  }
}

// AR Experience Screen
class ARExperienceScreen extends StatelessWidget {
  const ARExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Center(
        child: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C00FF), Color(0xFFE100FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -60,
                  left: 0,
                  right: 0,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: .6, // Shows only top 40% of the image
                      child: Image.asset(
                        'assets/picture_ar.jpg',
                        height: 600, // keep it tall, so crop can work
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    decoration: const BoxDecoration(
                      color: Color(0xFFB044FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9335D0),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.lightbulb_outline, color: Colors.white, size: 40),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Discover how every part of the brain works together in one interactive experience',
                                  style: TextStyle(color: Colors.white, fontSize: 22, height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const QRInstructionScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('PLAY', style: TextStyle(fontSize: 23)),
                                SizedBox(width: 8),
                                Icon(Icons.play_arrow, size: 30),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const AboutARScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('ABOUT AR', style: TextStyle(fontSize: 23)),
                                SizedBox(width: 8),
                                Icon(Icons.info_outline, size: 30),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// QR Instruction Screen
class QRInstructionScreen extends StatelessWidget {
  const QRInstructionScreen({super.key});

  void _showLinkDialog(BuildContext context) {
    const String url = 'https://mywebar.com/p/Project_0_5eb5i1vnpr';
    final Uri uri = Uri.parse(url);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Start AR Experience'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Click the link below to begin:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not launch the link.')),
                  );
                }
              },
              child: Text(
                url,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF430F68), Color(0xFFD061FB)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Start AR Experience",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFD061FB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Scan to Begin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/qr.jpg',
                          width: 220,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 90),
                      const Text(
                        "Or just click the button below.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _showLinkDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F5F5),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Click Here", style: TextStyle(fontWeight: FontWeight.w700)),
                            SizedBox(width: 10),
                            Icon(Icons.link),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// About AR Screen
class AboutARScreen extends StatelessWidget {
  const AboutARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set empty background to black
      body: Stack(
        children: [
          // Background image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/picture_ar.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient layer (stretching to edges, not top)
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD061FB), Color(0xFF7B3A95)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Top bar with title
          Positioned(
            top: 40,
            left: 70,
            right: 70,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ABOUT BRAIN AR',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.info_outline, size: 24, color: Colors.black),
                ],
              ),
            ),
          ),

          // Content section
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  // First white box
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Our project uses Augmented Reality to teach brain anatomy in an interactive and engaging way. By visualizing a 3D brain model, students can explore different brain parts and learn their functions more effectively. This educational tool is designed especially for students and educators to make neuroscience easier to understand and more enjoyable to learn.',
                      style: TextStyle(fontSize: 18, color: Colors.black, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Second white box
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'What is Augmented Reality?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Augmented Reality (AR) blends digital elements into the real world through your device’s screen. From 3D models to interactive animations, AR enhances how you experience and explore information—right where you are.',
                          style: TextStyle(fontSize: 18, color: Colors.black, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

