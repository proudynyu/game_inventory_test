package item

import rl "vendor:raylib"

Item :: struct {
    id: int,
    name: string,
    is_picked: bool,
    is_slotted: bool,
    position: rl.Rectangle
}
