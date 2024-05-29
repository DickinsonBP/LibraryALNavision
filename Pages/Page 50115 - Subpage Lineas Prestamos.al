page 50115 SubpageLineasPrestamos
{
    Caption = 'Lineas';
    PageType = ListPart;
    UsageCategory = Administration;
    SourceTable = LineasPrestamos;

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
                // field("Num. linea"; Rec."Num. linea")
                // {
                //     ApplicationArea = All;
                // }
                field("Cod Libro"; Rec."Cod Libro")
                {
                    ApplicationArea = All;
                }
                field("Descripcion libro"; Rec."Descripcion libro")
                {
                    ApplicationArea = All;
                }
                field("Fecha inicio Prestamo"; Rec."Fecha inicio Prestamo")
                {
                    ApplicationArea = All;
                }
                field("No. Cliente"; Rec."No. Cliente")
                {
                    ApplicationArea = All;
                }
                field("Nombre Cliente"; Rec."Nombre Cliente")
                {
                    ApplicationArea = All;
                }
                field("Direccion Cliente"; Rec."Direccion Cliente")
                {
                    ApplicationArea = All;
                }
                field("Poblacion Cliente"; Rec."Poblacion Cliente")
                {
                    ApplicationArea = All;
                }
                field("Telefono Cliente"; Rec."Telefono Cliente")
                {
                    ApplicationArea = All;
                }
                field(Dias; Rec.Dias)
                {
                    ApplicationArea = All;
                }
                field("Fecha fin"; Rec."Fecha fin")
                {
                    ApplicationArea = All;
                }
                field(Precio; Rec.Precio)
                {
                    ApplicationArea = All;
                }
                field(Importe; Rec.Importe)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}