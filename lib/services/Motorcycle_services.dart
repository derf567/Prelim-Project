import 'package:fred_application/models/motorcycle.dart';

class MotorcycleService {
  final List<Motorcycle> motorcycles = [];

  void addMotorcycle(String id, String name, bool isAvailable) {
    motorcycles.add(Motorcycle(id: id, name: name, isAvailable: isAvailable));
    print('Motorcycle added: $name (ID: $id)');
  }

  List<Motorcycle> getAvailableMotorcycles() {
    return motorcycles.where((m) => m.isAvailable).toList();
  }
}
