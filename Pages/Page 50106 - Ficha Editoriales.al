page 50106 FichaEditoriales
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Editoriales;

    layout
    {
        area(Content)
        {
            group(GroupName)
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