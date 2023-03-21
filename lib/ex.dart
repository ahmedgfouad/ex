import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Ex extends StatefulWidget {
  const Ex({Key? key}) : super(key: key);

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {

  final videoURL="https://www.youtube.com/watch?v=O7F-0_tQtMg";
   // YoutubePlayerController? _controller;
   
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  VideoPlayerController? _videoPlayerController2;
  ChewieController? _chewieController2;

  @override
  void initState() {
    super.initState();
    
    // final videID= YoutubePlayer.convertUrlToId(videoURL);
    // _controller = YoutubePlayerController(
    //     initialVideoId: videID!,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //   ),
    // );
    
    _videoPlayerController = VideoPlayerController.network(
      "https://drive.google.com/uc?export=view&id=1NUFYDXAVAsN5pPGrwjV7enWfDSxWBbrZ",
    );
    _videoPlayerController2 = VideoPlayerController.network(
      "https://drive.google.com/uc?export=view&id=1NUFYDXAVAsN5pPGrwjV7enWfDSxWBbrZ",
    );

    _videoPlayerController!.initialize().then((_) {
      _chewieController =
          ChewieController(videoPlayerController: _videoPlayerController!);
      setState(() {});
    });

    _videoPlayerController2!.initialize().then((_) {
      _chewieController2 =
          ChewieController(videoPlayerController: _videoPlayerController2!);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();

    _videoPlayerController2!.dispose();
    _chewieController2!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: .3, color: Colors.blue)),
                child: _chewieController != null &&
                    _videoPlayerController != null
                    ? Chewie(
                  controller: _chewieController!,
                )
                    : SizedBox(
                      width: 200,
                      height: 200,
                      child:
                      Center(child: CircularProgressIndicator(),),
                ),
              ),
              Image.network("https://drive.google.com/uc?export=view&id=1as8_dcEB6narJnjKIKIBA2etO0xIDECL"),
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK5q0FP74VV9wbfwP378_7kj7iDomHuKrxkXsxDdUT28V9dlVMNUe-EMzaLwaFhneeuZI&usqp=CAU"),

              // YoutubePlayer(
              //   controller: _controller!,
              //  showVideoProgressIndicator: true,
              //   // onReady: ()=> debugPrint("Ready"),
              //   // bottomActions: [
              //   //   CurrentPosition(),
              //   //   ProgressBar(
              //   //     isExpanded: true,
              //   //     colors: ProgressBarColors(
              //   //       playedColor: Colors.amber,
              //   //       handleColor: Colors.red,
              //   //     ),
              //   //   )
              //   // ],
              // ),
            ],
          ),
        ));
  }
}
