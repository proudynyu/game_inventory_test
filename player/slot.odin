package player

import rl "vendor:raylib"

import "../item"

Slot :: struct {
    item: item.Item,
    position: rl.Rectangle
}

create_slots_in_inventory :: proc(inventory: ^Inventory, max_slots: int) {
    for i in 0 ..< MAX_ROWS {
        for j in 0..< MAX_COLUMNS {
            slot: Slot = { 
                item = {}, 
                position = get_slot_position(inventory, cast(f32)j, cast(f32)i) 
            }
            pos := cast(int)(i * MAX_COLUMNS + j)
            inventory.slots[pos] = slot
        }
    }
}

get_slot_position :: proc(inventory: ^Inventory, offset_x: f32, offset_y: f32) -> rl.Rectangle {
    width := (inventory.rect.width / MAX_COLUMNS) - 2*CELL_PADDING
    height := (inventory.rect.height / MAX_ROWS) - 2*CELL_PADDING
    x := (inventory.rect.x + CELL_PADDING) + (width + 2*CELL_PADDING) * offset_x
    y := (inventory.rect.y + CELL_PADDING) + (height + 2*CELL_PADDING) * offset_y
    
    return rl.Rectangle{ x, y, width, height }
}
