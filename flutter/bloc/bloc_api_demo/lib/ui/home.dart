import 'package:bloc_api_demo/bloc/track_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/modal/track.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoc'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            height: height * 0.8,
            child: BlocBuilder<TrackBloc, TrackState>(
              builder: (context, state) {
                if (state is TrackInitial) {
                  return Center(
                    child: Text(
                      'No Data Yet',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                }
                if (state is TrackLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TrackLoaded) {
                  return _photoList(state.photos);
                }

                if (state is TrackFail) {
                  return Center(
                    child: Text(
                      'Error ${state.error.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.red),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<TrackBloc>(context).add(GetTrack()),
            child: Text('Fetch'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _photoList(List<Track> data) {
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
              leading: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    CircularProgressIndicator(
                  value: progress.progress,
                ),
                imageUrl: data[i].thumbnailUrl,
              ),
            ),
          ),
        );
      },
    );
  }
}
