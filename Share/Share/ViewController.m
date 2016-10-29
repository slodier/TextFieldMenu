//
//  ViewController.m
//  Share
//
//  Created by CC on 16/8/18.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import "CCField.h"

@interface ViewController ()

@property (nonatomic, strong) CCField *field;
@property (nonatomic, strong) UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //第一种
    _field = [[CCField alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    _field.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_field];
    
    UIMenuItem *shareItem = [[UIMenuItem alloc]initWithTitle:@"分享" action:@selector(click)];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:[NSArray arrayWithObjects:shareItem, nil]];
    
    //第二种
    _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    _label.userInteractionEnabled = YES;
    [_label addGestureRecognizer:tap];
}

- (void)click {
    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc]init];
    // 使用文本信息
    sendReq.bText = YES;
    // 发到还有列表 ， 默认是 0
    sendReq.scene = 0;
    
    sendReq.text = _field.text;
    //发送分享信息
    [WXApi sendReq:sendReq];
    NSLog(@"213");
}

#pragma mark -- UIMenuController
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)click:(UITapGestureRecognizer *)tap {
    //要显示 menu 必须将触碰的 View 设为第一响应对象
    [self.view becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem *copyItem = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(click)];
    menuController.menuItems = @[copyItem];
    //设置 menu 的 frame和父 view
    [menuController setTargetRect:CGRectMake(_label.frame.origin.x, _label.frame.origin.y, 100, 50) inView:self.view];
    [menuController setMenuVisible:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_field resignFirstResponder];
}

@end
