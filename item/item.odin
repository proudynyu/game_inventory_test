package item

import "core:fmt"
import rl "vendor:raylib"

import player "../player"

Item :: struct {
    id: int,
    name: string,
    is_picked: bool,
    is_slotted: bool,
    position: rl.Rectangle,
    color: rl.Color
}

Hand :: struct {
    item: ^Item
}

@(private)
ITEM_SIZE::50

@(private)
apple_item := new_item( 1, "apple", rl.Rectangle{x=100,y=100,width=ITEM_SIZE,height=ITEM_SIZE}, rl.RED)

@(private)
orange_item := new_item( 2, "orange", rl.Rectangle{x=200,y=200,width=ITEM_SIZE,height=ITEM_SIZE}, rl.ORANGE)

@(private)
banana_item := new_item( 3, "banana", rl.Rectangle{x=500,y=500,width=ITEM_SIZE,height=ITEM_SIZE}, rl.YELLOW)

hand: Hand = {
    item = nil
}
items: [dynamic]Item = make([dynamic]Item, 3)

draw_item :: proc(item: ^Item) {
    rl.DrawRectangleRec(item.position, item.color)
}

new_item :: proc(id: int, name: string, position: rl.Rectangle, color: rl.Color) -> Item {
    return Item{ id = id, is_picked = false, is_slotted = false, position = position, name = name, color = color }
}

item_ready :: proc() {
    append_elem(&items, apple_item)
    append_elem(&items, orange_item)
    append_elem(&items, banana_item)
}

item_update :: proc() {
    for i in 0..<len(items) {
        current_item := &items[i]
        mouse_position := rl.GetMousePosition()
        if current_item.is_picked {
            current_item.position.x = mouse_position.x
            current_item.position.y = mouse_position.y
        }
        if rl.CheckCollisionPointRec(mouse_position, current_item.position) {
            if !current_item.is_picked && rl.IsMouseButtonDown(.LEFT) && hand.item == nil {
                current_item.is_picked = true
                hand_get_item(current_item)
            }
        }

        if !current_item.is_picked {
            draw_item(current_item)
        }
    }
}

hand_get_item :: proc(current_item: ^Item) {
    if hand.item == nil {
        hand.item = current_item
    }
}

hand_drop_item :: proc(mouse_position: rl.Vector2, inventory: ^player.Inventory) {
        if player.inventory_open {
        }
        hand.item.is_picked = false
        hand.item = nil
}

hand_draw :: proc() {
    if hand.item != nil {
        mouse_position := rl.GetMousePosition()
        hand.item.position.x = mouse_position.x
        hand.item.position.y = mouse_position.y
        draw_item(hand.item)

        if rl.IsMouseButtonDown(.RIGHT) {
            hand_drop_item(mouse_position)
        }
    }
}

hand_ready :: proc() {
    hand.item = nil
}

hand_update :: proc() {
    hand_draw()
}
