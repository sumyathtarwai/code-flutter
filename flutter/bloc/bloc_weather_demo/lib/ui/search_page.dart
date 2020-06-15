import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _serchCtrl = TextEditingController();

  @override
  void dispose() {
    _serchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    controller: _serchCtrl,
                    decoration: InputDecoration(
                      hintText: 'City e.g. Yangon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.search), onPressed: () => {}),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text('${i + 1}',
                        style: Theme.of(context).textTheme.subtitle1),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12),
                      ),
                    ),
                  );
                },
                itemCount: [1, 2].length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
