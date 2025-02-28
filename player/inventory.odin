package player

import rl "vendor:raylib"

import "../item"

CELL_PADDING: f32 = 2
MAX_COLUMNS: f32 = 5
MAX_ROWS: f32 = 6
MAX_INVENTORY_SLOTS:: 30

Inventory :: struct {
    slots: [MAX_INVENTORY_SLOTS]Slot,
    rect: rl.Rectangle
}

inventory: Inventory = {}

create_inventory :: proc() {
    screen_width := rl.GetScreenWidth()
    screen_height := rl.GetScreenHeight()

    inventory_width :=  screen_width / 2
    inventory_heigth := screen_height

    inventory.rect = {
        x = cast(f32)(screen_width - inventory_width),
        y = 0,
        width = cast(f32)inventory_width,
        height = cast(f32)inventory_heigth
    }
    create_slots_in_inventory(&inventory, MAX_INVENTORY_SLOTS)
}

show_inventory :: proc() {
    if !player.inventory_open {
        return
    }
    rl.DrawRectangleRec(inventory.rect, rl.GRAY)
    draw_slots(&inventory)
}

draw_slots :: proc(inventory: ^Inventory) {
    for slot in inventory.slots {
        rl.DrawRectangleRec(slot.position, rl.LIGHTGRAY)
    }
}

