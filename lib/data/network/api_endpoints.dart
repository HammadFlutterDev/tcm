import '../enums/api_path.dart';

class ApiEndpoints {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.signup:
        return "user/signup";
      case APIPath.screenName:
        return "user/check";
      case APIPath.signin:
        return "user/login";
      case APIPath.completeProfile:
        return "user/profile-complete";
      case APIPath.verifyOTP:
        return "user/verify-otp";
      case APIPath.favouriteList:
        return "user/all-favorite";
      case APIPath.resendOTP:
        return "user/resend-otp";
      case APIPath.forgetPassword:
        return "user/request-password";
      case APIPath.forgetPasswordVerify:
        return "user/verify-otp-forget";
      case APIPath.resetPassword:
        return "user/reset-password";
      case APIPath.updateProfile:
        return "user/update-profile";
      case APIPath.deleteProfile:
        return "user/delete-account";
      case APIPath.getAllCategories:
        return "user/categories-listing";
      case APIPath.homeProductsByType:
        return "user/home-page-products";
      case APIPath.homeAllProductsByType:
        return "user/show-all-products-deals-or-all";
      case APIPath.productDetails:
        return "user/product-detail-page";
      case APIPath.productListByType:
        return "user/product-listing-data";
      case APIPath.favouriteCheck:
        return "user/add-to-favorites";
      case APIPath.favouriteUncheck:
        return "user/remove-from-favorite";
      case APIPath.subcategories:
        return "user/sub-categories";
      case APIPath.subcategoriesProducts:
        return "user/category-vice-product-listing";
      case APIPath.favouriteProducts:
        return "user/all-favorite-products";
      case APIPath.similarProducts:
        return "user/get-related-products";
      case APIPath.contactSupport:
        return "user/contact-support";
      case APIPath.searchProduct:
        return "user/search-product";
      case APIPath.logout:
        return "user/logout";
      case APIPath.refresh:
        return "user/refresh";
      case APIPath.notifications:
        return "user/get-notification";
      case APIPath.privacyPolicy:
        return "user/privacy-policy";
      
    }
  }
}
