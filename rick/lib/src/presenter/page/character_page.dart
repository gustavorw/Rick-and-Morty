import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/src/domain/events/character_events.dart';
import 'package:rick/src/domain/states/character_state.dart';
import 'package:rick/src/infra/repository/character_repository.dart';
import 'package:rick/src/presenter/bloc/character_bloc.dart';
import 'package:rick/src/presenter/page/widgets/character_item_widget.dart';

class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  ScrollController scrollController = ScrollController();
  final bloc = CharacterBloc(CharacterRepositoryImpl(Dio()));

  @override
  void initState() {
    bloc.add(FetchCharacterEvent());
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !bloc.state.isLoading) {
      bloc.add(FetchCharacterEvent());
    }
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
      body: Container(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          cubit: bloc,
          builder: (context, state) {
            return Column(
              children: [
                if (state.data.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: state.data.length,
                      // physics: BouncingScrollPhysics(),
                      itemBuilder: (_, index) {
                        return CharacterItemWidget(
                            character: state.data[index]);
                      },
                    ),
                  ),
                if (state.isLoading)
                  Center(
                    child: Image.asset(
                      'assets/loading.gif',
                      width: 100,
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
