import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomStepper.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/widgets/BillingPage.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/widgets/PaymentPage.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/widgets/PlaceOrderPage.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/widgets/ReviewPage.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/widgets/ShippingPage.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int currentStep = 0;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(),
      body: body(),
      floatingActionButton: Builder(builder: (context) {
        if (currentStep == 3) {
          return FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                currentStep = 4;
              });
            },
            label: const Text('Review'),
          );
        }

        return Container();
      }),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Check Out'),
    );
  }

  Widget body() {
    return CustomStepper(
        controller: scrollController,
        type: CustomStepperType.horizontal,
        onCustomStepContinue: onMoveToNext,
        onCustomStepTapped: onTapped,
        currentCustomStep: currentStep,
        controlsBuilder: (stepIndex, stepState) {
          return Container();
        },
        steps: [
          CustomStep(
              isActive: currentStep == 0,
              title: const Text('Billing'),
              content: BillingPage(
                moveToNext: moveToNext,
              )),
          CustomStep(
              isActive: currentStep == 1,
              title: const Text('Shipping'),
              content: ShippingPage(
                moveToNext: moveToNext,
              )),
          CustomStep(
              isActive: currentStep == 2,
              title: const Text('Payment'),
              content: PaymentPage(
                moveToNext: moveToNext,
              )),
          CustomStep(
              isActive: currentStep == 3,
              title: const Text('Cart Items'),
              content: ReviewPage(
                moveToNext: moveToNext,
              )),
          CustomStep(
              isActive: currentStep == 4,
              title: const Text('Place Order'),
              content: const PlaceOrderPage()),
        ]);
  }

  void onMoveToNext() {}

  void onTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  moveToNext(int index) {
    setState(() {
      currentStep = index;
    });
  }
}
