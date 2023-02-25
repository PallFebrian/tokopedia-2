import 'package:get/get.dart';

import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/checkEmail/bindings/check_email_binding.dart';
import '../modules/checkEmail/views/check_email_view.dart';
import '../modules/createProduk/bindings/create_produk_binding.dart';
import '../modules/createProduk/views/create_produk_view.dart';
import '../modules/createSlider/bindings/create_slider_binding.dart';
import '../modules/createSlider/views/create_slider_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeAdmin/bindings/home_admin_binding.dart';
import '../modules/homeAdmin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loginPhoneNumber/bindings/login_phone_number_binding.dart';
import '../modules/loginPhoneNumber/views/login_phone_number_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/sliderData/bindings/slider_data_binding.dart';
import '../modules/sliderData/views/slider_data_view.dart';
import '../modules/updateData/bindings/update_data_binding.dart';
import '../modules/updateData/views/update_data_view.dart';
import '../modules/verifikasiOTP/bindings/verifikasi_o_t_p_binding.dart';
import '../modules/verifikasiOTP/views/verifikasi_o_t_p_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_ADMIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_EMAIL,
      page: () => const CheckEmailView(),
      binding: CheckEmailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PHONE_NUMBER,
      page: () => LoginPhoneNumberView(),
      binding: LoginPhoneNumberBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI_O_T_P,
      page: () => VerifikasiOTPView(),
      binding: VerifikasiOTPBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_DATA,
      page: () => UpdateDataView(),
      binding: UpdateDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUK,
      page: () => const CreateProdukView(),
      binding: CreateProdukBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => const ProdukView(),
      binding: ProdukBinding(),
    ),
  ];
}
