//
//  Event.h
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Comment.h"
#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *eventID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *RSVPCount;
@property (nonatomic, strong) NSString *hostedBy;
@property (nonatomic, strong) NSString *eventDescription;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSURL *eventURL;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, strong) NSArray *commentsArray;
@property (nonatomic) BOOL attending;



- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)getCommentsWithBlock:(void(^)(NSArray *comments))commentBlock;
- (void)retreiveImageWithComplete:(void (^)(NSData *data))complete;


+ (NSArray *)eventsFromArray:(NSArray *)incomingArray;
+ (void)performSearchWithKeyword:(NSString *)keyword andComplete:(void(^)(NSArray *events))complete;


@end
