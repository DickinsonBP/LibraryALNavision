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
                Enabled = NOT rec.Registrado;
                field(Codigo; Rec."Codigo")
                {
                    ApplicationArea = All;
                }
                field("Cod. Cliente"; Rec."Cod. Cliente")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
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
                Enabled = (rec."Cod. Cliente" <> '') AND (NOT rec.Registrado);
                ShowCaption = false;
                part(Lines; SubpageLineasPrestamos)
                {
                    ApplicationArea = All;
                    SubPageLink = "Codigo Prestamo" = field(Codigo);
                }
            }
            group(ControlAmount)
            {
                Enabled = NOT rec.Registrado;
                ShowCaption = false;
                field("Subtotal excl. IVA"; Rec.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Subtotal excl. IVA';
                    ToolTip = 'Especifica la suma de los totales de cada linea excluyendo el IVA';
                }
                /**
                TODO: Calcular IVA a partir del codigo del producto.
                Se puede obtener el tipo de IVA a partir del codigo de producto ya que la tabla 27 Item ya que tiene el campo field(99; "VAT Prod. Posting Group"; Code[20])
                pero falta relacionarlo con la siguiente tabla.
                */
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Registrar")
            {
                // Enabled = (NOT rec.Registrado) AND (rec."Cod. Cliente" <> '');
                ApplicationArea = All;
                trigger OnAction()
                var
                    recMovimientosPrestamos: Record "Movimientos Prestamos Libros";
                    recLineaPrestamo: Record LineasPrestamos;
                begin
                    if rec.Registrado = false then begin
                        if rec."Cod. Cliente" = '' then begin
                            Error('Asigna un codigo de cliente antes de registrar');
                        end;

                        recLineaPrestamo.SetRange("Codigo Prestamo", rec.Codigo);
                        if recLineaPrestamo.FindFirst() then begin
                            repeat
                                if recLineaPrestamo."Cod Libro" = '' then begin
                                    Error(StrSubstNo('La línea %1 no tiene código de libro. Asigna un codigo de libro antes de poder registrar', recLineaPrestamo."Num. linea"));
                                end;
                                if recLineaPrestamo.Dias = 0 then begin
                                    Error(StrSubstNo('La línea %1 no tiene dias asignados para el prestamo, por favor revisala.', recLineaPrestamo."Num. linea"));
                                end;

                                recMovimientosPrestamos.Init();
                                recMovimientosPrestamos."Cod. Prestamo" := rec.Codigo;
                                recMovimientosPrestamos."No. Cliente" := rec."Cod. Cliente";
                                recMovimientosPrestamos."Cod. Libro" := recLineaPrestamo."Cod Libro";
                                recMovimientosPrestamos."Fecha inicio Prestamo" := recLineaPrestamo."Fecha inicio Prestamo";
                                recMovimientosPrestamos.Dias := recLineaPrestamo.Dias;
                                recMovimientosPrestamos.Insert(true, false);

                            until recLineaPrestamo.Next() = 0;
                            rec.Registrado := true;

                        end;
                    end;
                end;
            }
        }
    }
}