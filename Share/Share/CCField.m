//
//  CCField.m
//  Share
//
//  Created by CC on 16/8/18.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "CCField.h"

@implementation CCField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    return NO;
}

- (void)copy:(id)sender {
    [self resignFirstResponder];
    //持久化，退出程序 copy 的内容还在
    [[UIPasteboard generalPasteboard]setPersistent:YES];
    //拷贝的内容
    [[UIPasteboard generalPasteboard]setValue:self.text forPasteboardType:[UIPasteboardTypeListString objectAtIndex:0]];
}

@end
