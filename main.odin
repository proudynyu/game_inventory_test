package main

import rl "vendor:raylib"

import "player"
import "setup"

_ready :: proc() {
    player._ready()
}

_update :: proc(delta: f32) {
    player._update(delta)
}

main :: proc() {
    using setup
    rl.InitWindow(WIDTH, HEIGHT, TITLE)
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)
    _ready()
    for !rl.WindowShouldClose() {
        delta := rl.GetFrameTime()
        rl.BeginDrawing()
        defer rl.EndDrawing()

        _update(delta)

        rl.ClearBackground(rl.WHITE)
    }
}
