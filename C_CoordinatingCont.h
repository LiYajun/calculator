//
//  C_CoordinatingCont.h
//  Guide
//
//  Created by andybain on 14-3-21.
//  Copyright (c) 2014年 thumbsoft. All rights reserved.
//
//  视图及视图变迁管理器（中介者，单例）
//  (1)集中管理视图变迁
//  (2)管理各个视图的引用

#import <Foundation/Foundation.h>



#import "C_mainViewCont.h"
#import "C_weaponViewCont.h"
    #import "C_typeWeaponViewCont.h"
    #import "C_delweaponViewCont.h"
#import "C_playerGuideViewCont.h"
#import "C_killstreakViewCont.h"
#import "C_mapViewCont.h"
#import "C_perksViewCont.h"
#import "C_trophiesViewCont.h"

#import "Macros.h"

@interface C_CoordinatingCont : NSObject
{
    UIViewController *      activeContPtr;      //处于活跃态的界面控制器
    C_mainViewCont *        mainViewPtr;        //主界面引用
    
    C_weaponViewCont *      weaponViewPtr;      //武器界面
        C_typeWeaponViewCont * typeWeaponViewPtr[7];   //武器分类界面 7种
        C_delweaponViewCont  * delWeaponViewPtr;       //武器详细界面
    
    C_playerGuideViewCont*  playerGuideViewPtr; //用户指南界面
    C_killstreakViewCont *  killstreakViewPtr;  //连杀奖励界面
    C_mapViewCont   *       mapViewPtr ;        //地图界面
    C_perksViewCont *       perksViewPtr;       //技能界面
    C_trophiesViewCont *    trophiesBtnPtr;     //成就界面
}
/*------------------------------------
 function name:
 -------------------------------------
 in:
 -------------------------------------
 out:
 -----------------------------------*/
+(C_CoordinatingCont *) sharedInstance;

/*------------------------------------
 function name: 视图界面变更
 -------------------------------------
 in:
 -------------------------------------
 out:
 -----------------------------------*/

-(IBAction) requestViewChangeByObject:(id)object;

//-(void) requestDelWeaponByObject:(NSUInteger) btnTag;

-(void) requestDelWeaponByTypeNumber:(NSUInteger)typenum BtnPos:(NSUInteger)btnpos TitleKey:(NSString *)key;
/*------------------------------------
 function name:创建主界面
 -------------------------------------
 in:
 -------------------------------------
 out:
 -----------------------------------*/
-(C_mainViewCont *)CreateMainView;
@end


































