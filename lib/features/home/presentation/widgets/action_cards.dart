import 'package:flutter/material.dart';

import 'action_card_item.dart';

class ActionCards extends StatelessWidget {
  const ActionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ActionCardItem(
            icon: Icons.rocket_launch_rounded,
            title: 'P2P Trading',
            subtitle: 'Bank Transfer, Paypal Revolut...',
            useGradientBackground: true,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          ActionCardItem(
            icon: Icons.credit_card_rounded,
            title: 'Credit/Debit Card',
            subtitle: 'Visa, Mastercard',
            useGradientBackground: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
