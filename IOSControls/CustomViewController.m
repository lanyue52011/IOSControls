//
//  CustomViewController.m
//  IOSControls
//
//  Created by 周登峰 on 6/18/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLable;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *switchButton;

- (IBAction)sliderChange:(UISlider *)sender;
- (IBAction)switchChange:(UISegmentedControl *)sender;
- (IBAction)textFieldDone:(id)sender;
-(IBAction)ViewTouchDown:(id)sender;

- (IBAction)alertButton:(UIButton *)sender;
@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.switchButton.hidden=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)textFieldDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)ViewTouchDown:(id)sender {
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
    //[sender resignFirstResponder];
}
- (IBAction)sliderChange:(UISlider *)sender {
    int process=(int)lround(sender.value);
    [self.sliderLable setText:[NSString stringWithFormat:@"%d",process]];
}

- (IBAction)switchChange:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==0)
    {
        self.switchButton.hidden=YES;
        self.leftSwitch.hidden=NO;
        self.rightSwitch.hidden=NO;
        
    }else{
        self.switchButton.hidden=NO;
        self.leftSwitch.hidden=YES;
        self.rightSwitch.hidden=YES;
        
    }
}


- (IBAction)alertButton:(UIButton *)sender {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"你确定吗？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *yesAction=[UIAlertAction actionWithTitle:@"是的，确定!"
                                                      style:UIAlertActionStyleDestructive
                                                    handler:^(UIAlertAction * action)
                              {
                                  NSString *msg;
                                  if([self.nameField.text length]>0)
                                  {
                                      msg=[NSString stringWithFormat:@"%@你可以做得很好！",self.nameField.text];
                                  }else{
                                      msg=@"可以做得很好！";
                                  }
                                  UIAlertController *alert2=[UIAlertController alertControllerWithTitle:@"完成事情了！" message:msg preferredStyle:UIAlertControllerStyleAlert];
                                  UIAlertAction *cancelAction=[UIAlertAction   actionWithTitle:@"wo on"
                                                                                         style:UIAlertActionStyleCancel
                                                                                       handler:nil];
                                  [alert2 addAction:cancelAction];
                                  [self presentViewController:alert2 animated:YES completion:nil];
                                  
                              }];
    UIAlertAction *noAction=[UIAlertAction  actionWithTitle:@"不行" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:yesAction];
    [alert addAction:noAction];
    UIPopoverPresentationController *ppc=alert.popoverPresentationController;
    if(ppc==nil)
    {
        ppc.sourceView=sender;
        ppc.sourceRect=sender.bounds;
    }
    [self presentViewController:alert animated:YES completion:nil];
}
@end
