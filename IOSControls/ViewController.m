//
//  ViewController.m
//  IOSControls
//
//  Created by 周登峰 on 4/16/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "NibViewController.h"

#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/225.0 blue:249/225.0 alpha:1]
typedef void(^ ButtonHandle)();
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bdImg.contentMode=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
   // this.view.contentMode=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    //this.contentMode=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
self.view.contentMode=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonXZ:(UIButton *)sender {
    [self animation:^{
        //注意旋转角度必须是弧度，不是角度
        CGFloat angle=M_PI_4;//M开头的宏都是和数学（Math）相关的宏定义，M_PI_4表示四分之派，M_2_PI表示2派
        //使用CGAffineTransformMakeRotation获得一个旋转角度形变
        //但是需要注意tranform的旋转不会自动在原来的角度上进行叠加，所以下面的方法旋转一次以后再点击按钮不会旋转了
        //_imageView.transform=CGAffineTransformMakeRotation(angle);
        //利用CGAffineTransformRotate在原来的基础上产生一个新的角度(当然也可以定义一个全局变量自己累加)
        _bdImg.transform=CGAffineTransformRotate(_bdImg.transform, angle);
        
    }];
}

- (IBAction)buttonFS:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scalleOffset=0.9;
        //_imageView.transform=CGAffineTransformMakeScale(scalleOffset, scalleOffset);
        _bdImg.transform= CGAffineTransformScale(_bdImg.transform, scalleOffset, scalleOffset);
    }];
}

- (IBAction)buttonYD:(UIButton *)sender {
    [self animation:^{
        CGFloat translateY=50;
        //_imageView.transform=CGAffineTransformMakeTranslation(0, translateY);
        _bdImg.transform=CGAffineTransformTranslate(_bdImg.transform, 0, translateY);
    }];
}


#pragma mark 动画执行方法，注意这里可以使用UIView的animateWithDuration方法代替这里只是为了演示
-(void)animation:(ButtonHandle)handle{
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    
    handle();
    
    //执行动画操作
    [UIView commitAnimations];
    
}


- (IBAction)buttonSen1:(UIButton *)sender {
   // [self perform]
}

- (IBAction)buttonSen2:(UIButton *)sender {
}

- (IBAction)buttonSen3:(UIButton *)sender {
}

- (IBAction)buttonSen4:(UIButton *)sender {
}

- (IBAction)OpenNib:(UIButton *)sender {
    NibViewController *nibview=[[NibViewController alloc] initWithNibName:@"NibViewController" bundle:nil];
    //[self presentModalViewController:nibview animated:TRUE];
    [self presentViewController:nibview animated:TRUE completion:^{
        
    }];
    
}
@end
