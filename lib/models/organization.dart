import 'package:hive/hive.dart';
part 'organization.g.dart';

@HiveType(typeId: 0)
class Organization extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String number;
}
