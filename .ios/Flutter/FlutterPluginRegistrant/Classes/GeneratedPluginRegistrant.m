//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<city_pickers/CityPickersPlugin.h>)
#import <city_pickers/CityPickersPlugin.h>
#else
@import city_pickers;
#endif

#if __has_include(<connectivity/FLTConnectivityPlugin.h>)
#import <connectivity/FLTConnectivityPlugin.h>
#else
@import connectivity;
#endif

#if __has_include(<flutter_alipay/FlutterAlipayPlugin.h>)
#import <flutter_alipay/FlutterAlipayPlugin.h>
#else
@import flutter_alipay;
#endif

#if __has_include(<image_picker_saver/ImagePickerSaverPlugin.h>)
#import <image_picker_saver/ImagePickerSaverPlugin.h>
#else
@import image_picker_saver;
#endif

#if __has_include(<multi_image_picker/MultiImagePickerPlugin.h>)
#import <multi_image_picker/MultiImagePickerPlugin.h>
#else
@import multi_image_picker;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CityPickersPlugin registerWithRegistrar:[registry registrarForPlugin:@"CityPickersPlugin"]];
  [FLTConnectivityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTConnectivityPlugin"]];
  [FlutterAlipayPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterAlipayPlugin"]];
  [FLTImagePickerSaverPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerSaverPlugin"]];
  [MultiImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"MultiImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
