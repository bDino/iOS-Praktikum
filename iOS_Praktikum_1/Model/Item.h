//
//  Item.h
//  iOS_Praktikum_1
//
//  Created by Dino on 06.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (strong,nonatomic) NSUUID *uuid;
@property (strong,nonatomic) NSString *title;

@end
