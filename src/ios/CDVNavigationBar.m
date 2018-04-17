#import "CDVNavigationBar.h"
#import <UIKit/UITabBar.h>
#import <QuartzCore/QuartzCore.h>

@implementation CDVNavigationBar
@synthesize webView;

-(void) pluginInitialize {
  webView = ((UIWebView*)super.webView);
  navBar = [[UINavigationBar alloc] init];
  if (@available(iOS 11.0, *)) {
    navBar.insetsLayoutMarginsFromSafeArea = true;
  }
  navItem = [[UINavigationItem alloc] initWithTitle:@""];
  [navBar setItems:@[navItem]];
  [navBar setHidden:YES];
  [webView.superview addSubview:navBar];
}

-(void) style:(CDVInvokedUrlCommand*) command {
  NSDictionary *options = [command.arguments objectAtIndex:0];
  height = [[options objectForKey:@"height"] floatValue];
  navBar.barStyle = (int)[options objectForKey:@"style"];
  [navBar setBarTintColor:[self colorWithHexString:[options objectForKey:@"background"]]];
  [navBar setTranslucent:[[options objectForKey:@"translucent"] boolValue]];
}

-(void) title:(CDVInvokedUrlCommand*) command {
  NSDictionary *options = [command.arguments objectAtIndex:0];
  if ([options objectForKey:@"title"]) {
    navItem.title = [options objectForKey:@"title"];
    [navBar setTitleTextAttributes: @{
      NSFontAttributeName:[UIFont fontWithName:[options objectForKey:@"font"]
      size:[[options objectForKey:@"size"] floatValue]],
      NSForegroundColorAttributeName:[self colorWithHexString:[options objectForKey:@"color"]]
    }];
    navItem.titleView = NULL;
  } else if ([options objectForKey:@"image"]) {
    NSString *URI = [options objectForKey:@"image"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URI]];
    UIImage *image = image = [UIImage imageWithData:data];;
    if (image) {
      UIImageView * view = [[UIImageView alloc] initWithImage:image];
      view.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
      [navItem setTitleView:view];
    } else {
      NSLog(@"Nav bar image %@ not found or could not be loaded", URI);
    }
  }
}

- (void) left:(CDVInvokedUrlCommand*) command {
  leftButton = [self buttonItem:command];
  navItem.leftBarButtonItem = leftButton;
  if (command.callbackId) {
    leftCallbackId = command.callbackId;
    leftButton.action = @selector(leftTapped);
  }
}

- (void) right:(CDVInvokedUrlCommand*) command {
  rightButton = [self buttonItem:command];
  navItem.rightBarButtonItem = rightButton;
  if (command.callbackId) {
    rightCallbackId = command.callbackId;
    rightButton.action = @selector(rightTapped);
  }
}

- (UIBarButtonItem *) buttonItem:(CDVInvokedUrlCommand*) command {
  NSDictionary *options = [command.arguments objectAtIndex:0];
  UIBarButtonItem *button;
  if ([options objectForKey:@"icon"]) {
      button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:[self getUIBarButtonSystemItem:[[options objectForKey:@"icon"] intValue]] target:self action:nil];
      button.tintColor = [self colorWithHexString:[options objectForKey:@"color"]];
  } else {
    button = [[UIBarButtonItem alloc] initWithTitle:[options objectForKey:@"title"] style:UIBarButtonItemStylePlain target:self action:nil];
    [button setTitleTextAttributes:@{
      NSFontAttributeName:[
        UIFont fontWithName:[options objectForKey:@"font"]
        size:[[options objectForKey:@"size"] intValue]],
      NSForegroundColorAttributeName:[self colorWithHexString:[options objectForKey:@"color"]]
    } forState:UIControlStateNormal];
  }
  return button;
}

- (void) showLeft:(CDVInvokedUrlCommand*) command {
  NSDictionary *options = [command.arguments objectAtIndex:0];
  [navItem setLeftBarButtonItem:leftButton animated:[[options objectForKey:@"animated"] boolValue]];
}

