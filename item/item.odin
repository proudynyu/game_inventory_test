package item

import rl "vendor:raylib"

Item :: struct {
    name: string,
    image: rl.Texture2D,
    is_picked: bool,
    is_slotted: bool,
    position: rl.Rectangle
}

pick_item :: proc() {

}

