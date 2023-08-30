import 'package:flutter/material.dart';
import 'package:seda/global/global.dart';

class DraggableSearchableListView extends StatefulWidget {
  const DraggableSearchableListView(
      {Key? key,
      required this.w,
      required this.name,
      required this.description,
      required this.author,
      required this.date})
      : super(key: key);

  final double w;
  final String name;
  final String description;
  final String author;
  final String date;

  @override
  _DraggableSearchableListViewState createState() =>
      _DraggableSearchableListViewState();
}

class _DraggableSearchableListViewState
    extends State<DraggableSearchableListView> {
  final TextEditingController searchTextController = TextEditingController();
  final ValueNotifier<bool> searchTextCloseButtonVisibility =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> searchFieldVisibility = ValueNotifier<bool>(false);

  @override
  void dispose() {
    searchTextController.dispose();
    searchTextCloseButtonVisibility.dispose();
    searchFieldVisibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: Stack(
        children: <Widget>[
          DraggableScrollableSheet(
            initialChildSize: 0.50,
            minChildSize: 0.50,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 24.0,
                        right: 24.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                                border: Border.all(color: border),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/banners/docban.jpg'),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: widget.w * 0.02),
                                  width: widget.w * 0.45,
                                  child: Text(
                                    widget.author,
                                    style: smallTextBl,
                                  ),
                                ),
                                Text(widget.date, style: smallTextBl),
                                // Text('8 min read', style: smallTextBl),
                              ],
                            ),
                          ),
                          Text(widget.description, style: bodyTx),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
