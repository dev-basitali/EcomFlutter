class ShippingAddress {
  final String? firstName;
  final String? lastName;
  final String? address1;
  final String? city;
  final String? state;
  final String? postcode;
  final String? email;
  final String? phone;

  ShippingAddress({
     this.firstName,
     this.lastName,
     this.address1,
     this.city,
     this.state,
     this.postcode,
     this.email,
     this.phone,
  });

  Map<String, dynamic> toJson() => {
    'first_name': firstName?? '',
    'last_name': lastName?? '',
    'address_1': address1?? '',
    'city': city?? '',
    'state': state?? '',
    'postcode': postcode?? '',
    'email': email?? '',
    'phone': phone?? '',
  };
}
