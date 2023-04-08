import 'package:e_commerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/wish_list_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());
  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishListProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishListProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishListProductToState(
    AddWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishListProductToState(
    RemoveWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
