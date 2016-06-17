Widget {
    layer: 1
    property Array data: nil;
    property Bool  normal: true
    property Float pad:   1/32

    function class_name() { "DataView" }

    function draw(vg)
    {
        pad2 = (1-2*pad)
        box = Rect.new(w*pad, h*pad, w*pad2, h*pad2)

        if(data)
            Draw::WaveForm::plot(vg, self.data, box, normal)
        else
            Draw::WaveForm::sin(vg, box)
        end
    }
} 
