
#import "RNEsewa.h"

@implementation RNEsewa

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(getModuleList: (RCTResponseSenderBlock)callback)
{
   NSArray *nativeModuleList = @[@"react-native-fbsdk", @"react-native-camera", @"react-native-maps"];
   callback(@[nativeModuleList]);
}
@end
  