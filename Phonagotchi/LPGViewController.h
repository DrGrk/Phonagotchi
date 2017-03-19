//
//  LPGViewController.h
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Pet;

@interface LPGViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *petImageView;
@property Pet* pet;


@property (strong, nonatomic) IBOutlet UIImageView *basket;



- (IBAction)panTooFast:(UIPanGestureRecognizer *)sender;

- (IBAction)resetFromGrumpyCat:(UITapGestureRecognizer *)sender;


- (IBAction)createAnotherApple:(UITapGestureRecognizer *)sender;

- (IBAction)createAppleAndFeed:(UILongPressGestureRecognizer *)sender;

@end
