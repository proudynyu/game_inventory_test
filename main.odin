package main

import "core:fmt"
import "core:log"
import "core:os"
import rl "vendor:raylib"
import rlgl "vendor:raylib/rlgl"

import "inventory"

WIDTH :: 800
HEIGHT :: 600
TITLE: cstring = "Game Inventory"
SPEED :: 100

draw_bg_grid :: proc() {
   rlgl.PushMatrix();
       rlgl.Translatef(0, 25*50, 0);
       rlgl.Rotatef(90, 1, 0, 0);
       rl.DrawGrid(100, 50);
   rlgl.PopMatrix();
}

// item_1 := inventory.Item{
//     amount = 1,
//     id = 1
// }
//
// item_2 := inventory.Item{
//     amount = 1,
//     id = 3
// }

main :: proc() {
    // headless inventory test
    // current_inventory := inventory.new_inventory()
    // inventory.hand_get_item(&current_inventory.hand, &item_1)
    //
    // fmt.println(current_inventory.hand.item)
    // has_added := inventory.add_item(&current_inventory, 0)
    // if !has_added {
    //     log.fatal("Something went wrong trying to add the item")
    // }
    //
    // inventory.hand_get_item(&current_inventory.hand, &item_1)
    // has_added = inventory.add_item(&current_inventory, 0)
    // if !has_added {
    //     log.fatal("Something went wrong trying to add the item")
    // }
    //
    // inventory.hand_get_item(&current_inventory.hand, &item_2)
    // has_added = inventory.add_item(&current_inventory, 0)
    // if !has_added {
    //     log.fatal("Something went wrong trying to add the item")
    // }
    //
    // inventory.draw_inventory(&current_inventory)

    rl.InitWindow(WIDTH, HEIGHT, TITLE)
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)
    for !rl.WindowShouldClose() {
       draw_bg_grid()

       delta := rl.GetFrameTime()
       rl.BeginDrawing()
       defer rl.EndDrawing()

       rl.ClearBackground(rl.BLACK)
    }
}
