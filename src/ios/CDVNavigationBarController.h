#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UINavigationBar.h>
#import <Cordova/CDVPlugin.h>

@interface CDVNavigationBarController : CDVPlugin {
  UINavigationBar* navBar;
  UINavigationItem* navItem;
  UIBarButtonItem* leftButton;
  NSString* leftCallbackId;
  UIBarButtonItem* rightButton;
  NSString* rightCallbackId;
  CGFloat height;
}

@property (nonatomic, retain) CDVNavigationBarController *navBarController;

- (void) style: (CDVInvokedUrlCommand*) command;
- (void) title: (CDVInvokedUrlCommand*) command;
- (void) left: (CDVInvokedUrlCommand*) command;
- (void) right: (CDVInvokedUrlCommand*) command;
- (void) show: (CDVInvokedUrlCommand*) command;
- (void) hide: (CDVInvokedUrlCommand*) command;
- (void) showLeft: (CDVInvokedUrlCommand*) command;
- (void) hideLeft: (CDVInvokedUrlCommand*) command;
- (void) showRight: (CDVInvokedUrlCommand*) command;
- (void) hideRight: (CDVInvokedUrlCommand*) command;

@end
