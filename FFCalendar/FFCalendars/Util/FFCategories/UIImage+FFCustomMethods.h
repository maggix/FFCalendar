//
//  UIImage+FFCustomMethods.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/18/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>

@interface UIImage (FFCustomMethods)

+ (UIImage *)FF_imageWithColor:(UIColor *)color;
+ (UIImage *)FF_scaleImage:(UIImage *)image toSize:(CGSize)newSize;
+ (UIImage*)FF_tintedImageNamed:(NSString*)imageName;

@end
