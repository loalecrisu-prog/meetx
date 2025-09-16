import 'package:flutter/material.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meetx/screens/payment/pay_screen.dart';
import 'package:meetx/screens/bottomScreen/profile/subscreenlist/edit_profile_screen.dart';

/// Null-safe Profile screen.
/// - Does not rely on external controllers.
/// - Works even if user data is missing (shows placeholders).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated nullable user fields (replace with your real sources if needed)
    final String? displayName = null;   // e.g., from auth/user provider
    final String? bio = null;
    final String? photoUrl = null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyleClass.interBold(size: 20.0, color: ColorConst.black09),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Header(
            name: displayName ?? 'Guest',
            bio: bio ?? 'Add a short bio about you.',
            photoUrl: photoUrl,
          ),
          const SizedBox(height: 16),
          const _SectionTitle('Settings'),
          const _SwitchTile(title: 'Show online status'),
          const _SwitchTile(title: 'Allow message requests'),
          const _SwitchTile(title: 'Only verified can message'),
          const Divider(height: 32),
          const _SectionTitle('Discovery preferences'),
          const _SliderTile(title: 'Age range', min: 18, max: 55, initial: 30),
          const _SliderTile(title: 'Distance (km)', min: 1, max: 100, initial: 25),
          const Divider(height: 32),
          const _SectionTitle('Account'),
          _NavTile(
            title: 'Edit profile',
            onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const EditProfileScreen())); },
          ),
          _NavTile(
            title: 'Subscription / Boosts',
            onTap: () { _safeSnack(context, 'Open subscription'); },
          ),
          _NavTile(
            title: 'Privacy & Safety',
            onTap: () { _safeSnack(context, 'Open privacy'); },
          ),
          _NavTile(
            title: 'Logout',
            onTap: () { _safeSnack(context, 'Logout tapped'); },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

void _safeSnack(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

class _Header extends StatelessWidget {
  const _Header({required this.name, required this.bio, required this.photoUrl});
  final String name;
  final String bio;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: ColorConst.appColorFF,
          backgroundImage: photoUrl != null && photoUrl!.isNotEmpty ? NetworkImage(photoUrl!) : null,
          child: (photoUrl == null || photoUrl!.isEmpty)
              ? const Icon(Icons.person, color: Colors.white, size: 36)
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyleClass.interBold(size: 18.0, color: ColorConst.black09)),
              const SizedBox(height: 4),
              Text(
                bio,
                style: TextStyleClass.interRegular(size: 13.0, color: ColorConst.grey69),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => _safeSnack(context, 'Edit profile'),
          child: const Text('Edit'),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: TextStyleClass.interBold(size: 16.0, color: ColorConst.black09)),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: onTap,
    );
  }
}

class _SwitchTile extends StatefulWidget {
  const _SwitchTile({super.key, required this.title});
  final String title;
  @override
  State<_SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<_SwitchTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (v) => setState(() => value = v),
      title: Text(widget.title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}

class _SliderTile extends StatefulWidget {
  const _SliderTile({super.key, required this.title, required this.min, required this.max, required this.initial});
  final String title; final double min; final double max; final double initial;
  @override
  State<_SliderTile> createState() => _SliderTileState();
}

class _SliderTileState extends State<_SliderTile> {
  late double value = widget.initial;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${widget.title}: ${value.toStringAsFixed(0)}'),
      subtitle: Slider(
        value: value,
        min: widget.min,
        max: widget.max,
        onChanged: (v) => setState(() => value = v),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
