import 'package:flutter/material.dart';

class AlertBoxHome extends StatelessWidget {
  const AlertBoxHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: Text(
          'Alert Dialog Widgets အမျိုးအမျိုး',
          style: TextStyle(
            fontFamily: "MyanmarNayone",
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            OutlineButton(
              child: Text(
                'Open Simple Dialog [With SimpleDialogOption]',
              ),
              onPressed: () {
                showDialog<int>(
                  context: context,
                  builder: (_) => _buildSimpleDialog(context),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Open Alert Dialog',
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => _buildAlertDialog(context),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Open Alert Circle Dialog',
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => _buildAlertCircle(context),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Open Alert Dialog [OK & Cancel]',
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => _buildAlert(context),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlineButton(
              child: Text(
                'Open Alert Dialog [With Text Field]',
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => _buildAlertInput(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('အောက်ပါအချက်ထဲမှ ရွေးပါ'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: const Text(
            'ဖုန်းကိုတစ်နေ့တည်း ဆက်တိုက်ခြောက်နာရီနှင့်အထက်ပြောတယ်',
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 2);
          },
          child: const Text(
            'ဆူညံနေသော စက်ရုံ၊ အလုပ်ရုံ၊ လုပ်ငန်းခွင်မှာလုပ်တယ်',
          ),
        ),
      ],
    );
  }

  Widget _buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('အထူးသတိပြုရန်'),
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      content: const Text(
        'ထီဖွင့်ရက်မှာထီပေါက်စဉ် ကိုယ်တိုင်မတိုက်ကြသူများ အထူးသတိပြုရန်!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.blue,
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  Widget _buildAlertCircle(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'အထူးသတိပြုရန်',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      content: const Text(
        'အဲယားကွန်းခန်းအတွင်း အဝင်အထွက် လုပ်ကိုင်သွားလာနေရသူများသတိပြု!',
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.all(45.0),
      backgroundColor: Colors.orange.shade100,
      shape: CircleBorder(),
    );
  }

  Widget _buildAlert(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'အထူးသတိပြုရန်',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      content: const Text(
        'အဲယားကွန်းခန်းအတွင်း အဝင်အထွက် လုပ်ကိုင်သွားလာနေရသူများသတိပြု!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blue.shade100,
      actions: <Widget>[
        FlatButton(
          child: Text('နေပါစေ'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('အင်းပါ'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  Widget _buildAlertInput(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo.shade100,
      title: Text('တစ်ခုခုပြောသွား'),
      content: TextField(
        // maxLines: 3,
        decoration: InputDecoration(
          labelText: 'ကြီးပွားတိုးတက်ဖို့အချက်',
          hintText: 'ဒီလိုရှိတယ်...',
        ),
      ),
      actions: <Widget>[
        OutlineButton(
          child: Text('အားမနေဘူး'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        OutlineButton(
          child: Text('ပြောမယ်'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
