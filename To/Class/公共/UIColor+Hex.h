//
//  UIColor+Hex.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(NSInteger)color;
+ (UIColor *)colorWithHex:(NSInteger)color alpha:(CGFloat)alpha;

@end
