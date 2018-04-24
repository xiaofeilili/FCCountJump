//
//  ViewController.m
//  FCCountJump
//
//  Created by 李晓飞 on 2018/4/23.
//  Copyright © 2018年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "FCCountJump.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UILabel *countJump;

@property (nonatomic, assign)NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    self.textField.backgroundColor = [UIColor cyanColor];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    self.countJump = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    self.countJump.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.countJump];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.count = [textField.text integerValue];
//    [FCCountJump countJumpActionWithNum:self.count jumpContent:self.countJump];
    [FCCountJump countJumpAction:self.count content:self.countJump type:COUNTJUMPTYPETRANSFORM];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
