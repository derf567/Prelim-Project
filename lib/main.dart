import 'package:riverpod/riverpod.dart';
import 'providers/motorcycle_provider.dart';
import 'dart:io';

void main() {
  final container = ProviderContainer();
  final motorcycleService = container.read(motorcycleProvider);

  while (true) {
    print('\nMotorcycle Availability Application');
    print('1. Add Motorcycle');
    print('2. Check Available Motorcycles');
    print('3. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter Motorcycle ID: ');
        String? id = stdin.readLineSync();
        stdout.write('Enter Motorcycle Name: ');
        String? name = stdin.readLineSync();
        stdout.write('You want to add this motorvehicle? (yes/no): ');
        String? availability = stdin.readLineSync();
        bool isAvailable = availability?.toLowerCase() == 'yes';

        if (id != null && name != null) {
          motorcycleService.addMotorcycle(id, name, isAvailable);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '2':
        print('Available Motorcycles:');
        final availableMotorcycles =
            motorcycleService.getAvailableMotorcycles();
        if (availableMotorcycles.isEmpty) {
          print('No motorcycles available.');
        } else {
          for (var motorcycle in availableMotorcycles) {
            print('${motorcycle.name} (ID: ${motorcycle.id})');
          }
        }
        break;

      case '3':
        print('Exiting the application.');
        container.dispose();
        return;

      default:
        print('Invalid option. Please try again.');
    }
  }
}
