import 'package:hive/hive.dart';
part 'contactwhat.g.dart';

@HiveType()
class Contact {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final DateTime time;
  Contact(this.name, this.number, this.time);
}
