import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/common/common_part_export.dart';
import '../widgets/order/order_part_export.dart';
import '../provider/modal.dart';

class OrderHome extends StatefulWidget {
  const OrderHome({Key key}) : super(key: key);

  @override
  _OrderHomeState createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> {
  var _isloading = false;
  @override
  void initState() {
    super.initState();
    _loading(true);
    _refreshData().then((value) => _loading(false));
  }

  void _loading(bool val) {
    if (mounted) {
      setState(() {
        _isloading = val;
      });
    }
  }

  Future<List<OrderItem>> _refreshData() async {
    final of = Provider.of<OrderList>(context, listen: false);
    return await of.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var orderOf = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: orderOf.order.isEmpty
                  ? Center(
                      child: Text(
                        'No order history yet',
                        style: theme.textTheme.headline4,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, i) =>
                          OrderTile(order: orderOf.order[i]),
                      itemCount: orderOf.order.length,
                    ),
            ),
    );
  }
}
