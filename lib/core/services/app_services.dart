import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessProfile {
  const BusinessProfile({
    required this.owner,
    required this.business,
    required this.phone,
    required this.location,
  });

  final String owner;
  final String business;
  final String phone;
  final String location;
}

class BusinessPrefs {
  Future<bool> complete() async =>
      (await SharedPreferences.getInstance()).getBool('setup') ?? false;

  Future<void> save(BusinessProfile p) async {
    final s = await SharedPreferences.getInstance();
    await s.setString('owner', p.owner);
    await s.setString('business', p.business);
    await s.setString('phone', p.phone);
    await s.setString('location', p.location);
    await s.setBool('setup', true);
  }

  Future<BusinessProfile?> read() async {
    final s = await SharedPreferences.getInstance();
    if (!(s.getBool('setup') ?? false)) return null;
    return BusinessProfile(
      owner: s.getString('owner') ?? '',
      business: s.getString('business') ?? '',
      phone: s.getString('phone') ?? '',
      location: s.getString('location') ?? '',
    );
  }

  Future<void> clear() async {
    await (await SharedPreferences.getInstance()).clear();
  }
}

class PinService {
  PinService();

  String _hash(String p, String s) =>
      sha256.convert(utf8.encode('$s:$p')).toString();

  Future<bool> exists() async =>
      (await SharedPreferences.getInstance()).containsKey('pin_hash');

  Future<void> save(String pin) async {
    final s = await SharedPreferences.getInstance();
    final r = Random.secure();
    final salt = base64UrlEncode(List.generate(24, (_) => r.nextInt(256)));
    await s.setString('pin_salt', salt);
    await s.setString('pin_hash', _hash(pin, salt));
  }

  Future<bool> verify(String pin) async {
    final s = await SharedPreferences.getInstance();
    final salt = s.getString('pin_salt');
    final hash = s.getString('pin_hash');
    return salt != null && hash == _hash(pin, salt);
  }

  Future<void> clear() async {
    final s = await SharedPreferences.getInstance();
    await s.remove('pin_salt');
    await s.remove('pin_hash');
  }
}
