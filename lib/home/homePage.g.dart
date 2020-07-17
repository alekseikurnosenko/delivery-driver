// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePage.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(this.initials, {Key key}) : super(key: key);

  final String initials;

  @override
  Widget build(BuildContext _context) => profileWidget(_context, initials);
}

class TopPanel extends StatelessWidget {
  const TopPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => topPanel();
}

class BottomPanel extends StatelessWidget {
  const BottomPanel(this.bloc, {Key key}) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext _context) => bottomPanel(_context, bloc);
}
