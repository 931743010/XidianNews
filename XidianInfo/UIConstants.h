//
//  UIConstants.h
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#ifndef UIConstants_h
#define UIConstants_h

//main screen
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height
#define kScreenWidth [[UIScreen mainScreen]bounds].size.width

//RGB colors
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define HEXCOLOR(color) RGB(((color & 0xff0000) >> 16),((color & 0xff00) >> 8),(color & 0x0000ff))

//font
#define kTitleFont [UIFont systemFontOfSize:17.0]
#define kTimeFont [UIFont systemFontOfSize:12.0]
#define kFromFont [UIFont systemFontOfSize:12.0]
#define kBannerLabelFont [UIFont systemFontOfSize:16]

//size
#define kBannerHeight 36.0
#define kBannerLabelWidth 85.0
#define kBannerLabelHeight 32.0
#define kNewEntityCellPadding 11.0


#endif /* UIConstants_h */
