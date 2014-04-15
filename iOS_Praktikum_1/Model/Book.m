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

- (BOOL)isEqual:(id)object
{
    if (![super isEqual: object]) return NO;

    Book *other = (Book*) object;
    return [self.author isEqualToString: other.author]
        && [self.ISBN isEqualToString: other.ISBN];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Title: %@, Author: %@, ISBN: %@",
            self.title, self.author, self.ISBN];
}
@end
