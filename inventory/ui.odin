package inventory

import rl "vendor:raylib"

show_inventory :: proc(inventory: ^Inventory) {
    if rl.IsKeyPressed(.I) {
        inventory.is_open = !inventory.is_open
    }
}

ui_inventory :: proc(inventory: ^Inventory) {
    if inventory.is_open {
    }
}
