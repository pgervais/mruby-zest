Group {
    id: port
    label: "portamento"
    copyable: false
    ParModuleRow {
        ToggleButton { extern: port.extern+"portamento.receive"}
        ToggleButton { extern: port.extern+"portamento.pitchthreshtype"}
        Knob   { extern: port.extern+"portamento.pitchthresh"}
        Knob   { extern: port.extern+"portamento.time"}
        Knob   { extern: port.extern+"portamento.updowntimestretch"}
    }
    ParModuleRow {
        ToggleButton { extern: port.extern+"portamento.proportional"}
        Knob   { extern: port.extern+"portamento.propRate"}
        Knob   { extern: port.extern+"portamento.propDepth"}
    }
}
