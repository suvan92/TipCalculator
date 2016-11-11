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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tipAmountLabel.text = @"";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTip:(id)sender {
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmount = billAmount * 0.15;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    
    
}

@end
