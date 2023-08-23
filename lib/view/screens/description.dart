import 'package:flutter/material.dart';
import 'package:seda/view/global/global.dart';
import 'package:seda/view/widgets/clipper.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  var clipper = RecClipper();
  // late VideoPlayerController _controller;
  // void initVideo() {
  //   _controller = VideoPlayerController.asset('assets/test.mp4');

  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize().then((_) => setState(() {}));
  //   _controller.play();
  // }

  // late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    // initVideo();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: PreferredSize(
                preferredSize: Size(w, h * 0.3),
                child: SafeArea(
                  child: CustomPaint(
                    painter: ClipShadowShadowPainter(
                      clipper: clipper,
                      shadow: BoxShadow(
                          color: Colors.transparent,
                          offset: const Offset(0, -10),
                          blurRadius: 30,
                          spreadRadius: 10),
                    ),
                    child: ClipPath(
                      clipper: clipper,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            color: secondary,
                            height: h * 0.3,
                            width: w,
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: black,
                                        size: 30,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    }),
                                Image.asset(
                                  'assets/sedalogo.png',
                                  height: 38,
                                ),
                                SizedBox(
                                  width: 60,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            top: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.28,
                  width: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.transparent,
                                offset: const Offset(0, 10),
                                blurRadius: 30,
                                spreadRadius: 10),
                          ],
                        ),
                        child: Image.asset(
                          'assets/products/product.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'УЗИ аппарат Philips',
                        overflow: TextOverflow.ellipsis,
                        style: heading,
                      ),
                      Text(
                        'Ультразвуковая диагностика',
                        overflow: TextOverflow.ellipsis,
                        style: title.copyWith(
                            color: primary, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          'Подробное описание',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: heading,
                        ),
                      ),
                      Text(
                          'Just say anything, George, say what ever\'s natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it\'s 8:00. Hey, McFly, I thought I told you never',
                          style: bodyTx),
                      // AspectRatio(
                      //     aspectRatio: _controller.value.aspectRatio,
                      //     child: VideoPlayer(
                      //       _controller,
                      //     )),

                      // VideoProgressIndicator(_controller, allowScrubbing: true),
                      // FutureBuilder(
                      //   future: _initializeVideoPlayerFuture,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.done) {
                      //       return AspectRatio(
                      //         aspectRatio: _controller.value.aspectRatio,
                      //         child: VideoPlayer(_controller),
                      //       );
                      //     } else {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
