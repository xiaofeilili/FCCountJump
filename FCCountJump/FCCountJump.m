//
//  FCCountJump.m
//  FCCountJump
//
//  Created by 李晓飞 on 2018/4/23.
//  Copyright © 2018年 xiaofei. All rights reserved.
//

#import "FCCountJump.h"

@implementation FCCountJump

+ (void)countJumpAction:(NSInteger)num content:(UILabel *)cLabel type:(COUNTJUMPTYPE)type {
     __block NSInteger _numText = 0;
    
    __block BOOL flag = NO;
    
    // 全局队列
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // NSEC_PER_SEC 是秒  *1 是每秒
    CGFloat time = 0;
    if (type == COUNTJUMPTYPEDEFAULT) {
        time = 0.003;
    }else {
        time = 0.4;
    }
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), time * NSEC_PER_SEC, 0);
    
    // 设置响应dispatch源事件的block， 在dispath源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        // 回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (type == COUNTJUMPTYPEDEFAULT) {
                if (_numText < num) {
                    cLabel.text = [NSString stringWithFormat:@"%ld", _numText];
                    _numText++;
                }else {
                    dispatch_source_cancel(timer);
                    cLabel.text = [NSString stringWithFormat:@"%ld", num];
                }
            }else {
                if (!flag) {
                    if (_numText <= num * 1.3) {
                        _numText = _numText + num / 10 + arc4random()%(num / 10);
                        cLabel.text = [NSString stringWithFormat:@"%ld",_numText];
                        NSLog(@"%ld",_numText);
                    }else {
                        flag = YES;
                    }
                }else {
                    if (_numText > num) {
                        _numText = _numText - num / 10 - arc4random()%(num / 10);
                        
                        if (_numText < num) {
                            cLabel.text = [NSString stringWithFormat:@"%li", num];
                            //这句话必须写否则会出问题
                            dispatch_source_cancel(timer);
                            return ;
                        }
                        cLabel.text = [NSString stringWithFormat:@"%ld",_numText];
                    }
                }
            }
        });
    });
    // 启动源
    dispatch_resume(timer);
}



@end
