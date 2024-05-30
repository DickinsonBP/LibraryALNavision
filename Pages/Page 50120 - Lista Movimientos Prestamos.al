page 50120 "Lista Movimientos Prestamos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Movimientos Prestamos Libros";

    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field("Cod. Prestamo"; rec."Cod. Prestamo")
                {
                    ApplicationArea = All;
                }
                field("Cod. Libro"; Rec."Cod. Libro")
                {
                    ApplicationArea = All;
                }
                field("Descripcion Libro"; Rec."Descripcion Libro")
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