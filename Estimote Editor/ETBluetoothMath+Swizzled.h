//
//  ETBluetoothMath+Swizzled.h
//  Estimote Editor
//
//  Created by Sandeep Mistry on 12/21/2013.
//

@interface ETBluetoothMath : NSObject

@end

@interface ETBluetoothMath (Swizzled)

// original
+ (unsigned long)Secunit_ModExpWithBase:(unsigned long)arg1 Exp:(unsigned long)arg2 andMod:(unsigned long)arg3;
+ (unsigned long)randomUInt32;

// swizzled
+ (unsigned long)Secunit_ModExpWithBaseSwizzled:(unsigned long)arg1 Exp:(unsigned long)arg2 andMod:(unsigned long)arg3;
+ (unsigned long)randomUInt32Swizzled;

@end
