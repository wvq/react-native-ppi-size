#import "DeviceDimensions.h"
#import <sys/utsname.h>

// data from:
// https://www.ios-resolution.com/
// https://github.com/pluwen/apple-device-model-list
static NSDictionary* DEVICE_DIMENSIONS = @{
  
  // iPhone
  @"iPhone1,1": @{ @"name": @"iPhone", @"logicWidth": @320, @"logicHeight": @480, @"width": @320, @"height": @480, @"ppi": @163 },
  @"iPhone1,2": @{ @"name": @"iPhone 3G", @"logicWidth": @320, @"logicHeight": @480, @"width": @320, @"height": @480, @"ppi": @163 },
  @"iPhone2,1": @{ @"name": @"iPhone 3GS", @"logicWidth": @320, @"logicHeight": @480, @"width": @320, @"height": @480, @"ppi": @163 },
  @"iPhone3,1": @{ @"name": @"iPhone 4", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone3,2": @{ @"name": @"iPhone 4", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone3,3": @{ @"name": @"iPhone 4", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone4,1": @{ @"name": @"iPhone 4S", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone4,2": @{ @"name": @"iPhone 4S", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone4,3": @{ @"name": @"iPhone 4S", @"logicWidth": @320, @"logicHeight": @480, @"width": @640, @"height": @960, @"ppi": @326 },
  @"iPhone5,1": @{ @"name": @"iPhone 5", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone5,2": @{ @"name": @"iPhone 5", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone5,3": @{ @"name": @"iPhone 5C", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone5,4": @{ @"name": @"iPhone 5C", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone6,1": @{ @"name": @"iPhone 5S", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone6,2": @{ @"name": @"iPhone 5S", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone7,2": @{ @"name": @"iPhone 6", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone7,1": @{ @"name": @"iPhone 6 Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone8,1": @{ @"name": @"iPhone 6S", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone8,2": @{ @"name": @"iPhone 6S Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone8,4": @{ @"name": @"iPhone SE", @"logicWidth": @320, @"logicHeight": @568, @"width": @640, @"height": @1136, @"ppi": @326 },
  @"iPhone9,1": @{ @"name": @"iPhone 7", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone9,3": @{ @"name": @"iPhone 7", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone9,2": @{ @"name": @"iPhone 7 Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone9,4": @{ @"name": @"iPhone 7 Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone10,1": @{ @"name": @"iPhone 8", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone10,4": @{ @"name": @"iPhone 8", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone10,2": @{ @"name": @"iPhone 8 Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone10,5": @{ @"name": @"iPhone 8 Plus", @"logicWidth": @414, @"logicHeight": @736, @"width": @1080, @"height": @1920, @"ppi": @401 },
  @"iPhone10,3": @{ @"name": @"iPhone X", @"logicWidth": @375, @"logicHeight": @812, @"width": @1125, @"height": @2436, @"ppi": @458 },
  @"iPhone10,6": @{ @"name": @"iPhone X", @"logicWidth": @375, @"logicHeight": @812, @"width": @1125, @"height": @2436, @"ppi": @458 },
  @"iPhone11,2": @{ @"name": @"iPhone Xs", @"logicWidth": @375, @"logicHeight": @812, @"width": @1125, @"height": @2436, @"ppi": @458 },
  @"iPhone11,4": @{ @"name": @"iPhone Xs Max", @"logicWidth": @414, @"logicHeight": @896, @"width": @1242, @"height": @2688, @"ppi": @458 },
  @"iPhone11,6": @{ @"name": @"iPhone Xs Max", @"logicWidth": @414, @"logicHeight": @896, @"width": @1242, @"height": @2688, @"ppi": @458 },
  @"iPhone11,8": @{ @"name": @"iPhone XR", @"logicWidth": @414, @"logicHeight": @896, @"width": @828, @"height": @1792, @"ppi": @326 },
  @"iPhone12,1": @{ @"name": @"iPhone 11", @"logicWidth": @414, @"logicHeight": @896, @"width": @828, @"height": @1792, @"ppi": @326 },
  @"iPhone12,3": @{ @"name": @"iPhone 11 Pro", @"logicWidth": @375, @"logicHeight": @812, @"width": @1125, @"height": @2436, @"ppi": @458 },
  @"iPhone12,5": @{ @"name": @"iPhone 11 Pro Max", @"logicWidth": @414, @"logicHeight": @896, @"width": @1242, @"height": @2688, @"ppi": @458 },
  @"iPhone12,8": @{ @"name": @"iPhone SE 2", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone13,1": @{ @"name": @"iPhone 12 mini", @"logicWidth": @375, @"logicHeight": @812, @"width": @1080, @"height": @2340, @"ppi": @476 },
  @"iPhone13,2": @{ @"name": @"iPhone 12", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  @"iPhone13,3": @{ @"name": @"iPhone 12 Pro", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  @"iPhone13,4": @{ @"name": @"iPhone 12 Pro Max", @"logicWidth": @428, @"logicHeight": @926, @"width": @1284, @"height": @2778, @"ppi": @458 },
  @"iPhone14,4": @{ @"name": @"iPhone 13 mini", @"logicWidth": @375, @"logicHeight": @812, @"width": @1080, @"height": @2340, @"ppi": @476 },
  @"iPhone14,5": @{ @"name": @"iPhone 13", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  @"iPhone14,2": @{ @"name": @"iPhone 13 Pro", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  @"iPhone14,3": @{ @"name": @"iPhone 13 Pro Max", @"logicWidth": @428, @"logicHeight": @926, @"width": @1284, @"height": @2778, @"ppi": @458 },
  @"iPhone14,6": @{ @"name": @"iPhone SE 3", @"logicWidth": @375, @"logicHeight": @667, @"width": @750, @"height": @1334, @"ppi": @326 },
  @"iPhone14,7": @{ @"name": @"iPhone 14", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  @"iPhone14,8": @{ @"name": @"iPhone 14 Plus", @"logicWidth": @428, @"logicHeight": @926, @"width": @1284, @"height": @2778, @"ppi": @458 },
  @"iPhone15,2": @{ @"name": @"iPhone 14 Pro", @"logicWidth": @393, @"logicHeight": @852, @"width": @1179, @"height": @2556, @"ppi": @460 },
  @"iPhone15,3": @{ @"name": @"iPhone 14 Pro Max", @"logicWidth": @430, @"logicHeight": @932, @"width": @1290, @"height": @2796, @"ppi": @460 },
  @"iPhone15,4": @{ @"name": @"iPhone 15", @"logicWidth": @393, @"logicHeight": @852, @"width": @1179, @"height": @2556, @"ppi": @460 },
  @"iPhone15,5": @{ @"name": @"iPhone 15 Plus", @"logicWidth": @430, @"logicHeight": @932, @"width": @1290, @"height": @2796, @"ppi": @460 },
  @"iPhone16,1": @{ @"name": @"iPhone 15 Pro", @"logicWidth": @393, @"logicHeight": @852, @"width": @1179, @"height": @2556, @"ppi": @460 },
  @"iPhone16,2": @{ @"name": @"iPhone 15 Pro Max", @"logicWidth": @430, @"logicHeight": @932, @"width": @1290, @"height": @2796, @"ppi": @460 },
  @"iPhone17,3": @{ @"name": @"iPhone 16", @"logicWidth": @393, @"logicHeight": @852, @"width": @1179, @"height": @2556, @"ppi": @460 },
  @"iPhone17,4": @{ @"name": @"iPhone 16 Plus", @"logicWidth": @430, @"logicHeight": @932, @"width": @1290, @"height": @2796, @"ppi": @460 },
  @"iPhone17,1": @{ @"name": @"iPhone 16 Pro", @"logicWidth": @402, @"logicHeight": @874, @"width": @1206, @"height": @2622, @"ppi": @460 },
  @"iPhone17,2": @{ @"name": @"iPhone 16 Pro Max", @"logicWidth": @440, @"logicHeight": @956, @"width": @1320, @"height": @2868, @"ppi": @460 },
  @"iPhone17,5": @{ @"name": @"iPhone 16e", @"logicWidth": @390, @"logicHeight": @844, @"width": @1170, @"height": @2532, @"ppi": @460 },
  
  // iPad
  // TODO
  
  
};


@implementation DeviceDimensions

+ (NSDictionary *)getDisplayMetrics {
  
  struct utsname systemInfo;
  uname(&systemInfo);
  
  NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
  
  // check simulator model
  if([deviceModel isEqual:@"x86_64"] || [deviceModel isEqual:@"i386"] ) {
    deviceModel = [NSString stringWithFormat:@"%s", getenv("SIMULATOR_MODEL_IDENTIFIER")];
  }
  
  NSDictionary* model = DEVICE_DIMENSIONS[deviceModel];
  
  if(model != nil) {
    return @{
      @"brand": @"Apple",
      @"device_model": deviceModel,
      @"width": model[@"width"],
      @"height": model[@"height"],
      @"ppi": model[@"ppi"],
      @"x_ppi": model[@"ppi"],
      @"y_ppi": model[@"ppi"]
    };
  } else {
    return @{
      @"brand": @"Apple",
      @"device_model": deviceModel,
      @"width": @-1,
      @"height": @-1,
      @"ppi": @-1,
      @"x_ppi": @-1,
      @"y_ppi": @-1
    };
  }
}

@end
