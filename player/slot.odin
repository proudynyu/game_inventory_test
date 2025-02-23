package player

import rl "vendor:raylib"

import "../item"

Slot :: struct {
    item: item.Item,
    position: rl.Rectangle
}

CELL_PADDING: f32 = 2
CELL_MAX_PER_ROW: f32 = 2
CELL_MAX_PER_HEIGHT: f32 = 5

slot_ready :: proc() {
    
}
slot_update :: proc(inventory: ^Inventory) {
}

get_slot_position :: proc(inventory: ^Inventory, offset_x: f32, offset_y: f32) -> rl.Rectangle {
    width := (inventory.rect.width / CELL_MAX_PER_ROW) - 2*CELL_PADDING
    height := (inventory.rect.height / CELL_MAX_PER_ROW) - 2*CELL_PADDING

    // TODO: need to implement the offset for the position
    x := (inventory.rect.x + CELL_PADDING)
    y := (inventory.rect.y + CELL_PADDING)

    return rl.Rectangle{ x, y, width, height }
}


create_slots_in_inventory :: proc(inventory: ^Inventory, max_slots: int) {
    for i in 0 ..< CELL_MAX_PER_ROW {
        for j in 0..< CELL_MAX_PER_HEIGHT {
            slot: Slot = {
                item = {},
                position = get_slot_position(inventory, cast(f32)j, cast(f32)i)
            }
            pos := cast(int)(i * CELL_MAX_PER_HEIGHT + j)
            inventory.slots[pos] = slot
        }
    }
}
