//
//  VMControlPanelView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMControlPanelView.h"
#import "VMPresenterProtocols.h"

@implementation VMControlPanelView


- (IBAction)clickedChange:(id)sender
{
    if ([_presenter respondsToSelector:@selector(giveChange)])
        [_presenter giveChange];
}


- (IBAction)clickedDefaultSettings:(id)sender
{
    if ([_presenter respondsToSelector:@selector(setSettingsToDefault)])
        [_presenter setSettingsToDefault];

}

@end
