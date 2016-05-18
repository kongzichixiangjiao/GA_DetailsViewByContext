//
//  UIImage+StackBlur.h
//  stackBlur
//
//  Created by Thomas LANDSPURG on 07/02/12.
//  Copyright 2012 Digiwie. All rights reserved.
//
// StackBlur implementation on iOS
//
//

#import <UIKit/UIKit.h>

@interface UIImage (StackBlur)
    //毛玻璃
	- (UIImage*) stackBlur:(NSUInteger)radius;
    - (UIImage *) normalize ;
+ (void) applyStackBlurToBuffer:(UInt8*)targetBuffer width:(const int)w height:(const int)h bytesPerRow:(const int)bytesPerRow withRadius:(NSUInteger)inradius;
@end

