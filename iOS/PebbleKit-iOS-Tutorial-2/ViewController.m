//
//  ViewController.m
//  PebbleKit-iOS-Tutorial-2
//
//  Created by Chris Lewis on 12/9/14.
//  Copyright (c) 2014 Pebble. All rights reserved.
//

#import "ViewController.h"
#import "PebbleKit/PebbleKit.h"

#define KEY_BUTTON_UP   0
#define KEY_BUTTON_DOWN 1

@interface ViewController () <PBPebbleCentralDelegate>

@property PBWatch *watch;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

int currentPage = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get a reference to a connected watch
    self.watch = [[PBPebbleCentral defaultCentral] lastConnectedWatch];
    
    // If watch is connected, so additional setup
    if(self.watch) {
        [self.outputLabel setText:@"Watch is connected!"];
        
        // Register to receive events
        [[PBPebbleCentral defaultCentral] setDelegate:self];
        
        // Set UUID
        NSUUID *myAppUUID = [[NSUUID alloc] initWithUUIDString:@"3783cff2-5a14-477d-baee-b77bd423d079"];
        [PBPebbleCentral defaultCentral].appUUID = myAppUUID;
        [[PBPebbleCentral defaultCentral] run];
        
        // Sign up for AppMessage
        [self.watch appMessagesAddReceiveUpdateHandler:^BOOL(PBWatch *watch, NSDictionary *update) {
            // Process incoming messages
            if([update objectForKey:[NSNumber numberWithInt:KEY_BUTTON_UP]]) {
                // Up button was pressed!
                [self.outputLabel setText:@"UP"];
                
                if(currentPage > 0) {
                    currentPage--;
                }
            }
            
            if([update objectForKey:[NSNumber numberWithInt:KEY_BUTTON_DOWN]]) {
                // Down button pressed!
                [self.outputLabel setText:@"DOWN"];
                
                if(currentPage < 2) {
                    currentPage++;
                }
            }
            
            // Get the size of the main view and update the current page offset
            CGSize windowSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
            [self.scrollView setContentOffset:CGPointMake(currentPage * windowSize.width, 0) animated:YES];
            
            return YES;
        }];
    } else {
        [self.outputLabel setText:@"No watch connected!"];
    }
    
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
