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
    self = [super init];
    
    return self;
}

- (NSString *)description
{
return [NSString stringWithFormat:@"\nTitle: %@ \nAuthor: %@ \nISBN: %@",self.Title,self.Author,self.ISBN];
}
@end
