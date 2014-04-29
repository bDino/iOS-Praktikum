//
//  ViewController.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "BookDetailViewController.h"

@implementation BookDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveBook)];
    self.navigationItem.rightBarButtonItem = saveBtn;

    self.txtAuthor.text = self.book.author;
    self.txtTitle.text = self.book.title;
    self.txtISBN.text = self.book.isbn;
}

- (void)saveBook {
    self.book.title = self.txtTitle.text;
    self.book.author = self.txtAuthor.text;
    self.book.isbn = self.txtISBN.text;

    [self.itemListManager saveItem:self.book];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
