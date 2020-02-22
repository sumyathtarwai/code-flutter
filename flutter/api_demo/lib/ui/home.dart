import 'package:api_demo/data/model/post.dart';
import 'package:api_demo/network/service/rest_client.dart';
import 'package:api_demo/ui/photo_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getFuturePosts(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhotoHome()),
          );
        },
        child: Icon(Icons.photo_album),
      ),
    );
  }

  FutureBuilder _getFuturePosts(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: Provider.of<RestClient>(context, listen: false).getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No Internet Connection"),
              ),
            );
          }
          return _photoList(snapshot.data);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _photoList(List<Post> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, i) {
          return Card(
            child: ListTile(
              title: Text(data[i].title),
              subtitle: Text(data[i].body),
            ),
          );
        });
  }
}
