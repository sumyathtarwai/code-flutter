import 'package:cached_network_image/cached_network_image.dart';
import 'package:complex_api_demo/data/post.dart';
import 'package:complex_api_demo/network/service/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostHome extends StatelessWidget {
  const PostHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: _getFuturePosts(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => PhotoHome()),
      //     );
      //   },
      //   child: Icon(Icons.photo_album),
      // ),
    );
  }

  FutureBuilder _getFuturePosts(BuildContext context) {
    Map<String, dynamic> page = {"page": 1};
    return FutureBuilder<List<Post>>(
      future: Provider.of<RestClient>(context, listen: false).getPosts(page),
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
            elevation: 10.0,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    data[i].title.rendered,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(data[i].date),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Center(
                  child: CachedNetworkImage(
                    imageUrl: data[i].image.sourceUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // Image.network(data[i].image.sourceUrl),
              ],
            ),
            // child: ListTile(
            //   leading: CachedNetworkImage(
            //     imageUrl: data[i].image.sourceUrl,
            //     // placeholder: (_, url) {
            //     //   return Container(
            //     //     width: double.infinity,
            //     //     height: 200.0,
            //     //     child: Center(
            //     //       child: CircularProgressIndicator(),
            //     //     ),
            //     //   );
            //     // },
            //     //fit: BoxFit.cover,
            //     placeholder: (context, url) => CircularProgressIndicator(),
            //     errorWidget: (context, url, error) => Icon(Icons.error),
            //   ),
            //   //Image.network(data[i].image.sourceUrl),
            //   title: Text(data[i].title.rendered),
            //   subtitle: Text(DateFormat('dd/MM/yyyy').format(data[i].date)),
            // ),
          );
        });
  }
}
