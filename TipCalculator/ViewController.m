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
//@property (weak, nonatomic) id<UITextFieldDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;
@property (strong, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UILabel *totalOwedLabel;
@property (strong, nonatomic) UITapGestureRecognizer *tapGR;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.tipAmountLabel.text = @"Tip amount: $0.00";
    self.tipPercentLabel.text = @"0%";
    self.totalOwedLabel.text = @"Total owed: $0.00";
    
    self.titleLabel.textColor = [UIColor orangeColor];
    self.tipAmountLabel.textColor = [UIColor orangeColor];
    self.tipPercentLabel.textColor = [UIColor orangeColor];
    self.totalOwedLabel.textColor = [UIColor orangeColor];
    
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
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    self.totalOwedLabel.text = [NSString stringWithFormat:@"Total Owed: $%.2f", billAmount + tipAmount];
}


- (IBAction)textFieldAction:(UITextField *)sender {
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%.0f%%", self.sliderValue.value];
    
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipAmount = billAmount * self.sliderValue.value/100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount: $%.2f", tipAmount];
    self.totalOwedLabel.text = [NSString stringWithFormat:@"Total Owed: $%.2f", billAmount + tipAmount];
}

-(void)dismissKeyboard:(UITapGestureRecognizer *)tapGR {
    [self.view endEditing:YES];
}


@end
