//
//  ViewController.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.manager = [[ItemListManager alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionAddBookToView:(id)sender
{
    if(![self.txtTitle.text isEqualToString:@""] && ![self.txtISBN.text isEqualToString:@""])
    {
        Book *book = [self createBookFromInputs];
        if (![self.manager containsItem: book])
        {
            [self.manager addItem:book];
            [self clearInputFields];
            [self.manager printList];
        }
    }
}

- (Book*)createBookFromInputs
{
    Book *book = [[Book alloc] init];

    book.title = self.txtTitle.text;
    book.author = self.txtAuthor.text;
    book.ISBN = self.txtISBN.text;

    return book;
}

- (void)clearInputFields
{
    self.txtAuthor.text = @"";
    self.txtTitle.text = @"";
    self.txtISBN.text = @"";
}

@end
