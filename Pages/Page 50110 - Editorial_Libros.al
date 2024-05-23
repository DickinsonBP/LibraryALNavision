page 50110 EditorialLibros
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Editoriales;
    CardPageId = FichaEditoriales;

    layout
    {
        area(Content)
        {
            repeater(Repeater)
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;

                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
            }
            group(Relaciones)
            {
                part(Libros; SubpageLibros)
                {
                    Caption = 'Libros';
                    ApplicationArea = All;
                    SubPageLink = Autor = field(Codigo);
                }
            }
        }

    }
}