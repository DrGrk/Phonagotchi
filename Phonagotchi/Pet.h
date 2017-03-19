//
//  Pet.h
//  Phonagotchi
//
//  Created by David Guichon on 2017-03-16.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic) NSInteger amIGrumpy;

-(void)beGrumpy;

-(BOOL)amIAGrumpyCat;

-(void)iWantToBeNormal;

@end
