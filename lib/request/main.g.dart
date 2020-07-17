// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _RequestInfo extends StatelessWidget {
  const _RequestInfo(this.request, {Key key}) : super(key: key);

  final DeliveryRequested request;

  @override
  Widget build(BuildContext _context) => _requestInfo(_context, request);
}

class _BottomSheetContainer extends HookWidget {
  const _BottomSheetContainer(this.request, {Key key}) : super(key: key);

  final DeliveryRequested request;

  @override
  Widget build(BuildContext _context) =>
      _bottomSheetContainer(_context, request);
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet(this.request, this.acceptButtonState,
      this.rejectButtonState, this.onAcceptRequest, this.onRejectRequest,
      {Key key})
      : super(key: key);

  final DeliveryRequested request;

  final ButtonState acceptButtonState;

  final ButtonState rejectButtonState;

  final Function onAcceptRequest;

  final Function onRejectRequest;

  @override
  Widget build(BuildContext _context) => _bottomSheet(request,
      acceptButtonState, rejectButtonState, onAcceptRequest, onRejectRequest);
}

class RequestPage extends StatelessWidget {
  const RequestPage(this.request, {Key key}) : super(key: key);

  final DeliveryRequested request;

  @override
  Widget build(BuildContext _context) => requestPage(request);
}
