using Godot;
using System;

public partial class player_move_test : CharacterBody2D
{
	private AnimatedSprite2D _animatedSprite;

    public override void _Ready()
    {
        _animatedSprite = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
    }

    // Most of this code was generated from the example
    // 5-20-2024 @ 12:11PM

    [Export]
	public int Speed { get; set; } = 350;

	[Export]
	public int FallAcceleration { get; set; } = 75;
	private Vector3 _targetVelocity = Vector3.Zero;

	private int accel = 1000;

	//public const float Speed = 300.0f;
	public const float JumpVelocity = -400.0f;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	public float gravity = ProjectSettings.GetSetting("physics/2d/default_gravity").AsSingle();

	// TODO Figure out how to get animated sprite 2d working in C#.
	// TODO Figure out how to get animted character body working in C#

	public override void _PhysicsProcess(double delta)
	{
		Vector2 velocity = Velocity;

        // New code
        // Mostly from the knight_2.gd gdscript
        //


		// This didn't work
        //if (Input.GetAxis("move_left", "move_right"))
        //{

        //}

        // Add the gravity.
        if (!IsOnFloor())
			velocity.Y += gravity * (float)delta;

		// Handle Jump.
		if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
			velocity.Y = JumpVelocity;

		// Get the input direction and handle the movement/deceleration.
		// As good practice, you should replace UI actions with custom gameplay actions.
		Vector2 direction = Input.GetVector("move_left", "move_right", "move_up", "move_down");
		if (direction != Vector2.Zero)
		{
			velocity.X = direction.X * Speed;
			//GetNode<AnimationPlayer>("AnimationPlayer").SpeedScale = 4;
		}
		else
		{
			velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
		}


		Velocity = velocity;
		MoveAndSlide();
	}

	
}
