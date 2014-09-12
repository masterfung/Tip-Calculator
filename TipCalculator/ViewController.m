//
//  ViewController.m
//  TipCalculator
//
//  Created by Tsung Hung on 9/11/14.
//  Copyright (c) 2014 Tsung Hung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextAmountField;

@property (weak, nonatomic) IBOutlet UILabel *labelTipAmount;

@property (weak, nonatomic) IBOutlet UILabel *labelTotalAmount;


@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegmentControl;

@property (weak, nonatomic) IBOutlet UIButton *calculateTipButton;

@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.billTextAmountField.text = @"";
    [self calculateTipAndUpdateInterface];
}


- (void)calculateTipAndUpdateInterface {
    double billAmount = self.billTextAmountField.text.doubleValue;
    NSInteger selectedSegmentIndex = self.tipPercentageSegmentControl.selectedSegmentIndex; //Gets the button selection from the user, first, second, or third button
    double tipPercentage = [self.tipPercentageSegmentControl titleForSegmentAtIndex:selectedSegmentIndex].doubleValue; //Cannot get just the percentage, it needs a string, hence the doublevalue
    
    //do the math
    
    double tipAmount = billAmount * (tipPercentage / 100);
    double totalAmount = tipAmount + billAmount;
    
    //update the UI
    self.labelTipAmount.text = [NSString stringWithFormat: @"$%.2f", tipAmount];
    self.labelTotalAmount.text = [NSString stringWithFormat: @"$%.2f", totalAmount];
}


- (IBAction)didTapBackground:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)didTipCalculateButton:(UIButton *)sender {
    [self calculateTipAndUpdateInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
