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
            case 4: ShowPage_DMXControl();     break;
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
        MaterialProperty _ALThemes = FindProperty("_ALThemes", properties);
        editor.ShaderProperty(_ALThemes, _ALThemes.displayName);

        ShowProperty("_ALReactivePixel");
        ShowProperty("_ReactiveBandLows");
        ShowProperty("_ReactiveBandHighs");

        if (_ALThemes.floatValue == 0)
            ShowProperty("_ALccZ1");
        else
            ShowProperty("_ALttZ1");
        ShowProperty("_BandZ1");
        if (_ALThemes.floatValue == 0)
            ShowProperty("_ALccZ2");
        else
            ShowProperty("_ALttZ2");
        ShowProperty("_BandZ2");
        if (_ALThemes.floatValue == 0)
            ShowProperty("_ALccZ3");
        else
            ShowProperty("_ALttZ3");
        ShowProperty("_BandZ3");
        if (_ALThemes.floatValue == 0)
            ShowProperty("_ALccZ4");
        else
            ShowProperty("_ALttZ4");
        ShowProperty("_BandZ4");

        ShowProperty("_ALccG1");
        if (_ALThemes.floatValue == 0)  {
            ShowProperty("_ALccG1StopA");
            ShowProperty("_ALccG1StopC");
        }
        else {
            ShowProperty("_ALttG1StopA");
            ShowProperty("_ALttG1StopC");
        }
        ShowProperty("_BandG1");
        ShowProperty("_BandG1Reverse");
        ShowProperty("_BandG1Length");

        ShowProperty("_ALccG2");
        if (_ALThemes.floatValue == 0)  {
            ShowProperty("_ALccG2StopA");
            ShowProperty("_ALccG2StopC");
        }
        else {
            ShowProperty("_ALttG2StopA");
            ShowProperty("_ALttG2StopC");
        }
        ShowProperty("_BandG2");
        ShowProperty("_BandG2Reverse");
        ShowProperty("_BandG2Length");

        ShowProperty("_ALccG3");
        if (_ALThemes.floatValue == 0)  {
            ShowProperty("_ALccG3StopA");
            ShowProperty("_ALccG3StopC");
        }
        else {
            ShowProperty("_ALttG3StopA");
            ShowProperty("_ALttG3StopC");
        }
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
    
    void ShowPage_DMXControl() {
        ShowProperty("_DMXEnable");
        ShowProperty("_DMXFixtureID");
        ShowProperty("_DMXTex");

        ShowProperty("_DMXintZ1");
        ShowProperty("_DMXintZ2");
        ShowProperty("_DMXintZ3");
        ShowProperty("_DMXintZ4");
        ShowProperty("_DMXintG1");
        ShowProperty("_DMXintG2");
        ShowProperty("_DMXintG3");
        
        ShowProperty("_DMXstrobe");

        ShowProperty("_DMXccZ1Enable");
        ShowProperty("_DMXccZ1");
        ShowProperty("_DMXccZ2Enable");
        ShowProperty("_DMXccZ2");
        ShowProperty("_DMXccZ3Enable");
        ShowProperty("_DMXccZ3");
        ShowProperty("_DMXccZ4Enable");
        ShowProperty("_DMXccZ4");
        ShowProperty("_DMXccG1Enable");
        ShowProperty("_DMXccG1StopA");
        ShowProperty("_DMXccG1StopC");
        ShowProperty("_DMXccG2Enable");
        ShowProperty("_DMXccG2StopA");
        ShowProperty("_DMXccG2StopC");
        ShowProperty("_DMXccG3Enable");
        ShowProperty("_DMXccG3StopA");
        ShowProperty("_DMXccG3StopC");
    }

    void ShowProperty(string name) {
        MaterialProperty _property = FindProperty(name, properties);
        editor.ShaderProperty(_property, _property.displayName);
    }
}
