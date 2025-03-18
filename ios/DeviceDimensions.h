#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@interface DeviceDimensions : NSObject

+ (NSDictionary *)getDisplayMetrics;

@end
