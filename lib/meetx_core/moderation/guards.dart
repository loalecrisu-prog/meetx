import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Helpers to enforce block/report logic across like/chat/match.
class ModerationGuards {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  /// Returns true if [otherUid] is blocked by current user OR
  /// current user is blocked by [otherUid].
  Future<bool> mutualBlock(String otherUid) async {
    final myDoc = await _db.collection('blocks').doc(uid).get();
    final theirDoc = await _db.collection('blocks').doc(otherUid).get();
    final myList = (myDoc.data() ?? {})['blocked'] as List<dynamic>? ?? const [];
    final theirList = (theirDoc.data() ?? {})['blocked'] as List<dynamic>? ?? const [];
    return myList.contains(otherUid) || theirList.contains(uid);
  }

  /// Throws if users are blocked, else returns.
  Future<void> ensureNotBlocked(String otherUid) async {
    if (await mutualBlock(otherUid)) {
      throw ModerationException('Acțiunea este blocată: unul dintre utilizatori te-a blocat.');
    }
  }
}

class ModerationException implements Exception {
  final String message;
  ModerationException(this.message);
  @override
  String toString() => message;
}
