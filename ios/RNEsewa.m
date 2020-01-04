
#import "RNEsewa.h"

@implementation RNEsewa

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(getModuleList: (RCTResponseSenderBlock)callback)
{
   NSArray *nativeModuleList = @[@"react-native-fbsdk", @"react-native-camera", @"react-native-maps"];
   callback(@[nativeModuleList]);
}
// @interface RCT_EXTERN_REMAP_MODULE(RNEsewa, Esewa, NSObject)
//     // RCT_EXPORT_MODULE()
//     // RCT_EXTERN_METHOD(increment)
// // RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
// // RCT_EXTERN_METHOD(decrement: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

@end
  