import 'package:api_demo/data/model/photo.dart';
import 'package:api_demo/network/service/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoHome extends StatelessWidget {
  const PhotoHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getFuturePhoto(context),
    );
  }
}

FutureBuilder _getFuturePhoto(BuildContext context) {
  return FutureBuilder<List<Photo>>(
    future: Provider.of<RestClient>(context, listen: false).getPhotos(),
    builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
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

Widget _photoList(List<Photo> data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 3.0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              title: Text(data[i].title),
              leading: Image.network(
                data[i].thumbnailUrl,
              ),
            ),
          ),
        );
      });
}
