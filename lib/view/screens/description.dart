import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:seda/classes/product.dart';
import 'package:seda/global/global.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/widgets/clipper.dart';
import 'package:native_video_player/native_video_player.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.id});

  final int id;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  var clipper = RecClipper();

  NativeVideoPlayerController? _controller;

  double iconOpacity = 1;

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
                        shadow: const BoxShadow(
                            color: Colors.transparent,
                            offset: Offset(0, -10),
                            blurRadius: 30,
                            spreadRadius: 10),
                      ),
                      child: ClipPath(
                        clipper: clipper,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              color: secondary,
                              height: h * 0.3,
                              width: w,
                              alignment: Alignment.topCenter,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            FutureBuilder<List<Product>>(
                future: oneProduct(widget.id),
                builder: (context, product) {
                  if (product.hasData) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                // height: h * 0.28,
                                width: w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: w * 0.5,
                                      decoration: BoxDecoration(
                                          color: white,
                                          boxShadow: [
                                            const BoxShadow(
                                                color: Colors.transparent,
                                                offset: Offset(0, 10),
                                                blurRadius: 30,
                                                spreadRadius: 10),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          picUrl(product.data![0].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: w * 0.9,
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.02),
                                      child: Text(
                                        product.data![0].name,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                        style: heading.copyWith(fontSize: 18),
                                      ),
                                    ),
                                    // Text(
                                    //   'Ультразвуковая диагностика',
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: title.copyWith(
                                    //       color: primary,
                                    //       fontWeight: FontWeight.w400),
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.02, bottom: 20),
                                      child: Text(
                                        'Giňişleýin düşündiriş',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: heading,
                                      ),
                                    ),
                                    Text(product.data![0].description,
                                        style: bodyTx),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.02, bottom: h * 0.01),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Stack(
                                            children: [
                                              NativeVideoPlayerView(
                                                onViewReady:
                                                    (controller) async {
                                                  _controller = controller;
                                                  await _controller
                                                      ?.setVolume(1);
                                                  await _loadVideoSource(picUrl(
                                                      product.data![0].video));
                                                },
                                              ),
                                              Material(
                                                type: MaterialType.transparency,
                                                child: InkWell(
                                                  onTap: _togglePlayback,
                                                  child: Center(
                                                    child: FutureBuilder(
                                                      future: _isPlaying,
                                                      initialData: false,
                                                      builder: (
                                                        BuildContext context,
                                                        AsyncSnapshot<bool>
                                                            snapshot,
                                                      ) {
                                                        final isPlaying =
                                                            snapshot.data ??
                                                                false;
                                                        return Icon(
                                                          isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          size: 64,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  iconOpacity),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.02, bottom: 5),
                                      child: Text(
                                        'Sorag-jogap',
                                        overflow: TextOverflow.ellipsis,
                                        style: heading,
                                      ),
                                    ),
                                    Accordion(
                                      disableScrolling: true,
                                      maxOpenSections: 2,
                                      headerBackgroundColorOpened:
                                          Colors.black54,
                                      scaleWhenAnimating: true,
                                      openAndCloseAnimation: true,
                                      headerPadding: const EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 15),
                                      sectionOpeningHapticFeedback:
                                          SectionHapticFeedback.heavy,
                                      sectionClosingHapticFeedback:
                                          SectionHapticFeedback.light,
                                      children: [
                                        for (var i = 0; i < 10; i++)
                                          AccordionSection(
                                            isOpen: false,
                                            rightIcon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Color(0xff3E5AE1)),
                                            // leftIcon:
                                            //     const Icon(Icons.insights_rounded, color: Color(0xff3E5AE1)),
                                            headerBackgroundColor: secondary,
                                            header: const Text('Introduction',
                                                style: headerStyle),
                                            content: const Text(loremIpsum,
                                                style: contentStyle),
                                            contentHorizontalPadding: 20,
                                            contentBorderWidth: 1,
                                            // onOpenSection: () => print('onOpenSection ...'),
                                            // onCloseSection: () => print('onCloseSection ...'),
                                          ),
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 44, bottom: 120),
                                        height: 60,
                                        width: w,
                                        decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Sorag galdymy?",
                                              style:
                                                  bodyTx.copyWith(color: white),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: white,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: primary),
                    );
                  }
                }),
            Container(
              width: w,
              height: h * 0.07,
              decoration: BoxDecoration(color: secondary),
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.01),
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
                    const SizedBox(
                      width: 60,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadVideoSource(String url) async {
    final videoSource = await VideoSource.init(
      type: VideoSourceType.network,
      path: url,
    );
    await _controller?.loadVideoSource(videoSource);
  }

  Future<void> _togglePlayback() async {
    final isPlaying = await _isPlaying;
    if (isPlaying) {
      await _controller?.pause();
      iconOpacity = 1;
    } else {
      await _controller?.play();
      iconOpacity = 0;
    }
    setState(() {});
  }

  Future<bool> get _isPlaying async => await _controller?.isPlaying() ?? false;
}
