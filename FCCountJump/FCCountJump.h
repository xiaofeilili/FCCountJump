//
//  FCCountJump.h
//  FCCountJump
//
//  Created by 李晓飞 on 2018/4/23.
//  Copyright © 2018年 xiaofei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, COUNTJUMPTYPE) {
    COUNTJUMPTYPEDEFAULT,               // 快速跳转到指定数字
    COUNTJUMPTYPETRANSFORM              // 数字跳变器
};

@interface FCCountJump : NSObject
/**
 * 数字跳转某指定数字
 *
 * @param num     目标数字
 * @param cLabel  承载数字的label
 * @param type    快速跳转到指定数字还是数字跳变器
 */
+ (void)countJumpAction:(NSInteger)num content:(UILabel *)cLabel type:(COUNTJUMPTYPE)type;


@end
