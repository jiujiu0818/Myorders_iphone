//  CenterViewController.m
//
// Copyright (c) 2014 Sébastien MICHOY
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer. Redistributions in binary
// form must reproduce the above copyright notice, this list of conditions and
// the following disclaimer in the documentation and/or other materials
// provided with the distribution. Neither the name of the nor the names of
// its contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "CenterViewController.h"
#import "Color.h"
#import "LeftPanelViewController.h"
#import "MSViewControllerSlidingPanel.h"
#import "NavigationBarButton.h"
#import "sqlite3.h"
#import "Menu.h"
#import "SingleSample.h"

#pragma mark - Global variables

/**
 *  Cells' identifier.
 */
NSString    *g_CVCCellIdentifier = @"CellIdentifier";

#pragma mark - Interface

@interface CenterViewController () <UITableViewDataSource, UITableViewDelegate>

#pragma mark Properties
/** @name Properties */

@property (nonatomic, strong)   NSArray *sections;

#pragma mark Filling sections
/** @name Filling sections */




#pragma mark Menu buttons
/** @name Menu buttons */

/**
 *  The left button of the navigation bar.
 */
@property (nonatomic, strong)   NavigationBarButton *menuButtonLeft;


@end

#pragma mark - Implementation

@implementation CenterViewController

- (void)loadView
{

}


#pragma mark UITableViewDataSource protocol
/** @name UITableViewDataSource protocol */

/**
 *  Give the number of sections in a table view.
 *
 *  @param tableView The table view.
 *
 *  @return The number of values.
 */

@end
