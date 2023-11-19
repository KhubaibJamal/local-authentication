import 'package:flutter/material.dart';
import 'package:local_password/services/local_auth_services.dart';
import 'package:local_password/view/home_view.dart';

class FingerprintView extends StatelessWidget {
  const FingerprintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fingerprint",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "user you fingerprint to login into the app",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.white54),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () async {
                  final auth = await LocalAuthService.authenticate();
                  print(auth);
                  if (auth) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                icon: const Icon(
                  Icons.fingerprint,
                  size: 34,
                  color: Color(0xFF04151f),
                ),
                label: const Text(
                  "Authenticate",
                  style: TextStyle(fontSize: 24, color: Color(0xFF04151f)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
