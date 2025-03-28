package inventory

import "core:fmt"

MAX_CELLS :: 20
EMPTY_CELL :: 0

Cell :: struct {
    item_id: int,
    quantity: int
}

Inventory :: struct {
    cells: []Cell,
    hand: Cell
}

new_inventory :: proc() -> Inventory {
    cells := make([]Cell, MAX_CELLS)
    hand: Cell = {}
    return Inventory{ cells, hand }
}

add_item :: proc(inventory: ^Inventory, cell_index: int, hand: ^Cell) -> bool {
    // hand doenst have an item
    if hand.item_id == 0 || hand.quantity == 0 {
        return false
    }

    current_cell := &inventory.cells[cell_index]

    // cell has the same item
    if current_cell.item_id == hand.item_id {
        current_cell.quantity = current_cell.quantity + hand.quantity
        hand.item_id = EMPTY_CELL
        hand.quantity = 0
        return true
    }

    // cell is ocupied
    if current_cell.item_id != EMPTY_CELL {
        tmp := inventory.cells[cell_index]
        inventory.cells[cell_index] = hand^
        hand^ = tmp
        return true
    }

    inventory.cells[cell_index] = hand^
    hand.item_id = EMPTY_CELL
    hand.quantity = 0

    return true
}

// headless test
draw_inventory :: proc(inventory: ^Inventory) {
    for cell in inventory.cells { fmt.println(cell) }

    fmt.printfln("hand: %s",inventory.hand) 
}
