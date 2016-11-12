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

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalOwedLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


@property (strong, nonatomic) UITapGestureRecognizer *tapGR;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.tipPercentLabel.text = @"0%";
    self.tipLabel.text = @"$0.00";
    self.totalLabel.text = @"$0.00";
    
    self.titleLabel.textColor = [UIColor orangeColor];
    self.tipAmountLabel.textColor = [UIColor orangeColor];
    self.tipPercentLabel.textColor = [UIColor orangeColor];
    self.totalOwedLabel.textColor = [UIColor orangeColor];
    self.tipLabel.textColor = [UIColor orangeColor];
    self.totalLabel.textColor = [UIColor orangeColor];
    
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(dismissKeyboard:)];
    
    [self.view addGestureRecognizer:self.tapGR];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentSlider:(UISlider *)sender {
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%.0f%%", sender.value];
    
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmount = billAmount * sender.value/100;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", billAmount + tipAmount];
}

-(void)dismissKeyboard:(UITapGestureRecognizer *)tapGR {
    [self.view endEditing:YES];
}


@end
