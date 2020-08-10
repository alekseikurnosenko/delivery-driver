// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePage.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class AddressPicker extends StatelessWidget {
  const AddressPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => addressPicker(_context);
}

class RestaurantRating extends StatelessWidget {
  const RestaurantRating(this.rating, {Key key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext _context) => restaurantRating(_context, rating);
}

class RestaurantItem extends StatelessWidget {
  const RestaurantItem(this.restaurant, {Key key}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext _context) => restaurantItem(_context, restaurant);
}

class CustomerHomePage extends HookWidget {
  const CustomerHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => customerHomePage();
}
