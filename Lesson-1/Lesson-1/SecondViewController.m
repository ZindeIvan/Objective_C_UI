//
//  SecondViewController.m
//  Lesson-1
//
//  Created by Зинде Иван on 1/14/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

-(void)configureViewController {
    
    self.view.backgroundColor = [UIColor linkColor];

    CGRect imageViewFrame = CGRectMake(40.0, 100.0, 250.0, 250.0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: imageViewFrame];
    imageView.image = [UIImage imageNamed:@"apple"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    _sliderImageView = imageView;
    [self.view addSubview:imageView];
    
    CGRect sliderFrame = CGRectMake(40.0, 400.0, 250.0, 50.0);
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = sliderFrame;
    slider.tintColor = [UIColor blackColor];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 1;
    [slider addTarget:self action:@selector(sliderValueChanched:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    CGRect textFieldframe = CGRectMake(40.0, 500.0, 250.0, 50.0);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldframe];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor yellowColor];
    textField.placeholder = @"Введите значение...";
    textField.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightLight];
    [textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview: textField];
    
    CGRect textViewframe = CGRectMake(40.0, 570.0, 250.0, 150.0);
    UITextView *textView = [[UITextView alloc] initWithFrame: textViewframe];
    textView.backgroundColor = [UIColor yellowColor];
    textView.textColor = [UIColor blackColor];
    textView.text = @"";
    textView.editable = NO;
    _textView = textView;
    [self.view addSubview:textView];
}

-(void)sliderValueChanched:(UISlider *)sender {
    _sliderImageView.alpha = sender.value;
}

-(void)textChanged:(UITextView *)sender {
    _textView.text = sender.text;
}

@end
