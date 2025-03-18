#import "PpiSize.h"
#import "DeviceDimensions.h"

@implementation PpiSize
RCT_EXPORT_MODULE()

- (nonnull NSDictionary *)getDisplayMetrics {
  return [DeviceDimensions getDisplayMetrics];
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativePpiSizeSpecJSI>(params);
}

@end
