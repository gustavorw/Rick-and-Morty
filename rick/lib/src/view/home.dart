import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick/src/stores/controller.dart';
import 'package:rick/src/view/widgets/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    controller.addCharacter();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.addCharacter();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        
        title: Image.asset(
         "assets/logo.png",
          height: 69,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: Observer(builder: (_) {
              return controller.characters.length != 0
                  ? Padding(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          controller: scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.characters.length,
                          // physics: BouncingScrollPhysics(),
                          itemBuilder: (_, index) {
                        
                            return Item(
                              character:controller.characters[index]
                            );
                          }),
                    )
                  : Center(
                  
                      child: Image.asset(
                        "assets/portal.gif",
                        width: 200,
                        height: 200,
                      ),
                    );
            }),
          )
        ],
      ),
    );
  }
}
