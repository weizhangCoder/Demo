//
//  DataSafe.m
//  HomeHealth
//
//  Created by newuser on 17/1/3.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import "DataSafe.h"

@implementation DataSafe



@end

@implementation NSNumber (safeCJ)

//防止类型错误出现崩溃
-(NSUInteger)length{
    return [self stringValue].length;
}

@end



@implementation NSString (safeCJ)

-(NSString *)stringValue{
    return self;
}

@end

@implementation NSMutableArray (safeCJ)

-(void)addObjectOnSafe:(id)anObject{
    if (!anObject) {
        NSLog(@"warning：Array试图插入空对象");
        return;
    }
    [self addObject:anObject];
}

@end

@implementation NSArray(safeCJ)

-(id)objectAtIndexOnSafe:(NSUInteger)index{
    if (index >= self.count) {
        return nil;
    }
    id obj = [self objectAtIndex:index];

    return obj;
}


@end

@implementation NSMutableDictionary (safeCJ)

-(void)setObjectOnSafe:(id)anObject forKey:(id<NSCopying>)aKey{
    if (!anObject) {
        NSLog(@"warning：Dictionary的试图对key--%@--字段置入空对象",aKey);
        return;
    }
    [self setObject:anObject forKey:aKey];
}



@end

@implementation NSDictionary(safeCJ)

- (NSString*)dictionaryToJson{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(id)objectForKeyOnSafe:(id)aKey{
    if (!aKey) {
        return NSLocalizedString(@"home.keyCanNotBeEmpty", nil);
    }
    id obj = [self objectForKey:aKey];
    return obj;
}

@end
