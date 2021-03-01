// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:zships/constants/colors.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:zships/constants/decorations.dart';

// class ImageSlider extends StatefulWidget {
//   final List<String> images;
//   final int index;
//   ImageSlider({Key key, this.images, this.index = 0}) : super(key: key);

//   @override
//   _ImageSliderState createState() => _ImageSliderState(index);
// }

// class _ImageSliderState extends State<ImageSlider> {
//   bool dismissed = true;
//   PageController _pageController;
//   int _currentPage;

//   _ImageSliderState(this._currentPage) {
//     _pageController = PageController(initialPage: _currentPage);
//   }

//   List<Widget> _buildPageIndicator(int pages) {
//     List<Widget> list = [];
//     for (int i = 0; i < pages; i++) {
//       list.add(i == _currentPage ? _indicator(true, i) : _indicator(false, i));
//     }
//     return list;
//   }

//   Widget _indicator(bool isActive, index) {
//     return InkWell(
//       onTap: () => setState(() => _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn)),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 150),
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         height: 8.0,
//         width: isActive ? 32.0 : 16.0,
//         decoration: BoxDecoration(
//           color: isActive ? kLight4 : Colors.grey.withOpacity(0.3),
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//       ),
//     );
//   }

//   closeViewer() async {
//     Navigator.pop(context);
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _pageController = PageController(initialPage: widget.index);
//     return Container(
//       color: Colors.black87,
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             leading: IconButton(icon: Icon(Icons.clear), onPressed: closeViewer),
//           ),
//           body: Stack(
//             children: [
//               PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) => setState(() => _currentPage = index),
//                 children: List.generate(
//                   widget.images.length,
//                   (index) => Dismissible(
//                     key: UniqueKey(),
//                     confirmDismiss: (x) async {
//                       print(x);
//                       closeViewer();
//                       return true;
//                     },
//                     direction: DismissDirection.down,
//                     child: PhotoView(
//                       imageProvider: NetworkImage(widget.images[index]),
//                       backgroundDecoration: BoxDecoration(color: kTransparent),
//                       minScale: 0.1,
//                       maxScale: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               if (widget.images.length >= 2)
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: _buildPageIndicator(widget.images.length),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
