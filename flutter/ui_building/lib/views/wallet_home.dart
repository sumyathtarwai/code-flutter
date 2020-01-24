import 'package:flutter/material.dart';

import '../ui/wallet/action_bar_widget.dart';
import '../ui/wallet/bottom_widget.dart';
import '../ui/wallet/custom_card_widget.dart';
import '../ui/wallet/detail_summary_page.dart';

class WalletHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        // removed default box shadow
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: ActionBar(),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            75.0,
          ),
          child: BottomWidget(
            title: 'Your Wallet',
            balance: '\$9,750.50',
            balancePercent: '25%',
          ),
        ),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            // detail summary
            Container(
              margin: EdgeInsets.only(
                top: 260.0,
              ),
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
              //grey.shade200,
              child: DetailSummaryPage(
                sendAmount: '\$80.5',
                payAmount: '\$150.15',
                topUpAmount: '\$60.32',
                requestAmount: '\$90.20',
              ),
            ),
            // background
            Container(
              width: double.infinity,
              height: 140.0,
              color: Colors.teal.shade700,
            ),
            // card
            Positioned(
              top: 40.0,
              left: 20.0,
              right: 20.0,
              child: CustomCard(
                percent: 80,
                title: 'Excellent Financial',
                subTitle: 'Your financial condition is excellent',
                link: 'View Statistic',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
