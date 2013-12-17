//
//  CRPaddyTableView.m
//  CRPaddyTableView
//
//  Created by croath on 13-9-22.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "CRPaddyTableView.h"

@interface CRPaddyTableView(){
    UIDynamicAnimator *_pAnimator;
    UIGravityBehavior *_gBehavior;
}

@end
@implementation CRPaddyTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

-(void)_commonInit{
    _pAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    [_pAnimator addBehavior:_gBehavior];
}

- (void)addBehaviorsToCell:(UITableViewCell*)cell{
    for (UIDynamicBehavior* b in _pAnimator.behaviors) {
        if ([b isKindOfClass:[UIAttachmentBehavior class]]) {
            if ([[(UIAttachmentBehavior*)b items] containsObject:cell]){
                [_pAnimator removeBehavior:b];
            }
        }
    }
    
    CGPoint anchorPoint = CGPointMake(cell.bounds.size.width/2, cell.frame.origin.y);

    UIAttachmentBehavior* attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:cell attachedToAnchor:anchorPoint];
    [attachmentBehavior setLength:0];
    [attachmentBehavior setFrequency:1];
    [attachmentBehavior setDamping:0.2];
    [_pAnimator addBehavior:attachmentBehavior];
}

- (void)configurePoint{
    for (UIDynamicBehavior* b in _pAnimator.behaviors) {
        if ([b isKindOfClass:[UIAttachmentBehavior class]]) {
            CGPoint p = [(UIAttachmentBehavior*)b anchorPoint];
            p.y += 10;
            [(UIAttachmentBehavior*)b setAnchorPoint:p];
        }
    }
}

- (void)dealloc{
    [_pAnimator removeAllBehaviors];
}

@end
