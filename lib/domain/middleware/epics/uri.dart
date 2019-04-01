const String BASE_URL = 'http://104.248.32.237';
const String ATTACHMENT_URL = '/api/v1/attach';
const String GEO_SEARCH_URL = '/api/v1/geo/search';
const String CURRENCIES_URL = '/api/v1/currencies';
const String CITY_URL = '/api/v1/countries/';
const String USER_LOGIN_URL = '/api/v1/user/login';
const String POPULAR_BREEDS_URL = '/api/v1/popular_breeds';
const String BREEDS_URL = '/api/v1/breeds';
const String DOGS_URL = '/api/v1/dogs';
const String DOGS_FILTER_URL = '/api/v1/dogs/filter';
const String PROFILE_URL = '/api/v1/user/profile';
const String FAVORITE_DOGS_URL = '/api/v1/user/profile/favorite_dog';
const String RECOVERY_URL = '/api/v1/user/remind_password';
const String REGISTRATION_URL = '/api/v1/user/registration';

const String USER_NOT_FOUND = 'User not found';
const String SUCCESS = "Success";
const String BAD_CREDENTIALS = "Bad credentials";
const String EMPTY_ARRAY = "[]";
const String FACEBOOK_LOGIN = "/api/v1/user/facebook_login";
const String REFRESH_ACCESS_TOKEN = "/api/v1/user/refresh_access_token";
const String PATCH_USER_PROFILE = "/api/v1/user/profile";
const String REQUEST_PHONE_EDIT = "/api/v1/user/profile/request_phone_edit";
const String PHONE_EDIT = "/api/v1/user/profile/phone";
const String COLOURS_URL = "/api/v1/dogs/colours";
const String GET_PARENTS_URL = "/api/v1/dogs/get_parents";

final bool https = false; //false;

final String baseUrl = "104.248.32.237";

final Uri postRegisterUrl = https
    ? Uri.https(baseUrl, REGISTRATION_URL)
    : Uri.http(baseUrl, REGISTRATION_URL);

final Uri postRemindPasswordUrl =
    https ? Uri.https(baseUrl, RECOVERY_URL) : Uri.http(baseUrl, RECOVERY_URL);

final Uri postLoginUrl = https
    ? Uri.https(baseUrl, USER_LOGIN_URL)
    : Uri.http(baseUrl, USER_LOGIN_URL);

final Uri postFacebookLoginUrl = https
    ? Uri.https(baseUrl, FACEBOOK_LOGIN)
    : Uri.http(baseUrl, FACEBOOK_LOGIN);

final Uri getProfileUrl =
    https ? Uri.https(baseUrl, PROFILE_URL) : Uri.http(baseUrl, PROFILE_URL);

final Uri getBreedsUrl =
    https ? Uri.https(baseUrl, BREEDS_URL) : Uri.http(baseUrl, BREEDS_URL);

final Uri getPopularBreeds = https
    ? Uri.https(baseUrl, POPULAR_BREEDS_URL)
    : Uri.http(baseUrl, POPULAR_BREEDS_URL);

final Uri favoriteDogsUrl = https
    ? Uri.https(baseUrl, FAVORITE_DOGS_URL)
    : Uri.http(baseUrl, FAVORITE_DOGS_URL);

final Uri dogsFilterUrl = https
    ? Uri.https(baseUrl, DOGS_FILTER_URL)
    : Uri.http(baseUrl, DOGS_FILTER_URL);

final Uri dogsUrl =
    https ? Uri.https(baseUrl, DOGS_URL) : Uri.http(baseUrl, DOGS_URL);

final Uri getGeoSearchUrl = https
    ? Uri.https(baseUrl, GEO_SEARCH_URL)
    : Uri.http(baseUrl, GEO_SEARCH_URL);

final Uri refreshAccessTokenUrl = https
    ? Uri.https(baseUrl, REFRESH_ACCESS_TOKEN)
    : Uri.http(baseUrl, REFRESH_ACCESS_TOKEN);

final Uri patchUserProfile = https
    ? Uri.https(baseUrl, PATCH_USER_PROFILE)
    : Uri.http(baseUrl, PATCH_USER_PROFILE);

final Uri requestPhoneEdit = https
    ? Uri.https(baseUrl, REQUEST_PHONE_EDIT)
    : Uri.http(baseUrl, REQUEST_PHONE_EDIT);

final Uri editPhoneUri =
    https ? Uri.https(baseUrl, PHONE_EDIT) : Uri.http(baseUrl, PHONE_EDIT);

final Uri attachmentUrl = https
    ? Uri.https(baseUrl, ATTACHMENT_URL)
    : Uri.http(baseUrl, ATTACHMENT_URL);

final Uri getColoursUrl =
    https ? Uri.https(baseUrl, COLOURS_URL) : Uri.http(baseUrl, COLOURS_URL);

final Uri getParentsUrl = https
    ? Uri.https(baseUrl, GET_PARENTS_URL)
    : Uri.http(baseUrl, GET_PARENTS_URL);

var headers = {'content-type': 'application/json'};

const statusCodeForbidden = 403;
const statusCodeNotFound = 404;
const statusCodeConflict = 409;
const statusCodeBadRequest = 400;
const statusCodeUnauthorized = 401;
const statusCodeOK = 200;
