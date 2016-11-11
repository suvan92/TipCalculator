//
//  ViewController.m
//  TipCalculator
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tipAmountLabel.text = @"Tip amount: $0.00";
    
    self.tipPercentLabel.text = @"15%";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentSlider:(UISlider *)sender {
    
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%.0f%%", sender.value];
    
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmount = billAmount * sender.value/100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    
}

@end
