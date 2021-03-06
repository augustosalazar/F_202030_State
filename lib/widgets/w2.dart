import 'package:F_202030_SimpleStateProvider/bloc/simple_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//https://pub.dev/packages/flutter_bloc
class W2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SimpleBlocState(),
      child: Container(
          color: Colors.indigo,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Text("Widget 2",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                OneRow()
              ]))),
    );
  }
}

class OneRow extends StatelessWidget {
  const OneRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        P1(),
        P2(),
      ],
    );
  }
}

class P1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SimpleBlocState bloc = BlocProvider.of<SimpleBlocState>(context);
    return FlatButton(
        color: Theme.of(context).accentColor,
        child: Text("Click me",
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: () {
          bloc.add(MyEvent.increment);
        });
  }
}

class P2 extends StatelessWidget {
  const P2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleBlocState, String>(
      builder: (context, t) => Text('$t',
          style: TextStyle(
            color: Colors.white,
          )),
    );
  }
}
