//
//  Comment.m
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Comment.h"

@implementation Comment


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        self.author = dictionary[@"member_name"];
        self.date = [Comment dateFromNumber:dictionary[@"time"]];
        self.text = dictionary[@"comment"];
        
        self.memberID = dictionary[@"member_id"];
    }
    return self;
}

+ (NSArray *)objectsFromArray:(NSArray *)incomingArray
{
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:incomingArray.count];
    
    for (NSDictionary *d in incomingArray) {
        Comment *e = [[Comment alloc]initWithDictionary:d];
        [newArray addObject:e];
        
    }
    return newArray;
}

+ (NSDate *) dateFromNumber:(NSNumber *)number
{
    NSNumber *time = [NSNumber numberWithDouble:([number doubleValue] )];
    NSTimeInterval interval = [time doubleValue];

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval/1000.];
    return date;
}

@end
