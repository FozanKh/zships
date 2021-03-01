import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  final List<Widget> items;
  final Axis axis;
  final int crossItemCount;

  const CustomGridView({@required this.items, this.axis = Axis.vertical, @required this.crossItemCount});

  @override
  _CustomGridViewState createState() => _CustomGridViewState(this.items, this.axis, this.crossItemCount);
}

class _CustomGridViewState extends State<CustomGridView> {
  final List<Widget> items;
  final Axis axis;
  final int crossItemCount;
  // List<Widget> children = [];

  _CustomGridViewState(this.items, this.axis, this.crossItemCount);

  List<Widget> getChildren() {
    // List<Row> temp = [];
    // items.forEach((item) {
    //   if (temp.last.children.length < crossItemCount)
    //     temp.last.children.add(Expanded(child: item));
    //   else {
    //     temp.add(Row(
    //       children: [item],
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //     ));
    //   }
    // });
    // return temp;

    List<Widget> temp = [];
    List<Widget> children = [];
    // children = [];
    widget.items.forEach((item) {
      if (temp.length < crossItemCount)
        temp.add(Expanded(child: item));
      else {
        children.add(Row(
          children: temp,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        ));
        temp = [];
        temp.add(Expanded(child: item));
      }
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: getChildren(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomGridView extends StatefulWidget {
//   final List<Widget> items;
//   final Axis axis;
//   final int crossItemCount;

//   CustomGridView({this.items, this.axis, this.crossItemCount});

//   @override
//   _CustomGridViewState createState() => _CustomGridViewState();
// }

// class _CustomGridViewState extends State<CustomGridView> {
//   List<Widget> children = [];

//   List<Widget> getChildren() {
//     List<Widget> temp = [];
//     children = [];
//     widget.items.forEach((item) {
//       if (temp.length < widget.crossItemCount)
//         temp.add(Expanded(child: item));
//       else {
//         children.add(Expanded(child: Row(children: temp)));
//         temp = [];
//         temp.add(item);
//       }
//     });
//     return children;
//   }

//   @override
//   Widget build(BuildContext context) {
//     getChildren();
//     return SingleChildScrollView(
//       scrollDirection: widget.axis ?? Axis.vertical,
//       child: Column(
//         children: children,
//       ),
//     );
//   }
// }
