//
//  BookTableViewController.m
//  iOS_Praktikum_1
//
//  Created by Luciano Maiwald on 25.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "BookTableViewController.h"
#import "Book.h"
#import "BookTableViewCell.h"
#import "BookDetailViewController.h"

@interface BookTableViewController ()

@property NSUInteger selectedIndex;
@property BOOL isEdit;
@end

@implementation BookTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.btnPushToNewBook = [[UIBarButtonItem alloc] initWithTitle:@"Add Book" style:UIBarButtonItemStylePlain target:self action:@selector(pushToNewBookView)];
    self.navigationItem.rightBarButtonItem = self.btnPushToNewBook;
    
    self.itemListManager = [[ItemListManager alloc] init];

    Book *book1 = [[Book alloc] initWithTitle:@"Fight Club"
                                       author:@"Chuck Palahniuk"
                                         isbn:@"978-3442542109"];

    Book *book2 = [[Book alloc] initWithTitle:@"On the Road"
                                       author:@"Jack Kerouac"
                                         isbn:@"978-0141182674"];

    Book *book3 = [[Book alloc] initWithTitle:@"Pippi Langstrumpf"
                                       author:@"Astrid Lindgren"
                                         isbn:@"978-3789141614"];

    
    Book *book4 = [[Book alloc] initWithTitle:@"The Ultima Power Fail Collection"
                                       author:@"POWER FAIL"
                                         isbn:@"876-9384756384"];
    
    [self.itemListManager addItem: book1];
    [self.itemListManager addItem: book2];
    [self.itemListManager addItem: book3];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)pushToNewBookView
{
    self.isEdit = NO;
    [self performSegueWithIdentifier:@"pushSeqToAddBook" sender:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookTableViewCell *cell = (BookTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"bookCell" forIndexPath:indexPath];

    Book* book = (Book*)[self.itemListManager objectAtIntex:indexPath.row];

    cell.title.text = book.title;
    cell.author.text = book.author;
    cell.isbn.text = book.isbn;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemListManager count];
}

# pragma mark UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.isEdit = YES;
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"pushSeqToAddBook" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BookDetailViewController  *targetVB = (BookDetailViewController*)segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"pushSeqToAddBook"]) {
        targetVB.manager = self.itemListManager;
    
        if(self.isEdit)
        {
            Book* book = (Book*)[self.itemListManager objectAtIntex:self.selectedIndex];
                targetVB.bookItem = book;
        }
        else
        {
            Book* newBook = [[Book alloc] initWithTitle:@""
                                                 author:@""
                                                   isbn:@""];
            targetVB.bookItem = newBook;
        }
    }
}

@end
