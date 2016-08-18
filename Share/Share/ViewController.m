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
{
    CCField *field;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    field = [[CCField alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    field.backgroundColor = [UIColor greenColor];
    [self.view addSubview:field];
    
    UIMenuItem *shareItem = [[UIMenuItem alloc]initWithTitle:@"分享" action:@selector(click)];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:[NSArray arrayWithObjects:shareItem, nil]];
}

- (void)click {
    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc]init];
    // 使用文本信息
    sendReq.bText = YES;
    // 发到还有列表 ， 默认是 0
    sendReq.scene = 0;
    
    sendReq.text = field.text;
    //发送分享信息
    [WXApi sendReq:sendReq];
    NSLog(@"213");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
