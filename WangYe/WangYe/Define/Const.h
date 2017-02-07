//
//  Const.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#ifndef Const_h
#define Const_h

//OC语言
#ifdef __OBJC__
#ifdef DEBUG
//NSLog调试
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

// 打印方法调用的宏
#define LogFunc NSLog(@"%s", __func__)

#define YGScreenW [UIScreen mainScreen].bounds.size.width

#define YGScreenH [UIScreen mainScreen].bounds.size.height

// rgb颜色方法
#define YGRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机颜色
#define YGRandomColor YGRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 主题背景颜色
#define YGBgColor YGRGBColor(242, 244, 255)
#endif

#endif /* Const_h */
