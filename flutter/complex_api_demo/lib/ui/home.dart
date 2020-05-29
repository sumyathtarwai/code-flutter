import 'package:complex_api_demo/network/service/rest_client.dart';
import 'package:complex_api_demo/ui/post_home.dart';
import 'package:complex_api_demo/ui/post_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("THIHA TECH"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text("Hello Thiha Tech"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic> page = {"page": 1, "per_page": 10};
          final api = Provider.of<RestClient>(context, listen: false);
          api.getPosts(page).then((onValue) {
            onValue.forEach((f) {
              print(f.title.rendered);
            });
          }).catchError((onError) {
            print(onError.toString());
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
