package main

import "core:fmt"
import "core:bytes"
import rl "vendor:raylib"
import rlgl "vendor:raylib/rlgl"

import "player"
import "setup"

_ready :: proc() {
    player._ready()
}

_update :: proc(delta: f32) {
    player._update(delta)
}

draw_bg_grid :: proc() {
    rlgl.PushMatrix();
        rlgl.Translatef(0, 25*50, 0);
        rlgl.Rotatef(90, 1, 0, 0);
        rl.DrawGrid(100, 50);
    rlgl.PopMatrix();
}

main :: proc() {
    using setup
    rl.InitWindow(WIDTH, HEIGHT, TITLE)
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)
    _ready()
    for !rl.WindowShouldClose() {
        draw_bg_grid()

        delta := rl.GetFrameTime()
        rl.BeginDrawing()
        defer rl.EndDrawing()

            _update(delta)

        rl.ClearBackground(rl.WHITE)
    }
}
