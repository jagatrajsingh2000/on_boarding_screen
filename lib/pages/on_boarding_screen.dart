// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  late PageController _pageController;
   int _pageIndex =0 ;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: demo_data.length,
              controller: _pageController,
              onPageChanged: (index){
                setState((){
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) => onBoardContent(
                image: demo_data[index].image,
                title: demo_data[index].title,
                description: demo_data[index].description,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(demo_data.length, (index) => Padding(
                padding: EdgeInsets.only(right: 4),
                child: dotIndicator(isActive: index == _pageIndex), 
                )
                )
            ],
          ),
          // const Spacer(),
          SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              onPressed: () {
                _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    ),
  );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive? 12: 4,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/group.png",
    title: "Finders",
    description:"assets Here anbsdjkhds asdjhbasdjkhbnasn asdjhbsdkujhbnasdbjnbasd sadhbasjhdbjkhas hjab shjkdba sdbjhasb hjasdbjhasbd hjab",
    ),
    Onboard(
    image: "assets/images/group.png",
    title: "Finders2",
    description:"assets Here anbsdjkhds asdjhbasdjkhbnasn asdjhbsdkujhbnasdbjnbasd sadhbasjhdbjkhas hjab shjkdba sdbjhasb hjasdbjhasbd hjab",
    ),
    Onboard(
    image: "assets/images/group.png",
    title: "Finders3",
    description:"assets Here anbsdjkhds asdjhbasdjkhbnasn asdjhbsdkujhbnasdbjnbasd sadhbasjhdbjkhas hjab shjkdba sdbjhasb hjasdbjhasbd hjab",
    ),
];
class onBoardContent extends StatelessWidget {
  const onBoardContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image,
        height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16,),
        Text(description,
        textAlign: TextAlign.center,
        ),
        const Spacer(),
        
      ],
      );
  }
}