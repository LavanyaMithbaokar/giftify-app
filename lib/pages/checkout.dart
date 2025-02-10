import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giftify/logic/provider/address_pro.dart';
import 'package:giftify/pages/address.dart';
import 'package:giftify/pages/cart.dart';
import 'package:giftify/pages/payment.dart';
import 'package:giftify/pages/summary.dart';

class Checkout extends ConsumerStatefulWidget {
  const Checkout({super.key});

  @override
  ConsumerState<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends ConsumerState<Checkout> {
  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: Text('Address'),
          content: Address(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text('Payment'),
          content: Payment(),
        ),
        // Step(
        //   isActive: currentStep >= 2,
        //   title: Text('Payment'),
        //   content: Container(),
        // ),
        // Step(
        //   isActive: currentStep >= 3,
        //   title: Text('Summary'),
        //   content: Container(),
        // ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 219, 227, 100),
        title: Text(
          "Checkout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stepper(
          stepIconHeight: 25,
          stepIconWidth: 25,
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;

            // if (currentStep == 0) {
            //   final formkey = ref.watch(addressPro.notifier).getState();

            //   if (formkey.currentState!.validate()) {
            //   } else {
            //     return;
            //   }
            // }
            if (isLastStep) {
              print('Completed');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Summary()));
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        ),
      ),
    );
  }
}
