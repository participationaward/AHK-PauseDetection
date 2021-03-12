#Include VA.ahk

DetectHiddenWindows On

getTidalHwnd() {
        WinGet, TidalHwnd, ID, ahk_exe TIDAL.exe
        Return TidalHwnd
}

IsAudioPlaying() {
        AudioLevel := 0.0
        VA_IAudioMeterInformation_GetPeakValue(VA_GetAudioMeter(), AudioLevel)
        return (Round(AudioLevel, 4) > 0)
}

Loop {
    Sleep, 1000
    if IsAudioPlaying() = 0
        {
            TidalHwnd := getTidalHwnd()
            ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_id %TidalHwnd% 
            SendEvent {Media_Play_Pause}, ahk_id %TidalHwnd%
        }
}