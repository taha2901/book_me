import 'package:finalabanob/core/helper/cach.dart';
import 'package:finalabanob/features/auth/presentation/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  final List<OnBoardingModel> board = [
    OnBoardingModel(
        title: 'Welcome',
        body: 'Lets Go Start Reading',
        image: 'assets/1.png'),
    OnBoardingModel(
        title: 'Here,',
        body: 'There are alot of books',
        image: 'assets/2.png'),
    OnBoardingModel(
        title: 'this is bookly app',
        body: 'Easy',
        image: 'assets/3.png'),
  ];
  bool islast = false;
  void submit() {
    ChachHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>  const LoginScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text(
              'SKIP',
              // style: TextStyle(color: Colors.amberAccent),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == board.length - 1) {
                    setState(() {
                      islast = true;
                    });
                    print('Last');
                  } else {
                    print('Not Last');
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return BuildBoardingItem(
                    board: board[index],
                  );
                },
                itemCount: board.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: board.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (islast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

// ignore: must_be_immutable
class BuildBoardingItem extends StatelessWidget {
  BuildBoardingItem({
    super.key,
    required this.board,
  });

  OnBoardingModel board;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(board.image),
          ),
        ),
        Text(
          board.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          board.body,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}




// class OnBoardingScreen extends StatelessWidget {
//   final Color kDarkBlueColor = const Color(0xFF053149);

//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OnBoardingSlider(
//       finishButtonText: 'Register',
//       onFinish: () {
//         ChachHelper.saveData(key: 'onBoarding', value: true).then((value) {
//           if (value) {
//             Navigator.push(
//               context,
//               CupertinoPageRoute(
//                 builder: (context) => RegisterScreen(),
//               ),
//             );
//           }
//         });
//       },

//       finishButtonStyle: FinishButtonStyle(
//         backgroundColor: kDarkBlueColor,
//       ),
//       skipTextButton: Text(
//         'Skip',
//         style: TextStyle(
//           fontSize: 16,
//           color: kDarkBlueColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       trailing: Text(
//         'Login',
//         style: TextStyle(
//           fontSize: 16,
//           color: kDarkBlueColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       trailingFunction: () {
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//         );
//       },
//       controllerColor: kDarkBlueColor,
//       totalPage: 3,
//       headerBackgroundColor: Colors.white,
//       pageBackgroundColor: Colors.white,
//       background: [
//         Image.asset(
//           'assets/1.jpg',
//           height: 400,
//         ),
//         Image.asset(
//           'assets/2.jpg',
//           height: 400,
//         ),
//         Image.asset(
//           'assets/2.jpg',
//           height: 400,
//         ),
//       ],
//       speed: 1.8,
//       pageBodies: [
//         Container(
//           alignment: Alignment.center,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 height: 480,
//               ),
//               Text(
//                 'On your way...',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: kDarkBlueColor,
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'to find the perfect looking Onboarding for your app?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black26,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 height: 480,
//               ),
//               Text(
//                 'You’ve reached your destination.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: kDarkBlueColor,
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'Sliding with animation',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black26,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 height: 480,
//               ),
//               Text(
//                 'Start now!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: kDarkBlueColor,
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'Where everything is possible and customize your onboarding.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black26,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
