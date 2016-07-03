//
//  ViewController.h
//  IOSControls
//
//  Created by 周登峰 on 4/16/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bdImg;
- (IBAction)buttonXZ:(UIButton *)sender;
- (IBAction)buttonFS:(UIButton *)sender;
- (IBAction)buttonYD:(UIButton *)sender;

- (IBAction)buttonSen1:(UIButton *)sender;
- (IBAction)buttonSen2:(UIButton *)sender;
- (IBAction)buttonSen3:(UIButton *)sender;
- (IBAction)buttonSen4:(UIButton *)sender;

- (IBAction)OpenNib:(UIButton *)sender;
@end

