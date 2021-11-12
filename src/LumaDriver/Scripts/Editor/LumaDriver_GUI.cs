using UnityEngine;
using UnityEditor;

public class LumaDriver_GUI : ShaderGUI
{
    MaterialEditor editor;
    MaterialProperty[] properties;

    public override void OnGUI (MaterialEditor editor, MaterialProperty[] properties) {
        this.editor = editor;
        this.properties = properties;

        MaterialProperty _Page = FindProperty("_Page", properties);
        editor.ShaderProperty(_Page, _Page.displayName);

        switch (_Page.floatValue) {
            case 0: ShowPage_MainOptions();    break;
            case 1: ShowPage_IdleAnimations(); break;
            case 2: ShowPage_AudioLink();      break;
            case 3: ShowPage_ColorOverrides(); break;
        }
    }
    
    void ShowPage_MainOptions() {
        ShowProperty("_IsEnabled");
        ShowProperty("_LumaPixel");
        ShowProperty("_ReactiveIdle");
        ShowProperty("_DebugZone");
    }
    
    void ShowPage_IdleAnimations() {
        ShowProperty("_RGBSpeed");

        ShowProperty("_ShiftZ1");
        ShowProperty("_ShiftZ2");
        ShowProperty("_ShiftZ3");
        ShowProperty("_ShiftZ4");
        ShowProperty("_PulseSpeed");
        ShowProperty("_MinimumBrightness");

        ShowProperty("_ShiftG1StopA");
        ShowProperty("_ShiftG1StopB");
        ShowProperty("_ShiftG1StopC");
        ShowProperty("_FadingG1");
        ShowProperty("_FadeG1Time");
        ShowProperty("_TimeG1Scale");
        ShowProperty("_MidG1Offset");

        ShowProperty("_ShiftG2StopA");
        ShowProperty("_ShiftG2StopB");
        ShowProperty("_ShiftG2StopC");
        ShowProperty("_FadingG2");
        ShowProperty("_FadeG2Time");
        ShowProperty("_TimeG2Scale");
        ShowProperty("_MidG2Offset");

        ShowProperty("_ShiftG3StopA");
        ShowProperty("_ShiftG3StopB");
        ShowProperty("_ShiftG3StopC");
        ShowProperty("_FadingG3");
        ShowProperty("_FadeG3Time");
        ShowProperty("_TimeG3Scale");
        ShowProperty("_MidG3Offset");
    }
    
    void ShowPage_AudioLink() {
        ShowProperty("_ALOverride");
        ShowProperty("_ALAutomatic");
        ShowProperty("_ALMaximize");

        ShowProperty("_ALReactivePixel");
        ShowProperty("_ReactiveBandLows");
        ShowProperty("_ReactiveBandHighs");

        ShowProperty("_ALccZ1");
        ShowProperty("_BandZ1");
        ShowProperty("_ALccZ2");
        ShowProperty("_BandZ2");
        ShowProperty("_ALccZ3");
        ShowProperty("_BandZ3");
        ShowProperty("_ALccZ4");
        ShowProperty("_BandZ4");

        ShowProperty("_ALccG1");
        ShowProperty("_ALccG1StopA");
        ShowProperty("_ALccG1StopC");
        ShowProperty("_BandG1");
        ShowProperty("_BandG1Reverse");
        ShowProperty("_BandG1Length");

        ShowProperty("_ALccG2");
        ShowProperty("_ALccG2StopA");
        ShowProperty("_ALccG2StopC");
        ShowProperty("_BandG2");
        ShowProperty("_BandG2Reverse");
        ShowProperty("_BandG2Length");

        ShowProperty("_ALccG3");
        ShowProperty("_ALccG3StopA");
        ShowProperty("_ALccG3StopC");
        ShowProperty("_BandG3");
        ShowProperty("_BandG3Reverse");
        ShowProperty("_BandG3Length");
    }
    
    void ShowPage_ColorOverrides() {
        ShowProperty("_ColorOverrideZ1");
        ShowProperty("_ColourZ1");
        ShowProperty("_ColorOverrideZ2");
        ShowProperty("_ColourZ2");
        ShowProperty("_ColorOverrideZ3");
        ShowProperty("_ColourZ3");
        ShowProperty("_ColorOverrideZ4");
        ShowProperty("_ColourZ4");

        ShowProperty("_ColorOverrideG1");
        ShowProperty("_ColourG1StopA");
        ShowProperty("_ColourG1StopB");
        ShowProperty("_ColourG1StopC");
        ShowProperty("_ColorOverrideG2");
        ShowProperty("_ColourG2StopA");
        ShowProperty("_ColourG2StopB");
        ShowProperty("_ColourG2StopC");
        ShowProperty("_ColorOverrideG3");
        ShowProperty("_ColourG3StopA");
        ShowProperty("_ColourG3StopB");
        ShowProperty("_ColourG3StopC");
    }

    void ShowProperty(string name) {
        MaterialProperty _property = FindProperty(name, properties);
        editor.ShaderProperty(_property, _property.displayName);
    }
}
