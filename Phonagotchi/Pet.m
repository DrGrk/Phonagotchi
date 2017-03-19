//
//  Pet.m
//  Phonagotchi
//
//  Created by David Guichon on 2017-03-16.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

-(void)beGrumpy{
    self.amIGrumpy = self.amIGrumpy + 1;
}

-(BOOL)amIAGrumpyCat{
    int i = self.amIGrumpy % 2;
    if (i == 0) {
        return NO;
    }
    else {
        return YES;
    }
}

-(void)iWantToBeNormal{
    self.amIGrumpy = 0;
}


@end
