//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *draggingAppleIV;


@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _pet = [[Pet alloc] init];

    
}



- (IBAction)panTooFast:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.petImageView];
    
    CGFloat numberVelocity = sqrt(velocity.x *velocity.x  + velocity.y *velocity.y);
    
    if (numberVelocity > 400) {
        [self.pet beGrumpy];
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
        return;
    }
    

}

- (IBAction)resetFromGrumpyCat:(UITapGestureRecognizer *)sender {
    [self.pet iWantToBeNormal];
    if (![self.pet amIGrumpy]){
        self.petImageView.image = [UIImage imageNamed:@"default"];
    }
}

- (IBAction)createAnotherApple:(UITapGestureRecognizer *)sender {
    UIImageView *newApple = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    newApple.userInteractionEnabled = YES;
    newApple.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:newApple];
    
    NSLayoutConstraint *appleHeight = [NSLayoutConstraint constraintWithItem:newApple
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1 constant:35];
    
    NSLayoutConstraint *appleWidth = [NSLayoutConstraint constraintWithItem:newApple
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1 constant:30];
    
    NSLayoutConstraint *appleXPosition = [NSLayoutConstraint constraintWithItem:newApple
                                                                      attribute:NSLayoutAttributeLeftMargin
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeftMargin
                                                                     multiplier:1 constant:60];
    
    NSLayoutConstraint *appleYPosition = [NSLayoutConstraint constraintWithItem:newApple
                                                                      attribute:NSLayoutAttributeBottomMargin
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeBottomMargin
                                                                     multiplier:1 constant:-35];
    
    appleHeight.active = YES;
    appleWidth.active = YES;
    appleXPosition.active = YES;
    appleYPosition.active = YES;
}

- (IBAction)createAppleAndFeed:(UILongPressGestureRecognizer *)sender {

    
    UIImage *apple = [UIImage imageNamed:@"apple"];
    CGPoint point = [sender locationInView:self.view];
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            self.draggingAppleIV  = [[UIImageView alloc] initWithImage:apple];
                self.draggingAppleIV.userInteractionEnabled = YES;
                self.draggingAppleIV.translatesAutoresizingMaskIntoConstraints = NO;
                [self.view addSubview:self.draggingAppleIV];
            NSLayoutConstraint *widthLC = [self draggingAppleHeight];
            NSLayoutConstraint *heightLC = [self draggingAppleWidth];
            widthLC.active = YES;
            heightLC.active = YES;
                self.draggingAppleIV.center = point;
                break;
            }
        
            
        case UIGestureRecognizerStateChanged: {
            //SET THE LOCATION OF THE APPLE EQUAL TO THE LOCATION OF THE MOUSE
            self.draggingAppleIV.center = point;
            break;
         }
        
        case UIGestureRecognizerStateEnded: {
            
            CGFloat maxYCGF = CGRectGetMaxY(self.view.frame) + self.draggingAppleIV.frame.size.height;

            //IF LOCATION IS WITHIN THE FRAME OF THE CAT IMAGE
            
            if ((point.x < 321 && point.x > 21 && point.y > 175 && point.y < 256 )){
                self.petImageView.image = [UIImage imageNamed:@"sleeping"];
                self.draggingAppleIV.alpha = 0;
                self.draggingAppleIV = nil;
            }
            else {[UIView animateWithDuration:2 animations:^{
                self.draggingAppleIV.center = CGPointMake(CGRectGetMidX(self.view.frame), maxYCGF);
                self.draggingAppleIV = nil;
                }];
            }
                
                
        }
            
            break;
            
        default: {
            break;
        }
   
    }
}

-(NSLayoutConstraint *)draggingAppleHeight {
    NSLayoutConstraint *draggingAppleIVHeight = [NSLayoutConstraint constraintWithItem:self.draggingAppleIV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35];
    return draggingAppleIVHeight;
}

-(NSLayoutConstraint *)draggingAppleWidth{
NSLayoutConstraint *draggingAppleIVWidth = [NSLayoutConstraint constraintWithItem:self.draggingAppleIV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
    return draggingAppleIVWidth;
}




@end
