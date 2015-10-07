//
//  ViewController.m
//  PebbleKit-iOS-Tutorial-2
//
//  Created by Chris Lewis on 12/9/14.
//  Copyright (c) 2014 Pebble. All rights reserved.
//

#import "ViewController.h"
#import "PebbleKit/PebbleKit.h"

// AppMessage keys
typedef NS_ENUM(NSUInteger, AppMessageKey) {
    KeyButtonUp = 0,
    KeyButtonDown
};

@interface ViewController () <PBPebbleCentralDelegate>

@property (weak, nonatomic) PBPebbleCentral *central;
@property (weak, nonatomic) PBWatch *watch;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) NSUInteger currentPage;

@end

@implementation ViewController


-(void)pebbleCentral:(PBPebbleCentral *)central watchDidConnect:(PBWatch *)watch isNew:(BOOL)isNew {
    if(self.watch) {
        return;
    }
    self.watch = watch;
    self.outputLabel.text = @"Watch connected!";
    
    // Keep a weak reference to self to prevent it staying around forever
    __weak typeof(self) welf = self;
    
    // Sign up for AppMessage
    [self.watch appMessagesAddReceiveUpdateHandler:^BOOL(PBWatch *watch, NSDictionary *update) {
        __strong typeof(welf) sself = welf;
        if(!sself) {
            // self has been destroyed
            return NO;
        }
        
        // Process incoming messages
        if(update[@(KeyButtonUp)]) {
            // Up button was pressed!
            sself.outputLabel.text = @"UP";
            
            if(sself.currentPage > 0) {
                sself.currentPage--;
            }
        }
        
        if(update[@(KeyButtonDown)]) {
            // Down button pressed!
            sself.outputLabel.text = @"DOWN";
            
            if(sself.currentPage < 2) {
                sself.currentPage++;
            }
        }
        
        // Get the size of the main view and update the current page offset
        CGSize windowSize = CGSizeMake(sself.view.frame.size.width, sself.view.frame.size.height);
        [sself.scrollView setContentOffset:CGPointMake(sself.currentPage * windowSize.width, 0) animated:YES];
        
        return YES;
    }];
}

-(void)pebbleCentral:(PBPebbleCentral *)central watchDidDisconnect:(PBWatch *)watch {
    // Only remove reference if it was the current active watch
    if(self.watch == watch) {
        self.watch = nil;
        self.outputLabel.text = @"Watch disconnected";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentPage = 0;
    self.outputLabel.text = @"Waiting for Pebble...";
    
    // Set the delegate to receive PebbleKit events
    self.central = [PBPebbleCentral defaultCentral];
    self.central.delegate = self;
    
    // Register UUID
    self.central.appUUID = [[NSUUID alloc] initWithUUIDString:@"3783cff2-5a14-477d-baee-b77bd423d079"];
    
    // Begin connection
    [self.central run];
    
    // Get the size of the View
    CGSize windowSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    // Set up UIScrollView properties
    self.scrollView.pagingEnabled = YES;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(3 * windowSize.width, windowSize.height);
    
    // Create pages
    for(int i = 0; i < 3; i++) {
        CGRect viewRect = CGRectMake(i * windowSize.width, 0, windowSize.width, windowSize.height);
        UIView *page = [[UIView alloc] initWithFrame:viewRect];
        
        // Assign random background color
        page.backgroundColor = [UIColor colorWithRed:(CGFloat)drand48() green:(CGFloat)drand48() blue:(CGFloat)drand48() alpha:1.0];
        
        //Add to UIScrollView as a sub-page
        [self.scrollView addSubview:page];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
