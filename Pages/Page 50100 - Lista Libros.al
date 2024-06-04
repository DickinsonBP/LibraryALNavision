page 50100 "Lista de Libros"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Libros;
    CardPageId = FichaLibros;

    layout
    {
        area(Content)
        {
            repeater(Reapeater)
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;

                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
                field("Descripcion 2"; Rec."Descripcion 2")
                {
                    ApplicationArea = All;
                }
                field(Tematica; Rec.Tematica)
                {
                    ApplicationArea = All;
                }
                field("Fecha de alta"; Rec."Fecha de alta")
                {
                    ApplicationArea = All;
                }
                field("Fecha ult. modificacion"; Rec."Fecha ult. modificacion")
                {
                    ApplicationArea = All;
                }
                field("Año Publicacion"; Rec."Año Publicacion")
                {
                    ApplicationArea = All;
                }
                field(Autor; Rec.Autor)
                {
                    ApplicationArea = All;
                }
                field(Editorial; Rec.Editorial)
                {
                    ApplicationArea = All;
                }
                field(Paginas; Rec.Paginas)
                {
                    ApplicationArea = All;
                }
                field("Importe PVP"; Rec."Importe PVP")
                {
                    ApplicationArea = All;
                }
                field("Cod. Producto"; Rec."Cod. Producto")
                {
                    ApplicationArea = All;
                }
                field(Edad; Rec.Edad)
                {
                    ApplicationArea = All;
                    ToolTip = 'Años desde el primer año de publicación';
                }
                field(Usuario; Rec.Usuario)
                {
                    ApplicationArea = All;
                }
                field("Descripcion Producto"; Rec."Descripcion Producto")
                {
                    ApplicationArea = All;
                }
                field("calc Descripcion producto"; Rec."calc Descripcion producto")
                {
                    ApplicationArea = All;
                }
                field(BibliotecaCodigo; Rec.BibliotecaCodigo)
                {
                    Caption = 'Codigo de la biblioteca';
                    ApplicationArea = All;
                }

            }
            group(Prestamos)
            {
                ShowCaption = false;
                part(Libros; SubpageMovimientosPrestamos)
                {
                    Caption = 'Prestamos';
                    ApplicationArea = All;
                    SubPageLink = "Cod. Libro" = field(Codigo);
                }
            }
        }
    }
}