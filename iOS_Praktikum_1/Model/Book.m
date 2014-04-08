//
//  Book.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "Book.h"

@implementation Book

-(id)init
{
    if (self = [super init])
    {
        self.author = @"";
        self.ISBN = @"";
    }

    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Title: %@, Author: %@, ISBN: %@",
            self.title, self.author, self.ISBN];
}
@end
