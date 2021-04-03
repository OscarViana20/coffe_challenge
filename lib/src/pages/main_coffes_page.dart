import 'package:coffe_challenge/src/notifier/coffe_notifier.dart';
import 'package:coffe_challenge/src/widgets/coffe_inherited_widget.dart';
import 'package:coffe_challenge/src/widgets/coffe_carrousel.dart';
import 'package:coffe_challenge/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MainCoffesPage extends StatefulWidget {
  const MainCoffesPage({Key key}) : super(key: key);

  @override
  _MainCoffesPageState createState() => _MainCoffesPageState();
}

class _MainCoffesPageState extends State<MainCoffesPage> {

  final notifier = CoffesNotifier();

  @override
  Widget build(BuildContext context) {
    
    return CoffeInheritedWidget(
      notifier: notifier,
      child: Scaffold(
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: notifier,
              builder: (context, _) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: notifier.coffesState == CoffesState.normal ? 
                        [Color(0xFfA3876A),  Colors.white] : 
                        [Colors.white, Colors.white]
                    )
                  )
                );
              },
            ),
            _shadow(),
            CoffeCarrousel()
          ],
        ),
      ),
    );
  }

  Widget _shadow() {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 80 - size.width,
      child: Container(
        width: size.width,
        height: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width),
          boxShadow: [
            BoxShadow(color: Color(0xFfD7AB81), spreadRadius: 50, blurRadius: 50),
          ],
        ),
      ),
    );
  }
}