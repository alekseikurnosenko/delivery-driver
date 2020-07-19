// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePage.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TopPanel extends HookWidget {
  const TopPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => topPanel();
}

class BottomPanel extends HookWidget {
  const BottomPanel(this.bloc, {Key key}) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext _context) => bottomPanel(_context, bloc);
}

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => homePage(_context);
}
