page 50118 "Custom Headline"
{
    PageType = HeadlinePart;
    //TODO: comprobar lo de los libros
    layout
    {
        area(Content)
        {
            field(HeadLine1; hdlTxt1)
            {
                trigger OnDrillDown()
                var
                    DrillDownURLTxt: Label 'https://github.com/DickinsonBP', Locked = True;
                begin
                    Hyperlink(DrillDownURLTxt)
                end;
            }
            field(HeadLine2; StrSubstNo(hdlTxt2, recBiblioteca."Numero de libros")) { ApplicationArea = All; }
            field(HeadLine3; StrSubstNo(hdlTxt3, recBiblioteca."Numero de autores")) { ApplicationArea = All; }
            field(HeadLine4; StrSubstNo(hdlTxt4, recBiblioteca."Numero de editoriales")) { ApplicationArea = All; }
        }
    }

    var
        hdlTxt1: Label 'HOLAAAAAAAAAAA';
        hdlTxt2: Label 'Numero de libros <emphasize>%1</emphasize>';
        hdlTxt3: Label 'Numero de autores <emphasize>%1</emphasize>';
        hdlTxt4: Label 'Numero de editoriales <emphasize>%1</emphasize>';
        recBiblioteca: Record Biblioteca;

    trigger OnOpenPage()
    begin
        recBiblioteca.Reset(); //Para quitar filtros, no hace falta
        recBiblioteca.FindSet(); //Coge todas las biblitecas
        //Recalcular los datos
        recBiblioteca.CalcFields("Numero de libros");
        recBiblioteca.CalcFields("Numero de autores");
        recBiblioteca.CalcFields("Numero de editoriales");
    end;

}