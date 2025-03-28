package main

import "core:fmt"
import "core:log"
import "core:os"
//import "core:bytes"
//import rl "vendor:raylib"
//import rlgl "vendor:raylib/rlgl"

//import "player"
//import "setup"
import "inventory"

//_ready :: proc() {
//    player._ready()
//}
//
//_update :: proc(delta: f32) {
//    player._update(delta)
//}
//
//draw_bg_grid :: proc() {
//    rlgl.PushMatrix();
//        rlgl.Translatef(0, 25*50, 0);
//        rlgl.Rotatef(90, 1, 0, 0);
//        rl.DrawGrid(100, 50);
//    rlgl.PopMatrix();
//}

main :: proc() {
    current_inventory := inventory.new_inventory()

    hand: inventory.Cell = {
        item_id = 0,
        quantity = 0
    }

    hand.quantity = 1
    hand.item_id = 1

    has_added := inventory.add_item(&current_inventory, 0, &hand)
    if !has_added {
        log.fatal("Something went wrong trying to add the item")
    }

    hand.quantity = 2
    hand.item_id = 1
    has_added = inventory.add_item(&current_inventory, 0, &hand)
    if !has_added {
        log.fatal("Something went wrong trying to add the item")
    }

    inventory.draw_inventory(&current_inventory)
    //using setup
    //rl.InitWindow(WIDTH, HEIGHT, TITLE)
    //defer rl.CloseWindow()
    //
    //rl.SetTargetFPS(60)
    //_ready()
    //for !rl.WindowShouldClose() {
    //    draw_bg_grid()
    //
    //    delta := rl.GetFrameTime()
    //    rl.BeginDrawing()
    //    defer rl.EndDrawing()
    //
    //        _update(delta)
    //
    //    rl.ClearBackground(rl.WHITE)
    //}
}
