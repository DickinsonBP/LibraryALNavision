page 50114 FichaPrestamos
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Cabecera Prestamos";

    layout
    {
        area(Content)
        {
            group("Cabecera prestamo")
            {
                field(Codigo; Rec."Codigo")
                {
                    ApplicationArea = All;
                }
                field("Cod. Cliente"; Rec."Cod. Cliente")
                {
                    ApplicationArea = All;

                }
                field("Nombre Cliente"; Rec."Nombre Cliente")
                {
                    ApplicationArea = All;
                }
                field("Telefono cliente"; Rec."Telefono cliente")
                {
                    ApplicationArea = All;
                }
                field("Fecha Venta"; Rec."Fecha Venta")
                {
                    ApplicationArea = All;
                }
                field("Nº Serie"; Rec."Nº Serie")
                {
                    ApplicationArea = All;
                }
                field(Registrado; Rec.Registrado)
                {
                    ApplicationArea = All;
                }

            }
            group("Lineas")
            {
                ShowCaption = false;
                part(Lines; SubpageLineasPrestamos)
                {
                    Caption = 'Lineas';
                    ApplicationArea = All;
                    Enabled = rec."Cod. Cliente" <> '';
                    SubPageLink = "Codigo Prestamo" = field(Codigo);
                }
            }
            group(ControlAmount)
            {
                ShowCaption = false;
                field("Subtotal excl. IVA"; Rec.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Subtotal excl. IVA';
                    ToolTip = 'Especifica la suma de los totales de cada linea excluyendo el IVA';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Registrar")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    recMovimientosPrestamos: Record "Movimientos Prestamos Libros";
                    recLineaPrestamo: Record LineasPrestamos;
                begin
                    rec.Registrado := true;

                    recLineaPrestamo.SetRange("Codigo Prestamo", rec.Codigo);
                    if recLineaPrestamo.FindFirst() then begin
                        repeat
                            recMovimientosPrestamos.Init();
                            recMovimientosPrestamos."Cod. Prestamo" := rec.Codigo;
                            recMovimientosPrestamos."No. Cliente" := rec."Cod. Cliente";
                            recMovimientosPrestamos."Cod. Libro" := recLineaPrestamo."Cod Libro";
                            recMovimientosPrestamos."Fecha inicio Prestamo" := recLineaPrestamo."Fecha inicio Prestamo";
                            recMovimientosPrestamos.Dias := recLineaPrestamo.Dias;
                            recMovimientosPrestamos.Insert(true, false);
                        until recLineaPrestamo.Next() = 0;
                    end;
                end;
            }
        }
    }
}