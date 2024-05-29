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
                part(Lines; SubpageLineasPrestamos)
                {
                    Caption = 'Lineas';
                    ApplicationArea = All;
                    Enabled = rec."Cod. Cliente" <> '';
                    SubPageLink = "Codigo Prestamo" = field(Codigo);
                }
                //TODO: Añadir part para poner precios totales calculados de los libros
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
                    recMovimientosPrestamos.Init();
                    recMovimientosPrestamos."No. Cliente" := rec."Cod. Cliente";

                    if recLineaPrestamo.Get(rec.Codigo) then begin
                        recMovimientosPrestamos."Cod. Libro" := recLineaPrestamo."Cod Libro";
                        recMovimientosPrestamos."Fecha inicio Prestamo" := recLineaPrestamo."Fecha inicio Prestamo";
                        recMovimientosPrestamos.Dias := recLineaPrestamo.Dias; //Se calcula la fecha de fin automaticamente en la tabla
                    end;
                    recMovimientosPrestamos.Insert(true, false);
                end;
            }
        }
    }
}