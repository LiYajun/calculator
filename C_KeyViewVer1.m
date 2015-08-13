//
//  C_KeyView.m
//  calculator
//
//  Created by andybain on 14-5-20.
//  Copyright (c) 2014年 thumbsoft. All rights reserved.
//

#import "C_KeyView.h"
#import "C_Button.h"
@implementation C_KeyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//定制你的键盘
-(void)setAllKeyLine:(NSUInteger)lineNum Row:(NSUInteger)rowNum
{
    if(aryBtn==nil)
        aryBtn = [[NSMutableArray alloc]init];
    else
        return;
//    CGFloat px = self.frame.origin.x;
//    CGFloat py = self.frame.origin.y;
    
    
    for(int i=0; i<rowNum; i++)
    {
        for(int j=0; j<lineNum; j++)
        {
               C_Button* btn ;
            
                  btn = [[C_Button alloc]initWithFrame:CGRectMake( j*80.2,  i*80.2, 79.2, 79.2) ];
            
        
            if(i==0 &&j==0)//清除按钮
            {
      
               UIImage * newImage = [self addaImage:@"clearNormal.png" toImage:@"clearKeyNormal.png" ];
               [btn setImage:newImage forState:UIControlStateNormal ];
                
               UIImage * newImageA = [self addaImage:@"clearDown.png" toImage:@"clearKeyDown.png" ];
                [btn setImage: newImageA forState:UIControlStateHighlighted ];
                
            }else if( i==0&& (j>0&&j<lineNum) )//运算符按钮
            {
                if(j==1)
                {
                    UIImage * newImage = [self addaImage:@"signNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"signDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }else if(j==2)
                {
                    UIImage * newImage = [self addaImage:@"pertNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"pertDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }else if(j==3)
                {
                    UIImage * newImage = [self addaImage:@"divNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"divDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }

             
                
            }else if(j==lineNum-1 && (i>0&&i<rowNum) )//运算符按钮
            {
                if(i==1)
                {
                    UIImage * newImage = [self addaImage:@"mulNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"mulDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }else if(i==2)
                {
                    UIImage * newImage = [self addaImage:@"minuNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"minuDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }else if(i==3)
                {
                    UIImage * newImage = [self addaImage:@"plusNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"plusDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }else if(i==4)
                {
                    UIImage * newImage = [self addaImage:@"eqNormal.png" toImage:@"operKeyNormal.png" ];
                    [btn setImage:newImage forState:UIControlStateNormal ];
                    
                    UIImage * newImageA= [self addaImage:@"eqDown.png" toImage:@"numKeyDown.png"];
                    [btn setImage:newImageA forState:UIControlStateHighlighted ];
                }
                
            }else//数字按钮
            {
                [btn setImage:[UIImage imageNamed:@"numKeyNormal.png"] forState:UIControlStateNormal ];
                [btn setImage:[UIImage imageNamed:@"numKeyDown.png"] forState:UIControlStateHighlighted ];
                
            }
            
            btn.tag = i*lineNum +j;
            [btn addTarget:self action:@selector(ACT_btn:) forControlEvents: UIControlEventTouchUpInside ];
            btn.backgroundColor =[UIColor clearColor];
            [aryBtn  addObject: btn ];
            [self addSubview: btn];
        }
    }
    [aryBtn[4] setNum:@"7" ]; [aryBtn[5] setNum:@"8" ];  [aryBtn[6] setNum:@"9" ];
    [aryBtn[8] setNum:@"4" ]; [aryBtn[9] setNum:@"5" ];  [aryBtn[10] setNum:@"6" ];
    [aryBtn[12] setNum:@"1" ];[aryBtn[13] setNum:@"2" ]; [aryBtn[14] setNum:@"3" ];
    [aryBtn[16] setNum:@"00" ];[aryBtn[17] setNum:@"0" ]; [aryBtn[18] setNum:@"." ];
    
    
}
-(void)ACT_btn:(id)sender
{
    
}
-(UIImage *)addaImage:(NSString *)image1Str toImage:(NSString *)image2Str
{
    UIImage * image2 = [UIImage imageNamed:image2Str];
    UIImage * image1 = [UIImage imageNamed:image1Str];
    UIGraphicsBeginImageContext(image2.size);
    
    //Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    
    //Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}
//responder
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end































































