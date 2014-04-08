//
//  Book.h
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Book : Item

@property (strong,nonatomic) NSString *Author;
@property (strong,nonatomic) NSString *ISBN;

@end
