//
//  EventDetailViewController.h
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Event;
@interface EventDetailViewController : UIViewController
@property (nonatomic, strong) Event *event;
@end
