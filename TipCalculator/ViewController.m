//
//  ViewController.m
//  TipCalculator
//
//  Created by Suvan Ramani on 2016-11-11.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalOwedLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *splitByLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISlider *splitSlider;

@property (strong, nonatomic) UITapGestureRecognizer *tapGR;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.tipPercentLabel.text = @"15%";
    self.tipLabel.text = @"$0.00 ($0.00)";
    self.totalLabel.text = @"$0.00 ($0.00)";
    self.splitByLabel.text = [NSString stringWithFormat:@"Split by: %.0f", self.splitSlider.value];
    
    self.titleLabel.textColor = [UIColor orangeColor];
    self.tipAmountLabel.textColor = [UIColor orangeColor];
    self.tipPercentLabel.textColor = [UIColor orangeColor];
    self.totalOwedLabel.textColor = [UIColor orangeColor];
    self.tipLabel.textColor = [UIColor orangeColor];
    self.totalLabel.textColor = [UIColor orangeColor];
    self.splitByLabel.textColor = [UIColor orangeColor];
    
    
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                         action:@selector(dismissKeyboard:)];
    
    [self.view addGestureRecognizer:self.tapGR];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentSlider:(UISlider *)sender {
    [self updateValues:(self.billAmountTextField.text)];
}

- (IBAction)splitBySlider:(UISlider *)sender {
    [self updateValues:(self.billAmountTextField.text)];
}

-(void)dismissKeyboard:(UITapGestureRecognizer *)tapGR {
    [self.view endEditing:YES];
}

// Called whenever current text in textfield changes
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Make text in textField a mutable string
    NSMutableString *mutableBillAmount = [self.billAmountTextField.text mutableCopy];
    
    // Add newly inputed bill amount (as user is typing) to mutableBillAmount String
    [mutableBillAmount replaceCharactersInRange:range withString:string];
    
    // Pass updated string to updateValues
    [self updateValues:mutableBillAmount];
    
    return YES;
}

-(void)updateValues:(NSString *)billAmountString {
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%.0f%%", self.slider.value];
    
    float billAmount = [billAmountString floatValue];
    float tipAmount = billAmount * self.slider.value/100;
    
    float totalIncludingTip = billAmount + tipAmount;
    
    float tipSplit = tipAmount/self.splitSlider.value;
    float totalSplit = totalIncludingTip / self.splitSlider.value;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f ($%.2f)", tipAmount, tipSplit];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f ($%.2f)", totalIncludingTip, totalSplit];
    
    self.splitByLabel.text = [NSString stringWithFormat:@"Split by: %.0f", self.splitSlider.value];
}

@end
