import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo Home Page')),
        body: Page(),
      ),
    );
  }
}

/// Body of [Scaffold].
/// This page shows [EmptyView] at center of this page, and it can "pull to refresh".
class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(child: EmptyView()),
                ),
              )),
      // Dummy loading
      onRefresh: () => Future.delayed(Duration(milliseconds: 500)),
    );
  }
}

/// Widget that explain there are no data.
/// We hope this widget is centered at screen in [SingleChildScrollView].
class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "List is Empty!!",
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 16,
          ),
          Text("Also you can tap button below."),
          SizedBox(
            height: 32,
          ),
          RaisedButton(
            child: Text("Button Sample"),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Button Pressed"),
              ));
            },
          )
        ]);
  }
}
