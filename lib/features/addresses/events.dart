class AddressEvents {}

class GetAddressEvent extends AddressEvents {}

class AddAddressEvent extends AddressEvents {
  final String phone, description, type;
  final double lat, lng;

  AddAddressEvent(
      {required this.phone,
      required this.description,
      required this.type,
      required this.lat,
      required this.lng});
}
