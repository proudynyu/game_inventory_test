package player

import rl "vendor:raylib"

import "../setup"

Player :: struct {
    position:        rl.Vector2,
    body:            rl.Rectangle,
    inventory_open:  bool
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

move :: proc(_delta: f32) {
    using setup
    if rl.IsKeyPressed(rl.KeyboardKey.W) {
        player.position = player.position - (dir.up * SPEED ) 
    } else if rl.IsKeyPressed(rl.KeyboardKey.D) {
        player.position = player.position + (dir.right * SPEED)
    } else if rl.IsKeyPressed(rl.KeyboardKey.S) {
        player.position = player.position - (dir.down * SPEED)
    } else if rl.IsKeyPressed(rl.KeyboardKey.A) {
        player.position = player.position + (dir.left * SPEED)
    }

    player.body.x = player.position.x
    player.body.y = player.position.y
}


player_keys :: proc() {
    is_open := player.inventory_open
    if rl.IsKeyPressed(rl.KeyboardKey.I) {
        player.inventory_open = !is_open
    }
}

_ready :: proc() {
    using setup
    x : f32 = WIDTH / 2
    y : f32 = HEIGHT / 2
    player.position = { x, y } 
    player.body = {
        x= player.position.x,
        y= player.position.y,
        width = 100,
        height = 100
    }
    player.inventory_open = false
}

_update :: proc(delta: f32) {
    rl.DrawRectangleRec(player.body, rl.RED)
    player_keys()
    move(delta)
}
