using Godot;
using System;
using ImGuiNET;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;

public partial class imgui_test : Node2D
{

    [DllImport("user32.dll")]
    static extern short GetAsyncKeyState(int vKey);

    bool showWindow = false;
    private string[] comboBoxItems = {"castle", "castle1", "city_1", "sky_world1", "sky_world2", "world_1"};
    string currentItem = null;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
    }


    // I should be able to change the text on this window if a user pressed the button I setup.
    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
        if (Input.IsKeyPressed(Key.Shift))
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
            if (ImGui.Button("Change Scene"))
            {
                string currentScene = String.Join(", ", currentItem);
                GetTree().ChangeSceneToFile("res://scenes/" + currentScene + ".tscn");
                Console.WriteLine(currentScene);
                GD.Print(currentScene);
            }



            ImGui.End();
        }



    }
}
