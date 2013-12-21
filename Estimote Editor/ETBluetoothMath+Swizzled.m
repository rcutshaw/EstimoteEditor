//
//  ETBluetoothMath+Swizzled.m
//  Estimote Editor
//
//  Created by Sandeep Mistry on 12/21/2013.
//

#import <objc/runtime.h>


#import "ETBluetoothMath+Swizzled.h"

@implementation ETBluetoothMath (Swizzled)

+ (void)load
{
    Method original, swizzled;
    
    original = class_getClassMethod(self, @selector(Secunit_ModExpWithBase:Exp:andMod:));
    swizzled = class_getClassMethod(self, @selector(Secunit_ModExpWithBaseSwizzled:Exp:andMod:));
    method_exchangeImplementations(original, swizzled);
    
    original = class_getClassMethod(self, @selector(randomUInt32));
    swizzled = class_getClassMethod(self, @selector(randomUInt32Swizzled));
    method_exchangeImplementations(original, swizzled);
}

+ (unsigned long)Secunit_ModExpWithBaseSwizzled:(unsigned long)arg1 Exp:(unsigned long)arg2 andMod:(unsigned long)arg3
{
    unsigned long secunit = [self Secunit_ModExpWithBaseSwizzled:arg1 Exp:arg2 andMod:arg3];
    
    NSLog(@"[ETBluetoothMath Secunit_ModExpWithBase:0x%lx Exp:0x%lx andMod:0x%lx ] = 0x%lx", arg1, arg2, arg3, secunit);
    
    return secunit;
}

+ (unsigned long)randomUInt32Swizzled
{
    unsigned long randomUInt32 = [self randomUInt32Swizzled];
    
    NSLog(@"[ETBluetoothMath randomUInt32] = 0x%lx", randomUInt32);
    
    return randomUInt32;
}

@end
