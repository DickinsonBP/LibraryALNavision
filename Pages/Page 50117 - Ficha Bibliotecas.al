page 50117 FichaBibliotecas
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Biblioteca;

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
                field("Numero de libros"; Rec."Numero de libros")
                {
                    ApplicationArea = All;
                }
                field("Numero de Autores"; Rec."Numero de Autores")
                {
                    ApplicationArea = All;
                }
                field("Numero de Editoriales"; Rec."Numero de Editoriales")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(reporting)
        {
            group(Gen)
            {
                action("Insertar Libros")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        recLibros: Record Libros;
                    begin
                        if recLibros.FindFirst() then begin
                            repeat
                                recLibros.BibliotecaCodigo := rec.Codigo;
                                recLibros.Modify();
                            until recLibros.Next() = 0;
                        end;
                    end;
                }
                action("Insertar Autores")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        recLibros: Record Autores;
                    begin
                        if recLibros.FindFirst() then begin
                            repeat
                                recLibros.BibliotecaCodigo := rec.Codigo;
                                recLibros.Modify();
                            until recLibros.Next() = 0;
                        end;
                    end;
                }
                action("Insertar Editoriales")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        recLibros: Record Editoriales;
                    begin
                        if recLibros.FindFirst() then begin
                            repeat
                                recLibros.BibliotecaCodigo := rec.Codigo;
                                recLibros.Modify();
                            until recLibros.Next() = 0;
                        end;
                    end;
                }
            }
        }
    }
}