// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basketPage.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _BasketItem extends StatelessWidget {
  const _BasketItem(this.basketItem, this.onDeleteClick, {Key key})
      : super(key: key);

  final BasketItemDTO basketItem;

  final Function onDeleteClick;

  @override
  Widget build(BuildContext _context) =>
      _basketItem(_context, basketItem, onDeleteClick);
}

class BasketPage extends HookWidget {
  const BasketPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => basketPage(_context);
}
