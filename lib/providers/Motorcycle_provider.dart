// lib/providers/motorcycle_provider.dart
import 'package:fred_application/services/motorcycle_services.dart';
import 'package:riverpod/riverpod.dart';

final motorcycleProvider = Provider<MotorcycleService>((ref) {
  return MotorcycleService();
});
