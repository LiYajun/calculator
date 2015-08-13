//
//  C_KeyView.h
//  calculator
//
//  Created by andybain on 14-5-20.
//  Copyright (c) 2014年 thumbsoft. All rights reserved.
//  键盘视图类

#import <UIKit/UIKit.h>

@interface C_KeyView : UIView
{
    NSMutableArray * aryBtn;
}

-(void)setAllKeyLine:(NSUInteger)lineNum Row:(NSUInteger)rowNum;

@end
