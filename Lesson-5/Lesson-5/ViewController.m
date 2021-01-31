//
//  ViewController.m
//  Lesson-5
//
//  Created by Зинде Иван on 1/31/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

-(void)configureViewController {
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect buttonFrame = CGRectMake(40.0, 100.0, 200.0, 30.0);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Выбрать изображение" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor linkColor];
    button.tintColor = [UIColor blackColor];
    button.frame = buttonFrame;
    [button addTarget:self action:@selector(pickViewControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    CGRect imageViewFrame = CGRectMake(40.0, 130.0, 300.0, 300.0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: imageViewFrame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView = imageView;
    [self.view addSubview:imageView];
}

-(void)pickViewControllerButtonDidTap:(UIButton *)sender
{
   [self presentPickerController];
}

- (void)presentPickerController {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    if (image) {
        _imageView.image = image;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
