import 'package:coffe_challenge/src/models/coffes_model.dart';
import 'package:coffe_challenge/src/widgets/coffe_inherited_widget.dart';
import 'package:coffe_challenge/src/utils/calculate.dart';
import 'package:flutter/material.dart';

class CoffeCarrousel extends StatefulWidget {

  @override
  _CoffeCarrouselState createState() => _CoffeCarrouselState();
}

class _CoffeCarrouselState extends State<CoffeCarrousel> {

  int _page;
  bool _textVisible;
  PageController _pageController; 
  
  void onListen() {
    _textVisible = true;
    setState(() { });
  }

  @override
  void initState() {
    _page = 2;
    _textVisible = false;
    _pageController = PageController(initialPage: _page, viewportFraction: 0.3);
    _pageController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {     
    _pageController.removeListener(onListen);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final notifier = CoffeInheritedWidget.of(context).notifier;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ...List.generate(
          coffes.length,
            (index) => AnimatedPositioned(
            top:  _textVisible ? kToolbarHeight * 1.2 : -100,
            left: textMovePosition(width, _page, index),
            duration: const Duration(milliseconds: 400),
            child:  AnimatedOpacity(
              opacity: textOpacity(_page, index),
              duration: const Duration(milliseconds: 800),
              child: _coffeeTex(coffes[index].coffeName, FontWeight.w800)
            ),
          )
        ).toList(),
        ...List.generate(
          coffes.length,
            (index) => AnimatedPositioned(
            top:  _textVisible ? kToolbarHeight * 1.2 + 70 : -100,
            duration: const Duration(milliseconds: 400),
            child:  AnimatedOpacity(
              opacity: textOpacity(_page, index),
              duration: const Duration(milliseconds: 300),
              child: _coffeeTex('${coffes[index].price.toStringAsFixed(2)} €', FontWeight.w400)
            ),
          )
        ).toList(),
        ...List.generate(
        coffes.length,
          (index) => AnimatedPositioned(
            curve: Curves.decelerate,
            top: assignPosition(height, _page, index),
            duration: const Duration(milliseconds: 400),
            child: AnimatedOpacity(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 400),
              opacity: assignOpacity(_page, index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
                height: assignHeight(width, _page, index),
                child: Hero(
                  tag: 'image_$index',
                  child: Image.asset(coffes[index].imagePath, fit: BoxFit.fill,)
                )
              ),
            ), 
          ),
        ).toList(),
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: coffes.length,
          onPageChanged: (page) {
            setState(() {
              _page = page;
              notifier.changeToAnimated();
            });
          },
          itemBuilder: (context, _) {
            return GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: Center()
              ),
              onTap: (){
                print('image_${coffes[_page].coffeName}');
              },
            );
          },
        )
      ]
    );
  }

  Widget _coffeeTex(String text, FontWeight fontWeight) {
    return SizedBox(
      width: 250,
      child : Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: 29, color: Colors.black, fontWeight: fontWeight)
      ),
    );
  }
}