import re
from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
})

define_keymap(None, {
    K("Super-h"): K("left"),
    K("Super-j"): K("down"),
    K("Super-k"): K("up"),
    K("Super-l"): K("right"),
    K("Super-u"): K("page_up"),
    K("Super-d"): K("page_down"),
    K("Super-g"): {
        K("Super-g"): K("home"),
    },
    K("Super-Shift-g"): K("end")
}, "Vim-like keys")
