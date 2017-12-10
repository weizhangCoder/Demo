//
//  DataSafe.h
//  HomeHealth
//
//  Created by newuser on 17/1/3.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSafe : NSObject

@end

@interface NSNumber (safeCJ)

//防止类型错误出现崩溃
-(NSUInteger)length;

@end



@interface NSString (safeCJ)

//防止类型错误出现崩溃
-(NSString *)stringValue;

@end

@interface NSMutableArray (safeCJ)
-(void)addObjectOnSafe:(id)anObject;

@end

@interface NSArray (safeCJ)

-(id)objectAtIndexOnSafe:(NSUInteger)index;

@end

@interface NSMutableDictionary (safeCJ)
-(void)setObjectOnSafe:(id)anObject forKey:(id<NSCopying>)aKey;

@end

@interface NSDictionary (safeCJ)

- (NSString*)dictionaryToJson;
-(id)objectForKeyOnSafe:(id)aKey;

@end




