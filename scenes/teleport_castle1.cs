using Godot;
using System;

public partial class teleport_castle1 : Area2D
{

    private bool entered = false;
    // 5-20-2024 @ 12:36PM
    // https://forum.godotengine.org/t/area2d-area-entered-equivalent-in-c/22997
    // Replicating code from the teleport in gdscript, if I can hook this up this should work fine.
    private void _OnArea2DEntered(Area2D area)
    {
        entered = true;
    }

    private void _OnArea2DExited(Area2D area) 
    {
        entered = false;
    }

    public override void _PhysicsProcess(double delta)
    {
        if (entered)
            //GD.Print("You entered the area!");
        {
            //if (Input.IsActionJustPressed("move_up"))
            if (Input.IsKeyPressed(Key.W))
            {
                GetTree().ChangeSceneToFile("res://scenes/sky_world1.tscn");
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
