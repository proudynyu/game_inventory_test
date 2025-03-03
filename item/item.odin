package item

import "core:fmt"
import rl "vendor:raylib"

Item :: struct {
    id: int,
    name: string,
    is_picked: bool,
    is_slotted: bool,
    position: rl.Rectangle,
    color: rl.Color
}

items: [dynamic]Item = make([dynamic]Item, 3)

_update :: proc() {
    for i in 0..<len(items) {
        current_item := &items[i]
        mouse_position := rl.GetMousePosition()
        if current_item.is_picked {
            current_item.position.x = mouse_position.x
            current_item.position.y = mouse_position.y
        }
        if rl.CheckCollisionPointRec(mouse_position, current_item.position) {
            if !current_item.is_picked && rl.IsMouseButtonDown(.LEFT) {
                current_item.is_picked = true
            }
            if rl.IsMouseButtonReleased(.LEFT) {
                current_item.is_picked = false
            }
        }
        draw_item(current_item)
    }
}

draw_item :: proc(item: ^Item) {
    rl.DrawRectangleRec(item.position, item.color)
}

new_item :: proc(id: int, name: string, position: rl.Rectangle, color: rl.Color) -> Item {
    return Item{ id = id, is_picked = false, is_slotted = false, position = position, name = name, color = color }
}

@(private)
ITEM_SIZE::50

@(private)
apple_item := new_item( 1, "apple", rl.Rectangle{x=100,y=100,width=ITEM_SIZE,height=ITEM_SIZE}, rl.RED)

@(private)
orange_item := new_item( 2, "orange", rl.Rectangle{x=200,y=200,width=ITEM_SIZE,height=ITEM_SIZE}, rl.ORANGE)

@(private)
banana_item := new_item( 3, "banana", rl.Rectangle{x=500,y=500,width=ITEM_SIZE,height=ITEM_SIZE}, rl.YELLOW)

_ready :: proc() {
    append_elem(&items, apple_item)
    append_elem(&items, orange_item)
    append_elem(&items, banana_item)
}

