## cordova-plugin-navigationbar
Cordova iOS Native NavigationBar

## Installation

In your root Cordova project

```
cordova plugin add [@pinpin.link/cordova-plugin-navigationbar
```

## Example
```
/* Set NavigationBar Style */
NavigationBar.style({
  style: 'Default', // 'Black',  'BlackOpaque' or 'BlackTransparent',
  translucent: true,
  background: '#FFFFFFFF',
  height: 44.0
});

/* Set NavigationBar Title */
NavigationBar.title({
  title: 'Your Title Here',
  color: '#0000FFFF',
  font: 'Arial',
  size: 24
});

/* Remove NavigationBar Title */
NavigationBar.title();

/* Set NavigationBar Left */
NavigationBar.left({
  title: 'Left',
  color: '#0000FFFF',
  font: 'Arial',
  size: 24
}, function () {
  alert('NavigationBar left tapped!')
});

/* Set NavigationBar Right */
NavigationBar.right({
  title: 'Right',
  color: '#0000FFFF',
  font: 'Arial',
  size: 24
}, function () {
  alert('NavigationBar right tapped!')
});

/* Use System Item Icon */
NavigationBar.right({
  title: '@Done',
  color: '#0000FFFF'
}, function () {
  alert('NavigationBar right tapped!')
});

/* Show NavigationBar */
NavigationBar.show();

/* Hide NavigationBar */
NavigationBar.hide();

/* Show NavigationBar Left */
NavigationBar.showLeft();

/* Hide NavigationBar Left */
NavigationBar.hideLeft();

/* Show NavigationBar Right */
NavigationBar.showRight();

/* Hide NavigationBar Right */
NavigationBar.hideRight();
```
## System Item Icons

1. [@Done](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617131-done)
2. [@Cancel](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617133-cancel)
3. [@Edit](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617168-edit)
4. [@Save](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617126-save)
5. [@Add](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617115-add)
6. [@FlexibleSpace](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617162-flexiblespace)
7. [@FixedSpace](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617152-fixedspace)
8. [@Compose](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617156-compose)
9. [@Reply](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617150-reply)
10. [@Action](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617116-action)
11. [@Organize](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617121-organize)
12. [@Bookmarks](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617144-bookmarks)
13. [@Search](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617146-search)
14. [@Refresh](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617123-refresh)
15. [@Stop](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617142-stop)
16. [@Camera](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617159-camera)
17. [@Trash](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617167-trash)
18. [@Play](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617147-play)
19. [@Pause](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617119-pause)
20. [@Rewind](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617112-rewind)
21. [@FastForward](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617136-fastforward)
22. [@Undo](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617130-undo)
23. [@Redo](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/1617137-redo)

## License

This project is licensed under the Apache 2.0 License - see the <LICENSE> file for details
