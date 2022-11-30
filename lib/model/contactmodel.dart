class Contacts {
  final int id;
  String user;
  String phone;
  String checkin;

  Contacts({
    required this.id,
    required this.user,
    required this.phone,
    required this.checkin,

  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'phone': phone,
      'checkin': checkin
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Contacts{id: $id, user: $user, phone: $phone, checkin: $checkin';
  }
}