//
//  EKCoinChange.m
//  EKAlgorithmsApp
//
//  Created by Wo Jun Feng on 2/8/16.
//  Copyright © 2016 Evgeny Karkan. All rights reserved.
//

#import "EKCoinChange.h"

@implementation EKCoinChange
/*
 https://leetcode.com/problems/coin-change/
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Example 1:
 coins = [1, 2, 5], amount = 11
 return 3 (11 = 5 + 5 + 1)
 
 Example 2:
 coins = [2], amount = 3
 return -1.
 
 Note:
 You may assume that you have an infinite number of each kind of coin.
 */

+ (NSInteger)calculateCoinChangeForCoins:(NSArray *)coins amount:(NSInteger)amount
{
    NSOrderedSet *coinsOrderedSetReversed = [[NSOrderedSet orderedSetWithArray:coins] reversedOrderedSet];
    NSMutableArray *coinsArrayDesc = [[coinsOrderedSetReversed array] mutableCopy];
    
    for (NSInteger i = 0; i < coins.count; i++) {
        NSInteger remainingAmount = amount;
        NSInteger count = 0;
        NSInteger remainder = 0;
        
        for (NSNumber *coin in coinsArrayDesc) {
            if (remainingAmount >= [coin integerValue]) {
                remainder = remainingAmount % [coin integerValue];
                count = count + (remainingAmount / [coin integerValue]);
                
                if (remainder) {
                    remainingAmount = remainder;
                } else {
                    return count;
                }
            }
        }
        
        [coinsArrayDesc removeObjectAtIndex:0];
    }
    
    return NSNotFound;
}


@end
