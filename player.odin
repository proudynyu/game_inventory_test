package main

import "core:fmt"
import rl "vendor:raylib"

Player :: struct {
    position: rl.Vector2,
    body: rl.Rectangle
}

Dir :: struct {
    up: rl.Vector2,
    down: rl.Vector2,
    left: rl.Vector2,
    right: rl.Vector2
}

player: Player
dir: Dir = {
    up = {0, 1},
    down = {0, -1},
    left = {-1, 0},
    right = {1, 0}
}

player_ready :: proc() {
    x : f32 = WIDTH / 2
    y : f32 = HEIGHT / 2
    player.position = { x, y } 
    player.body = {
        x= player.position.x,
        y= player.position.y,
        width = 100,
        height = 100
    }
}

player_update :: proc(delta: f32) {
    move(delta)

    rl.DrawRectangleRec(player.body, rl.RED)
}

move :: proc(_delta: f32) {
    if rl.IsKeyPressed(rl.KeyboardKey.W) {
        player.position = player.position - (dir.up * SPEED * _delta) 
    } else if rl.IsKeyPressed(rl.KeyboardKey.D) {
        player.position = player.position + (dir.right * SPEED * _delta)
    } else if rl.IsKeyPressed(rl.KeyboardKey.S) {
        player.position = player.position - (dir.down * SPEED * _delta)
    } else if rl.IsKeyPressed(rl.KeyboardKey.A) {
        player.position = player.position + (dir.left * SPEED * _delta)
    }

    player.body.x = player.position.x
    player.body.y = player.position.y
}
