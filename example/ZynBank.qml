Widget {
    id: bank

    function doSearch()
    {
        $remote.action("/bank/search", bank_name.selected_val + " " + bank_type.selected)
    }

    function doLoad()
    {
        ins = ins_sel.selected_val
        $remote.action("/load_xiz", ins) if !ins.empty?
    }

    Widget {
        id: lhs
        SearchBox {
        }
        Widget {
            SelColumn {
                id: bank_name
                label:  "bank"
                skip:   true
                extern: "/bank/bank_list"
                whenValue: lambda { bank.doSearch }
            }
            SelColumn {
                id: bank_type
                label: "type"
                extern: "/bank/types"
                whenValue: lambda { bank.doSearch }
            }
            SelColumn {
                label: "tag"
            }
            function layout(l)
            {
                selfBox = l.genBox :widget, self

                rhs_box = children[0].layout l
                mid_box = children[1].layout l
                lhs_box = children[2].layout l

                l.contains(selfBox, rhs_box)
                l.contains(selfBox, mid_box)
                l.contains(selfBox, lhs_box)

                l.rightOf(rhs_box, mid_box)
                l.rightOf(mid_box, lhs_box)
                l.sheq([rhs_box.w, selfBox.w], [1.0, -0.3], 0)
                l.sheq([mid_box.w, selfBox.w], [1.0, -0.3], 0)

                selfBox
            }
        }

        function layout(l)
        {
            selfBox = l.genBox :widget, self

            search  = children[0].layout l
            content = children[1].layout l

            l.fixed(search,  selfBox, 0, 0.00, 1, 0.05)
            l.fixed(content, selfBox, 0, 0.05, 1, 0.95)

            selfBox
        }
    }
    Widget {
        id: rhs
        SelColumn {
            id: ins_sel
            extern: "/bank/search_results"
            label: "preset"
            number: true
            skip:   true
            whenValue: lambda {bank.doLoad}
        }
        Widget {
            id: info_box
            Group {
                label: "author"
            }
            Group {
                label: "comments"
                TextEdit {}
            }

            function layout(l)
            {
                selfBox = l.genBox :widget, self

                author  = children[0].layout l
                comment = children[1].layout l

                l.fixed(author,  selfBox, 0, 0.00, 1, 0.35)
                l.fixed(comment, selfBox, 0, 0.35, 1, 0.65)

                selfBox
            }
        }
        function draw(vg)
        {
            background color("123456")
        }

        function layout(l)
        {
            selfBox = l.genBox :widget, self

            rhs_box = children[0].layout l
            lhs_box = children[1].layout l
            l.contains(selfBox, rhs_box)
            l.contains(selfBox, lhs_box)

            l.rightOf(rhs_box, lhs_box)
            l.sheq([rhs_box.w, selfBox.w], [1.0, -0.5], 0)

            selfBox
        }
    }
    function layout(l)
    {
        selfBox = l.genBox :bank, self
        rhs_box = rhs.layout l
        lhs_box = lhs.layout l
        l.contains(selfBox, rhs_box)
        l.contains(selfBox, lhs_box)

        l.rightOf(lhs_box, rhs_box)
        l.sheq([rhs_box.w, selfBox.w], [1.0, -0.5], 0)

        selfBox
    }
}