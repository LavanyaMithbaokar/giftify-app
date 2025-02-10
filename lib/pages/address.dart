import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:giftify/logic/provider/address_pro.dart';

class Address extends ConsumerStatefulWidget {
  const Address({super.key});

  @override
  ConsumerState<Address> createState() => _AddressState();
}

class _AddressState extends ConsumerState<Address> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController country = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  void submit() {
    if (Form.of(context).validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (_formKey.currentState != null) {
    //   ref.read(addressPro.notifier).setup(_formKey);
    // }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: country,
            decoration: InputDecoration(hintText: 'Country'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your country';
              }
              return null;
            },
          ),
          Gap(10),
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          Gap(10),
          TextFormField(
            controller: address,
            decoration: InputDecoration(hintText: 'Apartment/Suite'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          Gap(10),
          TextFormField(
            controller: city,
            decoration: InputDecoration(hintText: 'City'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          Gap(10),
          TextFormField(
            controller: state,
            decoration: InputDecoration(hintText: 'State'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your state';
              }
              return null;
            },
          ),
          Gap(10),
          TextFormField(
            controller: pincode,
            decoration: InputDecoration(hintText: 'Pincode'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your pincode';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
