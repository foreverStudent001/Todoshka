import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  //web
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY')
  static const String firebaseWebApiKey = _Env.firebaseWebApiKey;
  @EnviedField(varName: 'FIREBASE_WEB_APP_ID')
  static const String firebaseWebAppId = _Env.firebaseWebAppId;
  @EnviedField(varName: 'FIREBASE_WEB_MESSAGING_SENDER_ID')
  static const String firebaseWebSenderId = _Env.firebaseWebSenderId;
  @EnviedField(varName: 'FIREBASE_WEB_PROJECT_ID')
  static const String firebaseWebProjectId = _Env.firebaseWebProjectId;
  @EnviedField(varName: 'FIREBASE_WEB_AUTH_DOMAIN')
  static const String firebaseWebAuthDomain = _Env.firebaseWebAuthDomain;
  @EnviedField(varName: 'FIREBASE_WEB_DATABASE_URL')
  static const String firebaseWebDatabaseUrl = _Env.firebaseWebDatabaseUrl;
  @EnviedField(varName: 'FIREBASE_WEB_STORAGE_BUCKET')
  static const String firebaseWebStorageBucket = _Env.firebaseWebStorageBucket;
  @EnviedField(varName: 'FIREBASE_WEB_MEASUREMENT_ID')
  static const String firebaseWebMeasurementId = _Env.firebaseWebMeasurementId;

  //android
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static const String firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;
  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static const String firebaseAndroidAppId = _Env.firebaseAndroidAppId;
  @EnviedField(varName: 'FIREBASE_ANDROID_MESSAGING_SENDER_ID')
  static const String firebaseAndroidSenderId = _Env.firebaseAndroidSenderId;
  @EnviedField(varName: 'FIREBASE_ANDROID_PROJECT_ID')
  static const String firebaseAndroidProjectId = _Env.firebaseAndroidProjectId;
  @EnviedField(varName: 'FIREBASE_ANDROID_DATABASE_URL')
  static const String firebaseAndroidDatabaseUrl = _Env.firebaseAndroidDatabaseUrl;
  @EnviedField(varName: 'FIREBASE_ANDROID_STORAGE_BUCKET')
  static const String firebaseAndroidStorageBucket = _Env.firebaseAndroidStorageBucket;

  //ios
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static const String firebaseIosApiKey = _Env.firebaseIosApiKey;
  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static const String firebaseIosAppId = _Env.firebaseIosAppId;
  @EnviedField(varName: 'FIREBASE_IOS_MESSAGING_SENDER_ID')
  static const String firebaseIosSenderId = _Env.firebaseIosSenderId;
  @EnviedField(varName: 'FIREBASE_IOS_PROJECT_ID')
  static const String firebaseIosProjectId = _Env.firebaseIosProjectId;
  @EnviedField(varName: 'FIREBASE_IOS_DATABASE_URL')
  static const String firebaseIosDatabaseUrl = _Env.firebaseIosDatabaseUrl;
  @EnviedField(varName: 'FIREBASE_IOS_STORAGE_BUCKET')
  static const String firebaseIosStorageBucket = _Env.firebaseIosStorageBucket;
  @EnviedField(varName: 'FIREBASE_IOS_IOS_BUNDLE_ID')
  static const String firebaseIosBundleId = _Env.firebaseIosBundleId;


//macos
  @EnviedField(varName: 'FIREBASE_MACOS_API_KEY')
  static const String firebaseMacosApiKey = _Env.firebaseMacosApiKey;
  @EnviedField(varName: 'FIREBASE_MACOS_APP_ID')
  static const String firebaseMacosAppId = _Env.firebaseMacosAppId;
  @EnviedField(varName: 'FIREBASE_MACOS_MESSAGING_SENDER_ID')
  static const String firebaseMacosSenderId = _Env.firebaseMacosSenderId;
  @EnviedField(varName: 'FIREBASE_MACOS_PROJECT_ID')
  static const String firebaseMacosProjectId = _Env.firebaseMacosProjectId;
  @EnviedField(varName: 'FIREBASE_MACOS_DATABASE_URL')
  static const String firebaseMacosDatabaseUrl = _Env.firebaseMacosDatabaseUrl;
  @EnviedField(varName: 'FIREBASE_MACOS_STORAGE_BUCKET')
  static const String firebaseMacosStorageBucket = _Env.firebaseMacosStorageBucket;
  @EnviedField(varName: 'FIREBASE_MACOS_IOS_BUNDLE_ID')
  static const String firebaseMacosBundleId = _Env.firebaseMacosBundleId;

}
