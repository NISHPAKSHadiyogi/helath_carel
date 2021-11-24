class ApiConfig {
  @override
  noSuchMethod(Invocation invocation) async {
    return super.noSuchMethod(invocation);
  }

  final key_auth = 'Authorization';
  final key_auth_value =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDQwNDljMTZjNjkzZjAzZDFjNGUxODZmZmIyMDBhY2VjNmI5ZGNmNDJmNWMyODk4ZjQ5ODk1MDc4ZTYxOTkzYjZiYzFkYTg0NmQ3ZTJiZmYiLCJpYXQiOjE2MzM0MTgyNjguNDEyODA1LCJuYmYiOjE2MzM0MTgyNjguNDEyODA5LCJleHAiOjE2NjQ5NTQyNjguNDEwOCwic3ViIjoiNDEiLCJzY29wZXMiOltdfQ.VbMS3b1setMSujy73RC4tGI05yvJ6kGSattx-JZj7lDp0b5bt0PjxoaPVVlxm5wOO99Ef5LS7xHdmQANFsa-Ci5cO-uS8tsX8stcq1vcMVYZCrV6PRwymISk7pngcBjYwT3gG7t-PA0FGTuPRtVloXv73-0TykygMWljJ6l1U0armYYXp_aRGag_oeKgQ97Kxv5-0ekW_GcLEEu2vbBSoFTXdRds4sdZy4mTzz4s9sAkQZa39RlnvDze5RInp_vg9PfXGm6X52aK4niFdJ8f4hdbd9UgbkJLV40Wiox2Mtp5Vi3UAqVLkFhT-vp8YVEiaGwgvV3GkQJIInVoPvYKcyg0QwEy6pPa-yhcGwg_6xOP5MPnsURRpnHCh1dfbGSTGm9UMrIwQe-47h4lJ6pIfrK9VIQ2C4Pd-dFroPIIOHFcj4jdY0z4gi1gUHU-T3lDROt009soitHcEuHUMM7aicVcIl2CrxuV-nAJrMmcyZelvjtHWpMR2HHRI-Uvzw2IMSwZg_-R8BMR_l3n514H5SFNRYyKu78LJKV8vRQJLEtu7efXJKUdExq4n-YCQ3uSjR6qCp3UACooWQFMSEIhbQag-jX4wxqlmIbdI60OG1Co0Z5hr2HYXrfuSy1jceVx-bFyvQrMKpg1r6O3T18VOUuJmaf9rUpqGzNBzircbVc';

  final FcmId = "NODN2D0I7W4V8I2K";

  final slider_img_path = "uploads/slider/";

  final employee_expense_img_path = "/uploads/employee_expense/";

  final profile_img_path = "/uploads/employee/";

  String baseurl = "https://www.flymiles.com.au/admin/public/api/";

  String baseurl_img = "https://technolite.in/staging/easyhomecare/";

  String api_login = "logindriver";

  String api_register = "registerdriver";

  String api_get_all_booking = "getbookings?driver_id=";

  String api_get_profile = "employee";

  String api_update_profile = "employee_update";
}
