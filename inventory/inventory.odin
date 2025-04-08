package inventory

import "core:fmt"

MAX_CELLS :: 20
EMPTY_CELL :: 0

Cell :: struct { item: ^Item }

Inventory :: struct {
    cells: []Cell,
    hand: Cell
}

new_inventory :: proc() -> Inventory {
    cells := make([]Cell, MAX_CELLS)
    hand: Cell = { item = nil }
    return Inventory{ cells, hand }
}

hand_get_item :: proc(hand: ^Cell, item: ^Item) -> ^Item {
    if hand.item == nil {
        hand.item = item
        return nil
    }

    if hand.item.id == item.id {
        hand.item.amount = hand.item.amount + 1
        return nil
    }

    tmp := hand.item
    hand.item = item
    return tmp
}

add_item :: proc(inventory: ^Inventory, cell_index: int) -> bool {
    out_of_bound := cell_index < 0 || cell_index > len(inventory.cells)
    empty_hand := inventory.hand.item == nil
    if out_of_bound || empty_hand  {
        return false
    }

    current_cell := &inventory.cells[cell_index]
    if current_cell.item == nil {
        inventory.cells[cell_index].item = inventory.hand.item
        inventory.hand.item = nil
        return true
    }

    // cell has the same item
    if current_cell.item.id == inventory.hand.item.id {
        current_cell.item.amount = current_cell.item.amount + inventory.hand.item.amount
        inventory.hand.item = nil
        return true
    }

    tmp_item := inventory.cells[cell_index].item
    inventory.cells[cell_index] = inventory.hand
    inventory.hand.item = tmp_item

    return true
}

// headless test
draw_inventory :: proc(inventory: ^Inventory) {
    for cell in inventory.cells { fmt.println(cell) }

    fmt.printfln("hand: %s",inventory.hand) 
}
