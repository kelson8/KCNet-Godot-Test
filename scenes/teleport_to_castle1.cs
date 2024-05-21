using Godot;
using System;

public partial class teleport_to_castle1 : Area2D
{
    // RGBA tp vector4: https://codepen.io/sandstedt/full/gJqJEJ

    // https://forum.godotengine.org/t/what-is-the-difference-between-physicsprocess-and-process-c/25549

    // This doesn't work yet. It seems to always run when W is pressed and not when I'm in the area.

    private bool entered = false;
    // 5-20-2024 @ 12:36PM
    // https://forum.godotengine.org/t/area2d-area-entered-equivalent-in-c/22997
    // Replicating code from the teleport in gdscript, if I can hook this up this should work fine.
    private void _OnArea2DEntered(PhysicsBody2D body)
    {
        entered = true;
    }

    private void _OnArea2DExited(PhysicsBody2D body)
    {
        entered = false;
    }

    public override void _PhysicsProcess(double delta)
    {
        if (entered)
            //GD.Print("You entered the area!");
        {
            // https://www.reddit.com/r/godot/comments/swt202/how_do_i_detect_that_a_key_is_released_in_c/
            //if (Input.IsActionJustPressed("move_up"))
            if (Input.IsKeyPressed(Key.W))
            {
                GetTree().ChangeSceneToFile("res://scenes/castle.tscn");
            }
        }
        //base._PhysicsProcess(delta);
    }

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
    }

    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
    }
}
