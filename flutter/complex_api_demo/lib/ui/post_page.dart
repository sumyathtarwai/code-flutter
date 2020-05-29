import 'package:cached_network_image/cached_network_image.dart';
import 'package:complex_api_demo/data/local/database.dart';
import 'package:complex_api_demo/data/model/featured_image.dart';
import 'package:complex_api_demo/data/post.dart';
import 'package:complex_api_demo/network/service/rest_client.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:complex_api_demo/data/model/title.dart' as titleModel;

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> _posts = [];
  RefreshController _refreshController;
  int _currentPage = 1;

  @override
  void initState() {
    _refreshController = RefreshController(
      initialRefresh: true,
      initialRefreshStatus: RefreshStatus.refreshing,
    );

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _posts = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.failed) {
              body = Text("Load Failed! Click retry!");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: () => _onRefresh(context),
        onLoading: () => _onLoading(context),
        child: _postList(context),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.indigo,
  //     ),
  //     // body: SmartRefresher(
  //     //   controller: _refreshController,
  //     //   header: WaterDropHeader(),
  //     //   footer: ClassicFooter(),
  //     //   enablePullDown: true,
  //     //   enablePullUp: true,
  //     //   onRefresh: () => _onRefresh(context),
  //     //   onLoading: () => _onLoading(context),

  //     //   child: _postList(context),
  //     // ),
  // }

  void _onRefresh(BuildContext context) async {
    bool network = await _isNetworkOn(context);
    print('network $network');
    if (network != null && network) {
      Map<String, dynamic> page = {"page": 1, "per_page": 30};
      final api = Provider.of<RestClient>(context, listen: false);
      try {
        api.getPosts(page).then(
          (onValue) async {
            if (onValue.length > 1) {
              if (mounted) {
                setState(
                  () {
                    _posts.clear();
                    _posts.addAll(onValue);
                    _addLocalPosts(context, onValue, _currentPage);
                    _currentPage = 2;
                  },
                );
              }
              _refreshController.refreshCompleted();
            } else {
              //_refreshController.refreshFailed();
            }
          },
        ).catchError(
          (onError) {
            _showDialog(context);
            offLineLoadByPage(context, _currentPage);
            _refreshController.refreshCompleted();
            // _refreshController.refreshFailed();
          },
        );
      } on DioError catch (error) {
        if (error.response.statusCode == 400) {
          _refreshController.loadNoData();
        }
      }
    } else {
      _showDialog(context);
      offLineLoadByPage(context, _currentPage);
      _refreshController.refreshCompleted();
    }
  }

  void offLineLoadByPage(BuildContext context, int page) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    setState(() async {
      _posts.clear();
      List<Post> posts =
          await db.postDao.getLocalPostsByPage(page).then((onValue) {
        return onValue
            .map((v) => Post(
                id: v.id,
                slug: v.slug,
                title: titleModel.Title(rendered: v.title),
                status: v.status,
                image: FeaturedImage(sourceUrl: v.image),
                date: v.date))
            .toList();
      });
      posts.forEach((f) => print("posts $f"));
      _posts.addAll(posts);
    });
  }

  void _onLoading(BuildContext context) async {
    bool network = await _isNetworkOn(context);
    if (network != null && network) {
      Map<String, dynamic> page = {"page": _currentPage, "perPage": 30};
      final api = Provider.of<RestClient>(context, listen: false);

      try {
        api.getPosts(page).then(
          (onValue) {
            if (onValue.length > 0) {
              if (mounted) {
                setState(() {
                  _posts.clear();
                  _posts.addAll(onValue);
                  _posts.addAll(onValue);
                  _addLocalPosts(context, onValue, _currentPage);
                  _currentPage++;
                });
              }
              _refreshController.loadComplete();
              // print(onValue.length);
            } else {
              _refreshController.loadFailed();
            }
          },
        ).catchError((onError) {
          _showDialog(context);
          offLineLoadByPage(context, _currentPage);
          _refreshController.loadComplete();
          //  _refreshController.loadFailed();
        });
      } on DioError catch (error) {
        if (error.response.statusCode == 400) {
          _refreshController.loadNoData();
        }
      }
    } else {
      _showDialog(context);
      offLineLoadByPage(context, _currentPage);
      _refreshController.loadComplete();
    }
  }

  void _addLocalPosts(
      BuildContext context, List<Post> onValue, int currentPage) {
    final db = Provider.of<AppDatabase>(context, listen: false);
    List<LocalPost> localPosts = onValue
        .map(
          (v) => LocalPost(
              id: v.id,
              slug: v.slug,
              title: v.title.rendered,
              status: v.status,
              image: v.image.sourceUrl,
              page: currentPage,
              date: v.date),
        )
        .toList();
    db.postDao.insertAllLocalPosts(localPosts);
  }

  Widget _postList(BuildContext context) {
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 20.0,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    _posts[i].title.rendered,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(_posts[i].date),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Center(
                  child: CachedNetworkImage(
                    imageUrl: _posts[i].image.sourceUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // Image.network(data[i].image.sourceUrl),
              ],
            ),
          );
        });
  }

  Future<bool> _isNetworkOn(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('No Internet'),
          content: Text('Offline Reading'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(_).pop(),
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }
}
