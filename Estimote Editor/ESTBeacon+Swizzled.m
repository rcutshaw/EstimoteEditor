//
//  NSObject+Swizzled.m
//  Estimote Editor
//
//  Created by Sandeep Mistry on 12/21/2013.
//
#import <objc/runtime.h>

#import "ESTBeacon+Swizzled.h"

@implementation ESTBeacon (Swizzled)

+ (void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(pairSensorFirstPart));
    swizzled = class_getInstanceMethod(self, @selector(pairSensorFirstPartSwizzled));
    method_exchangeImplementations(original, swizzled);
    
    original = class_getInstanceMethod(self, @selector(pairSensorSecondPart));
    swizzled = class_getInstanceMethod(self, @selector(pairSensorSecondPartSwizzled));
    method_exchangeImplementations(original, swizzled);
}

- (void)pairSensorFirstPartSwizzled
{
    [self pairSensorFirstPartSwizzled];
}

- (void)pairSensorSecondPartSwizzled
{
    [self pairSensorSecondPartSwizzled];
}

@end
