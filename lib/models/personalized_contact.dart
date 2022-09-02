import 'package:hive/hive.dart';
part 'personalized_contact.g.dart';

@HiveType(typeId: 1)
class PersonalizedContact extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String number;
}
