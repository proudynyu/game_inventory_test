package player

import rl "vendor:raylib"

import "../item"

MAX_INVENTORY_SLOTS :: 10

Inventory :: struct {
    slots: [MAX_INVENTORY_SLOTS]Slot,
    rect: rl.Rectangle
}

inventory: Inventory = {}

create_inventory :: proc() {
    create_slots_in_inventory(&inventory, MAX_INVENTORY_SLOTS)
}

show_inventory :: proc() {
    if !player.inventory_open {
        return
    }

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
    rl.DrawRectangleRec(inventory.rect, rl.GRAY)
}

