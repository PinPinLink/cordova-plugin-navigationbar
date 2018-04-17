## cordova-plugin-navigationbar
Cordova iOS Native NavigationBar

## Installation

In your root Cordova project

```
cordova plugin add @pinpin.link/cordova-plugin-navigationbar
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

## License

This project is licensed under the Apache 2.0 License - see the <LICENSE> file for details
