import 'package:flutter/material.dart';
import '../moderation/guards.dart';

class GuardedLikeButton extends StatefulWidget {
  final String otherUid;
  final Future<void> Function(String otherUid) onAllowedLike;
  const GuardedLikeButton({super.key, required this.otherUid, required this.onAllowedLike});

  @override
  State<GuardedLikeButton> createState() => _GuardedLikeButtonState();
}

class _GuardedLikeButtonState extends State<GuardedLikeButton> {
  bool loading = false;
  final guards = ModerationGuards();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: loading ? const CircularProgressIndicator() : const Icon(Icons.favorite),
      onPressed: loading ? null : () async {
        setState(()=> loading = true);
        try {
          await guards.ensureNotBlocked(widget.otherUid);
          await widget.onAllowedLike(widget.otherUid);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Like trimis.')));
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        } finally {
          if (mounted) setState(()=> loading = false);
        }
      },
    );
  }
}

class GuardedChatButton extends StatefulWidget {
  final String otherUid;
  final Future<void> Function(String otherUid) onOpenChat;
  const GuardedChatButton({super.key, required this.otherUid, required this.onOpenChat});

  @override
  State<GuardedChatButton> createState() => _GuardedChatButtonState();
}

class _GuardedChatButtonState extends State<GuardedChatButton> {
  bool loading = false;
  final guards = ModerationGuards();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: loading ? const CircularProgressIndicator() : const Icon(Icons.chat_bubble),
      onPressed: loading ? null : () async {
        setState(()=> loading = true);
        try {
          await guards.ensureNotBlocked(widget.otherUid);
          await widget.onOpenChat(widget.otherUid);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        } finally {
          if (mounted) setState(()=> loading = false);
        }
      },
    );
  }
}
