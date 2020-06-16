import '../bloc/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  final String city;
  const SearchPage({Key key, this.city}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _serchCtrl;

  @override
  void initState() {
    _serchCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _serchCtrl.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

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
      body: WillPopScope(
        onWillPop: () async {
          BlocProvider.of<SearchBloc>(context).add(Empty());
          return true;
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Form(
                      child: inputCity(),
                      key: _formKey,
                    ),
                  ),
                  searchIcon(context),
                ],
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is SearchFail) {
                    return Expanded(
                      child: Center(
                        child: Text('Something went wrong!'),
                      ),
                    );
                  }

                  if (state is SearchSuccess && state.cities != null) {
                    return Expanded(
                      child: cityList(state, context),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView cityList(SearchSuccess state, BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        var city = state.cities[i].title;
        return InkWell(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text('${i + 1}.  $city',
                style: Theme.of(context).textTheme.subtitle1),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
          ),
          onTap: () async {
            BlocProvider.of<SearchBloc>(context).add(Empty());
            Navigator.pop(context, city);
          },
        );
      },
      itemCount: state.cities.length,
    );
  }

  IconButton searchIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          BlocProvider.of<SearchBloc>(context).add(FetchCity(_serchCtrl.text));
        }
      },
    );
  }

  TextFormField inputCity() {
    return TextFormField(
      autofocus: true,
      controller: _serchCtrl,
      validator: (value) {
        print(value);
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        // hintText: widget.city,
        border: OutlineInputBorder(),
      ),
    );
  }
}
