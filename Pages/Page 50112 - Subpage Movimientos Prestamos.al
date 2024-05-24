page 50112 SubpageMovimientosPrestamos
{
    PageType = ListPart;
    // ApplicationArea = All;
    SourceTable = "Prestamos Libros";
    CardPageId = FichaPrestamos;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field("Cod. Libro"; Rec."Cod. Libro")
                {
                    ApplicationArea = All;

                }
                field("Num. Prestamo"; Rec."Num. Prestamo")
                {
                    ApplicationArea = All;
                }
                field("Descripcion Libro"; Rec."Descripcion Libro")
                {
                    ApplicationArea = All;
                }
                field("Fecha inicio Prestamo"; Rec."Fecha inicio Prestamo")
                {
                    ApplicationArea = All;
                }
                field("Fecha fin"; Rec."Fecha fin")
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