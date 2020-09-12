
import 'package:delilo/screens/authenticate/authenticate.dart';
import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/authenticate/signinphone.dart';
import 'package:delilo/screens/home/account.dart';
import 'package:delilo/screens/home/cart.dart';
import 'package:delilo/screens/home/fashion/fashionmain.dart';
import 'package:delilo/screens/home/fashion/kidsfashion.dart';
import 'package:delilo/screens/home/fashion/mensfashion.dart';
import 'package:delilo/screens/home/fashion/womenfashion.dart';
import 'package:delilo/screens/home/fashion/womenfashiondress.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:delilo/screens/home/orders.dart';
import 'package:delilo/screens/home/paymentpage.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:delilo/screens/seller/authenticate/sellersignin.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/orderpage.dart';
import 'package:delilo/screens/seller/home/payin.dart';
import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:delilo/screens/seller/home/sellerprofile.dart';
import 'package:flutter/material.dart';

class NavigationHelper{

  static Route<dynamic> onGenerateroutes(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name)
    {
      case '/usersignin':return MaterialPageRoute(builder: (_) => AuthenticateScreen());
      case '/getlocation':return MaterialPageRoute(builder: (_)=>GetLocationPage());
      case '/signin':return MaterialPageRoute(builder: (_)=>SigninPage());
      case '/siginphone':return MaterialPageRoute(builder: (_)=>SigninPhonePage());
      case '/homescreen':return MaterialPageRoute(builder: (_)=>HomePageScreen());
      case '/fashionmain':return MaterialPageRoute(builder: (_)=>FashionMainPage());
      case '/womenfashion':return MaterialPageRoute(builder: (_)=>WomenFashionScreen());
      case '/womenfashiondetail':return MaterialPageRoute(builder: (_)=>WomenFashionScreen());
      case '/womenfashiondress':return MaterialPageRoute(builder: (_)=>WomenDressDetailPage());
      case '/mensfashion':return MaterialPageRoute(builder: (_)=>MensFashionScreen());
      case '/kidsfashion':return MaterialPageRoute(builder: (_)=>KidsFashionScreen());
      case '/productsdetail':return MaterialPageRoute(builder: (_)=>ProductDetailPage());
      case '/cart':return MaterialPageRoute(builder: (_)=>CartPage());
      case '/payment':return MaterialPageRoute(builder: (_)=>PaymentPage());
      case '/adressconfirm':return MaterialPageRoute(builder: (_)=>AdressPage());
      case '/orderdone':return MaterialPageRoute(builder: (_)=>OrderPlaced());
      case '/orders':return MaterialPageRoute(builder: (_)=>OrdersPage());
      case '/accountinfo':return MaterialPageRoute(builder: (_)=>AccountInfo());


      /* seller screens*/

      case '/sellersignin':return MaterialPageRoute(builder: (_)=>SellerRegisterScreen());
      case '/getgstdetails':return MaterialPageRoute(builder: (_)=>GetGstDetails());
      case '/getbankdetails':return MaterialPageRoute(builder: (_)=>GetBankDetails());
      case '/getsign':return MaterialPageRoute(builder: (_)=>CollectSignPage());
      case '/verificationpage':return MaterialPageRoute(builder: (_)=>SellerVerificationPage());
      case '/sellerlogin':return MaterialPageRoute(builder: (_)=>SellerSigninScreen());
      case '/sellerhome':return MaterialPageRoute(builder: (_)=>SellerHomeScreen());
      case '/categorylisting':return MaterialPageRoute(builder: (_)=>SellerCategoryListing());
      case '/addproductpage':return MaterialPageRoute(builder: (_)=>NewProductPage());
      case '/outofstock':return MaterialPageRoute(builder: (_)=>OutOfStock());
      case '/orderslist':return MaterialPageRoute(builder: (_)=>SellerOrdersPage());
      case '/payin':return MaterialPageRoute(builder: (_)=>PayinPage());
      case '/sellerprofile':return MaterialPageRoute(builder: (_)=>SellerProfile());














    //case '/login':return MaterialPageRoute(builder: (_)=>AuthScreen());


    }
  }
}