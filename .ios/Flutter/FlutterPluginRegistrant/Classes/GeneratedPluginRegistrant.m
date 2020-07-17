//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

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

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTImagePickerSaverPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerSaverPlugin"]];
  [MultiImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"MultiImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
