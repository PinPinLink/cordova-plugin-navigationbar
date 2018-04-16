var exec = require('cordova/exec');
var PLUGIN_NAME = 'NavigationBar';
var STYLES = {
  'Default': 0,
  'Black': 1,
  'BlackOpaque': 1,
  'BlackTransparent': 2
};
var STYLE_OPTION = {
  style: 0,
  translucent: true,
  background: '#FFFFFFFF',
  height: 44.0
};
var ITEM_OPTION = {
  color: '#0000FFFF',
  font: 'Arial',
  size: 24
};
var SYSTEM_ICONS = {
  '@Done': 0,
  '@Cancel': 1,
  '@Edit': 2,
  '@Save': 3,
  '@Add': 4,
  '@FlexibleSpace': 5,
  '@FixedSpace': 6,
  '@Compose': 7,
  '@Reply': 8,
  '@Action': 9,
  '@Organize': 10,
  '@Bookmarks': 11,
  '@Search': 12,
  '@Refresh': 13,
  '@Stop': 14,
  '@Camera': 15,
  '@Trash': 16,
  '@Play': 17,
  '@Pause': 18,
  '@Rewind': 19,
  '@FastForward': 20,
  '@Undo': 21,
  '@Redo': 22
};
module.exports = {
  style: function(options) {
    if (typeof options === 'string') {
      options = {
        style: STYLES[options] || 0
      };
    }
    options = Object.assign({}, STYLE_OPTION, options);
    if (typeof options.style === 'string') {
      options.style = STYLES[options.style] || 0;
    }
    exec(null, null, PLUGIN_NAME, 'style', [options]);
  },
  title: function(options) {
    if (!options) {
      options = {
        title: ''
      };
    }
    if (typeof options === 'string') {
      if (/^(http(s)?|file):\/\//.test(options)) {
        options = {
          image: options
        };
      } else {
        options = {
          title: options
        };
      }
    }
    options = Object.assign({}, ITEM_OPTION, options);
    exec(null, null, PLUGIN_NAME, 'title', [options]);
  },
  left: function(options, ontaped) {
    exec(ontaped, null, PLUGIN_NAME, 'left', [button(options)]);
  },
  right: function(options, ontaped) {
    exec(ontaped, null, PLUGIN_NAME, 'right', [button(options)]);
  },
  show: function() {
    exec(null, null, PLUGIN_NAME, 'show', []);
  },
  hide: function() {
    exec(null, null, PLUGIN_NAME, 'hide', []);
  },
  showLeft: function(options) {
    options = options || {};
    if (!('animated' in options)) {
      options.animated = false;
    }
    exec(null, null, PLUGIN_NAME, 'showLeft', [options]);
  },
  hideLeft: function(options) {
    options = options || {};
    if (!('animated' in options)) {
      options.animated = false;
    }
    exec(null, null, PLUGIN_NAME, 'hideLeft', [options]);
  },
  showRight: function(options) {
    options = options || {}
    if (!('animated' in options)) {
      options.animated = false
    }
    exec(null, null, PLUGIN_NAME, 'showRight', [options]);
  },
  hideRight: function(options) {
    options = options || {};
    if (!('animated' in options)) {
      options.animated = false;
    }
    exec(null, null, PLUGIN_NAME, 'hideRight', [options]);
  }
};

function button(options) {
  if (typeof options === 'string') {
    if (SYSTEM_ICONS[options] !== undefined) {
      options = {
        'icon': SYSTEM_ICONS[options]
      };
    } else {
      options = {
        'title': options
      };
    }
  }
  if (options.icon && typeof options.icon === 'string') {
    if (SYSTEM_ICONS[options.icon] !== undefined) {
      options.icon = SYSTEM_ICONS[options.icon];
    } else {
      options.title = options.icon;
      delete options.icon;
    }
  }
  return Object.assign({}, ITEM_OPTION, options);
}
