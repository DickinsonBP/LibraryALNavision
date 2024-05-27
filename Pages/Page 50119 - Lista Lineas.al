page 50119 "Lista Lineas"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LineasPrestamos;
    CardPageId = SubpageLineasPrestamos;

    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field("Codigo Prestamo"; Rec."Codigo Prestamo")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}