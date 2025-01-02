using Godot;
using System;
using ImGuiNET;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;

public partial class imgui_test : Node2D
{
    // I need to make it to where this doesn't let the player move

    // I don't think the below is needed, keeping it in this preprocessor to not kill this on Linux or Mac
#if GODOT_WINDOWS
    [DllImport("user32.dll")]
    static extern short GetAsyncKeyState(int vKey);
#endif

    bool showWindow = false;
    // These need the exact names from the .tscn scene files
    private string[] comboBoxItems = {"castle", "castle_1", "city_1", "sky_world1", "sky_world2", "world_1", "world_1_interior"};
    string currentItem = null;

    // I can loop through these like this and using a for loop like for the comboBoxItems
    private string[] characters = {"", ""};

    private bool characterMove;


    //Node node = GetNode("scenes/test.gd");
    //Vector3 v = (Vector3)

    GDScript knight2 = GD.Load<GDScript>("res://scripts/knight_2.gd");


    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
    }


    // I should be able to change the text on this window if a user pressed the button I setup.
    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
        // https://forum.godotengine.org/t/having-actions-within-the-input-map-run-on-two-keys-being-pressed/20131
        // This should only work when built in debug, otherwise it'll do nothing
#if DEBUG


        //if(Input.IsKeyPressed(Key.Shift))

        // Left shift and A on keyboard or Left D-Pad and B on controller.
        if (Input.IsActionPressed("move_left") && Input.IsActionPressed("debug_key"))
        //|| Input.IsActionPressed("ui_left") && Input.IsActionPressed("debug_key")
            //|| Input.IsJoyButtonPressed(1, JoyButton.B) && Input.IsJoyButtonPressed(1, JoyButton.DpadLeft))
        {
            showWindow = !showWindow;
            Task.Delay(200);

        }
        //if (GetAsyncKeyState(0x20) < 0)
        //{
        //    showWindow = !showWindow;
        //    Thread.Sleep(200);
        //}

        if (showWindow) 
        {
            // This should not be left here, I only have this here for testing. Or should it? I don't think this should be running every frame.
            //.... I'll move this to only run if the window is open to minimize the slowdown/lag.
            GodotObject knight2_node = (GodotObject)knight2.New();

            ImGui.Begin("First window");
            ImGui.Text("Change Scene");

            // C++ Code somewhat adapted to C#
            // https://github.com/ocornut/imgui/issues/1658
            if (ImGui.BeginCombo("", currentItem))
            {
                for (int i = 0; i < comboBoxItems.Length; i++)
                {
                    bool isSelected = (currentItem == comboBoxItems[i]);
                    if (ImGui.Selectable(comboBoxItems[i], isSelected)) 
                    { 
                        currentItem = comboBoxItems[i];
                    }
                    if(isSelected)
                    {
                        ImGui.SetItemDefaultFocus();
                    }
                }
            }
            ImGui.EndCombo();

            // https://stackoverflow.com/questions/4639445/accessing-variable-outside-for-loop
            // TODO How would I check if the scene is valid?
            if (ImGui.Button("Change Scene"))
            {
                string currentScene = String.Join(", ", currentItem);
                GetTree().ChangeSceneToFile("res://scenes/" + currentScene + ".tscn");
                Console.WriteLine(currentScene);
                GD.Print(currentScene);
            }


            // Will this work?
            ImGui.Separator();
            if (ImGui.Button("Print GDScript"))
            {
                //GD.Print(knight2.Get("can_move"));
                //GD.Print(knight2_node.Get("can_move"));
                GD.Print(knight2_node.Get("test"));

                //GD.Print(knight2_node.Call("getFunction"));
            }

            // I never did get this working, toggle the player movement when checked or unchecked.
            if (ImGui.Checkbox("Movement", ref characterMove))
            {
                if (characterMove)
                {
                    //knight2_node.Set("can_move", true);
                    knight2_node.Set("test", true);
                    //GD.Print("Enabled!"); 
                    //knight2_node.Call("setFunction", true);
                    GD.Print(knight2_node.Get("can_move"));
                }
                else
                {
                    //knight2_node.Set("can_move", false);
                    knight2_node.Set("test", false);
                    //knight2_node.Call("setFunction", false);
                    //GD.Print("Disabled");
                    GD.Print(knight2_node.Get("can_move"));
                }
                //GD.Print("Test");
                //characterMove = !characterMove;
            }

            ImGui.Separator();
            ImGui.BeginChild("Test1");
            //ImGui.Text("Test");

            ImGui.BeginMenu("Test Menu");
            ImGui.Text("Test");
            ImGui.EndMenu();

            ImGui.EndChild();
            
            ImGui.End();
        }
#endif



    }
}
