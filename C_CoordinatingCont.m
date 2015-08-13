//
//  C_CoordinatingCont.m
//  Guide
//
//  Created by andybain on 14-3-21.
//  Copyright (c) 2014年 thumbsoft. All rights reserved.
//

#import "C_CoordinatingCont.h"

@implementation C_CoordinatingCont



static C_CoordinatingCont * sharedSingleton = nil;


+(C_CoordinatingCont *) sharedInstance
{
    static dispatch_once_t pred =0;
    
    dispatch_once(&pred,^{
            sharedSingleton = [[super allocWithZone:NULL]init];
    });
    return  sharedSingleton;
    
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return  [self sharedInstance ];
}

-(id)copyWithZone:(NSZone *)zone
{
    return  self;
}


-(IBAction) requestViewChangeByObject:(id)object
{
    
    NSUInteger btnTag = ((UIView *)object).tag ;
    
    if(btnTag>=4000 && btnTag<=4006)
    {
        NSUInteger typeIndex = btnTag -4000;
        [typeWeaponViewPtr[typeIndex] dismissViewControllerAnimated:YES completion:^(void){}];
        activeContPtr = typeWeaponViewPtr[typeIndex];
        return ;
    }
    
    switch (btnTag)
    {
        case weaponBtnTag:
        {
            if(weaponViewPtr == nil) //(1)武器界面
            {
                weaponViewPtr =  [[C_weaponViewCont alloc]init];
            }
            [mainViewPtr presentViewController:weaponViewPtr animated:YES completion: ^(void){} ];
            activeContPtr = weaponViewPtr;
        }break;
            
            case marksmanBtnTag://(1.1)武器分类界面
            {
                if(typeWeaponViewPtr[0]==nil)
                {
                    typeWeaponViewPtr[0] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[0].titleKeys = @"Marksman Rifles" ;
                    typeWeaponViewPtr[0].typeNumbers =0;
                  }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[0] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[0];
            }break;
            case submachineTag://(1.2)武器分类界面
            {
                if(typeWeaponViewPtr[1]==nil)
                {
   
                    typeWeaponViewPtr[1] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[1].titleKeys= @"Sub Machine Guns" ;
                    typeWeaponViewPtr[1].typeNumbers =1;
                    
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[1] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[1];
            }break;
            case assaultTag://(1.3)武器分类界面
            {
                if(typeWeaponViewPtr[2]==nil)
                {

                    typeWeaponViewPtr[2] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[2].titleKeys = @"Assault Rifles" ;
                    typeWeaponViewPtr[2].typeNumbers =2;
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[2] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[2];

            }break;
            case shotgunTag://(1.4)武器分类界面
            {
                if(typeWeaponViewPtr[3]==nil)
                {
                
                    typeWeaponViewPtr[3] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[3].titleKeys = @"Shotguns";
                    typeWeaponViewPtr[3].typeNumbers =3;
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[3] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[3];
            
            }break;
            case sniperTag://(1.5)武器分类界面
            {
                if(typeWeaponViewPtr[4]==nil)
                {
                
                    typeWeaponViewPtr[4] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[4].titleKeys = @"Sniper Rifles";
                    typeWeaponViewPtr[4].typeNumbers =4;
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[4] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[4];
            
            }break;
            case handgunTag://(1.6)武器分类界面
            {
                if(typeWeaponViewPtr[5]==nil)
                {
                
                    typeWeaponViewPtr[5] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[5].titleKeys = @"Handguns";
                    typeWeaponViewPtr[5].typeNumbers =5;
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[5] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[5];
            
            }break;
            case lightmachineTag://(1.7)武器分类界面
            {
                if(typeWeaponViewPtr[6]==nil)
                {
                
                    typeWeaponViewPtr[6] = [[C_typeWeaponViewCont alloc]init ];
                    typeWeaponViewPtr[6].titleKeys = @"Light Machine Guns";
                    typeWeaponViewPtr[6].typeNumbers =6;
                }
                [ weaponViewPtr presentViewController: typeWeaponViewPtr[6] animated:YES completion:^(void){} ];
                activeContPtr = typeWeaponViewPtr[6];
            
            }break;
        case killstreakBtnTag:  //(2)必杀技界面
        {
            if(killstreakViewPtr ==nil)
            {
                killstreakViewPtr = [[C_killstreakViewCont alloc]init];
            }
            [mainViewPtr presentViewController: killstreakViewPtr animated:YES completion: ^(void){} ];
            activeContPtr = killstreakViewPtr;
        }break;
        case mapBtnTag:
        {
            if(mapViewPtr ==nil)    //(3)地图界面
            {
                mapViewPtr = [[C_mapViewCont alloc]init];
            }
            [mainViewPtr presentViewController: mapViewPtr animated:YES completion: ^(void){} ];
            activeContPtr = mapViewPtr;
        }break;
        case playerGuideBtnTag:     //(4)游戏指南界面
        {
            if(playerGuideViewPtr ==nil)
            {
                playerGuideViewPtr = [[C_playerGuideViewCont alloc]init];
            }
            [mainViewPtr presentViewController: playerGuideViewPtr animated:YES completion:^(void){}];
            activeContPtr = playerGuideViewPtr;
        }break;
        case perksBtnTag:           //(5)成就界面
        {
            if(perksViewPtr ==nil)
            {
                perksViewPtr = [[C_perksViewCont alloc]init];
            }
            [mainViewPtr presentViewController:  perksViewPtr animated:YES completion: ^(void){} ];
            activeContPtr = perksViewPtr;
        }break;
        case trophiesBtnTag:        //(6)成就界面
        {
            if(trophiesBtnPtr ==nil)
            {
                trophiesBtnPtr = [[C_trophiesViewCont alloc]init];
            }
            [mainViewPtr presentViewController: trophiesBtnPtr animated:YES completion:^(void){} ];
            activeContPtr  = trophiesBtnPtr ;
        }break;
        case backToWeaponTag:
        {
            [weaponViewPtr dismissViewControllerAnimated:YES completion: ^(void){} ];
            activeContPtr = weaponViewPtr;
        }break;
        case backBtnTag:
        {
            [mainViewPtr dismissViewControllerAnimated:YES completion:^(void){} ];
            activeContPtr = mainViewPtr;
        }break;

    }
    
}

//枪的详细信息
-(void) requestDelWeaponByTypeNumber:(NSUInteger)typenum BtnPos:(NSUInteger)btnpos TitleKey:(NSString *)key
{
    if(delWeaponViewPtr == nil)
    {
        delWeaponViewPtr = [[C_delweaponViewCont alloc]init];
    }
    
    delWeaponViewPtr.gunTypeNames = key;
    delWeaponViewPtr.typeNumbers = typenum;
    delWeaponViewPtr.poss = btnpos;
    
    [activeContPtr  presentViewController: delWeaponViewPtr animated:YES completion:^(void){}];
    activeContPtr = delWeaponViewPtr;
    
}

-(C_mainViewCont *)CreateMainView
{
    if(mainViewPtr == nil)
    {
        mainViewPtr = [[C_mainViewCont alloc] init];
    }
    activeContPtr = mainViewPtr;
    return mainViewPtr;
}
@end



























