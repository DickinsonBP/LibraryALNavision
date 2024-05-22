page 50105 "Lista de Editoriales"
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
                field(Correo; Rec.Correo)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}