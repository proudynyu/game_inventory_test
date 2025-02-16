package main

import rl "vendor:raylib"

_ready :: proc() {
    player_ready()
}

_update :: proc(delta: f32) {
    player_update(delta)
}

main :: proc() {
    rl.InitWindow(WIDTH, HEIGHT, TITLE)
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)
    _ready()
    for !rl.WindowShouldClose() {
        delta := rl.GetFrameTime()
        rl.BeginDrawing()
        defer rl.EndDrawing()

        _update(delta)

        rl.ClearBackground(rl.BLACK)
    }
}