- (void) hideLeft:(CDVInvokedUrlCommand*) command {
  NSDictionary *options = [command.arguments objectAtIndex:0];
  [navItem setLeftBarButtonItem:nil animated:[[options objectForKey:@"animated"] boolValue]];
}

- (void) showRight:(CDVInvokedUrlCommand*) command {
  const NSDictionary *options = [command.arguments objectAtIndex:0];
  [navItem setRightBarButtonItem:rightButton animated:[[options objectForKey:@"animated"] boolValue]];
}

- (void) hideRight:(CDVInvokedUrlCommand*) command {
  const NSDictionary *options = [command.arguments objectAtIndex:0];
  [navItem setRightBarButtonItem:nil animated:[[options objectForKey:@"animated"] boolValue]];
}

-(void) leftTapped {
  if (!leftCallbackId) {
    return;
  }
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [[self commandDelegate] sendPluginResult:result callbackId:leftCallbackId];
}

-(void) rightTapped {
  if (!rightCallbackId) {
    return;
  }
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [[self commandDelegate] sendPluginResult:result callbackId:rightCallbackId];
}

-(void) show:(CDVInvokedUrlCommand*) command {
    if ([navBar isHidden]) {
        [navBar setHidden:NO];
        [self correctWebViewFrame];
    }
}

-(void) hide:(CDVInvokedUrlCommand*) command {
  if (![navBar isHidden]) {
    [navBar setHidden:YES];
    [self correctWebViewFrame];
  }
}

-(void) correctWebViewFrame {
  if(navBar.hidden == NO) {
    [navBar setFrame:CGRectMake(
      0,
      webView.frame.origin.y,
      [UIScreen mainScreen].bounds.size.width,
      height
    )];
    [webView setFrame:CGRectMake(
      0,
      navBar.frame.origin.y + height,
      [UIScreen mainScreen].bounds.size.width,
      [UIScreen mainScreen].bounds.size.height - height
    )];
  } else {
    [webView setFrame:CGRectMake(
      0,
      navBar.frame.origin.y,
      [UIScreen mainScreen].bounds.size.width,
      [UIScreen mainScreen].bounds.size.height
    )];
  }
}

- (UIColor *) colorWithHexString:(NSString *) str_HEX {
    unsigned rgba = 0;
    NSScanner *scanner = [NSScanner scannerWithString:str_HEX];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgba];
    return [UIColor colorWithRed:((rgba & 0xFF000000) >> 24) / 255.0
                           green:((rgba & 0xFF0000) >> 16) / 255.0
                            blue:((rgba & 0xFF00) >> 8) / 255.0
                           alpha:(rgba & 0xFF) / 255.0];
}

- (UIBarButtonSystemItem) getUIBarButtonSystemItem:(int) index {
  switch (index) {
    case 0:
      return UIBarButtonSystemItemDone;
    case 1:
      return UIBarButtonSystemItemCancel;
    case 2:
      return UIBarButtonSystemItemEdit;
    case 3:
      return UIBarButtonSystemItemSave;
    case 4:
      return UIBarButtonSystemItemAdd;
    case 5:
      return UIBarButtonSystemItemFlexibleSpace;
    case 6:
      return UIBarButtonSystemItemFixedSpace;
    case 7:
      return UIBarButtonSystemItemCompose;
    case 8:
      return UIBarButtonSystemItemReply;
    case 9:
      return UIBarButtonSystemItemAction;
    case 10:
      return UIBarButtonSystemItemOrganize;
    case 11:
      return UIBarButtonSystemItemBookmarks;
    case 12:
      return UIBarButtonSystemItemSearch;
    case 13:
      return UIBarButtonSystemItemRefresh;
    case 14:
      return UIBarButtonSystemItemStop;
    case 15:
      return UIBarButtonSystemItemCamera;
    case 16:
      return UIBarButtonSystemItemTrash;
    case 17:
      return UIBarButtonSystemItemPlay;
    case 18:
      return UIBarButtonSystemItemPause;
    case 19:
      return UIBarButtonSystemItemRewind;
    case 20:
      return UIBarButtonSystemItemFastForward;
    case 21:
      return UIBarButtonSystemItemUndo;
    default:
      return UIBarButtonSystemItemRedo;
  }
}

@end
