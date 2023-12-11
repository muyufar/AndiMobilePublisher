import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainScreen(),
      binding: MainControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.RE_VERIFY,
      page: () => const ReVerifyScreen(),
      binding: ReVerifyControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.WISHLIST,
      page: () => const WishlistScreen(),
      binding: WishlistControllerBinding(),
    ),
    GetPage(
      name: Routes.TRANSACTION,
      page: () => const TransactionScreen(),
      binding: TransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.ITEM_DETAIL,
      page: () => const ItemDetailScreen(),
      binding: ItemDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: () => const CheckoutScreen(),
      binding: CheckoutControllerBinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: () => const CheckoutScreen(),
      binding: CheckoutControllerBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => const PaymentScreen(),
      binding: PaymentControllerBinding(),
    ),
    GetPage(
      name: Routes.TRANSACTION_DETAIL,
      page: () => const TransactionDetailScreen(),
      binding: TransactionDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => const CartScreen(),
      binding: CartControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_DETAIL,
      page: () => const EbookDetailScreen(),
      binding: EbookDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT_EBOOK,
      page: () => CheckoutEbookScreen(),
      binding: CheckoutEbookControllerBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_EBOOK,
      page: () => PaymentEbookScreen(),
      binding: PaymentEbookControllerBinding(),
    ),
    GetPage(
      name: Routes.RAKBUKU,
      page: () => RakbukuScreen(),
      binding: RakbukuControllerBinding(),
    ),
    GetPage(
      name: Routes.MAIN_TRANSACTION,
      page: () => const MainTransactionScreen(),
      binding: MainTransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_TRANSACTION,
      page: () => const EbookTransactionScreen(),
      binding: EbookTransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_TRANSACTION_DETAIL,
      page: () => const EbookTransactionDetailScreen(),
      binding: EbookTransactionDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_KATEGORI,
      page: () => EbookKategoriScreen(),
      binding: EbookKategoriControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_PENERBIT,
      page: () => const EbookPenerbitScreen(),
      binding: EbookPenerbitControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_VIEWALL,
      page: () => EbookViewallScreen(),
      binding: EbookViewallControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_RATINGS,
      page: () => EbookRatingsScreen(),
      binding: EbookRatingsControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_RATINGS_DETAIL,
      page: () => const EbookRatingTransactionDetailScreen(),
      binding: EbookPrimaryRatingsDetailScreenControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_RATINGS_INPUT,
      page: () => const EbookRatingsInputScreen(),
      binding: EbookRatingsInputControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_KATEGORI_CHILD,
      page: () => EbookKategoriChildScreen(),
      binding: EbookKategoriChildControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_KATEGORI_LIST,
      page: () => const EbookKategoriListScreen(),
      binding: EbookKategoriListControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_PENERBIT_LIST,
      page: () => const EbookPenerbitListScreen(),
      binding: EbookPenerbitListControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_VIEWALL_TERLARIS,
      page: () => EbookViewallTerlarisScreen(),
      binding: EbookViewallTerlarisControllerBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_SEARCH,
      page: () =>  EbookSearchScreen(),
      binding: EbookSearchControllerBinding(),
    ),
  ];
}
