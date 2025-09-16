import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meetx/screens/main_bottom_nav.dart';
import 'package:meetx/services/google_auth_service.dart';

class LoginGoogleScreen extends StatefulWidget {
  const LoginGoogleScreen({super.key});

  @override
  State<LoginGoogleScreen> createState() => _LoginGoogleScreenState();
}

class _LoginGoogleScreenState extends State<LoginGoogleScreen> {
  final GoogleAuthService _auth = GoogleAuthService();
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() { _loading = true; _error = null; });
    try {
      final GoogleSignInAccount? account = await _auth.signIn();
      if (!mounted) return;
      if (account != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainBottomNav()),
        );
      } else {
        setState(() { _error = 'Sign-in cancelled.'; });
      }
    } catch (e) {
      setState(() { _error = e.toString(); });
    } finally {
      if (mounted) setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FlutterLogo(size: 96),
              const SizedBox(height: 24),
              const Text('Sign in to MeetX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              if (_error != null) ...[
                Text(_error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 8),
              ],
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _loading ? null : _login,
                  icon: const Icon(Icons.login),
                  label: Text(_loading ? 'Signing in...' : 'Continue with Google'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
