pageextension 50101 "Chart of Accounts.ionMsr" extends "Chart of Accounts"
{
    layout
    {
 
    }
 
    actions
    {
        addafter("&Balance")
        {
            action("Cambio a 8 digitos")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Action;
 
                trigger OnAction()
                var
                    recAccount: Record "G/L Account";
                    recAccountRename: Record "G/L Account";
                    newCode: Code[20];
                    dlgWin: dialog;
                begin
                    if (Confirm('1/3 Está seguro? Se cambiarán todas las cuentas contables?')) then begin
                        if (Confirm('2 / 3 Seguro?')) then begin
                            if Confirm('3 / 3 Seguro?') then begin
                                dlgWin.open('Procesando #1##########');
                                recAccount.Reset();
                                CurrPage.SetSelectionFilter(recAccount);
                                recAccount.SetRange("Account Type", recAccount."Account Type"::Posting);
                                if (recAccount.FindFirst()) then begin
                                    repeat
                                        dlgWin.update(1, recAccount."No.");
                                        newCode := '0';
                                        if (recAccountRename.Get(recAccount."No.")) then begin
                                            if (StrLen(recAccountRename."No.") = 7) then begin
                                                newCode := InsStr(recAccountRename."No.", '0', 5);
                                                recAccountRename.Rename(newCode);
                                            end;
                                        end;
                                    until (recAccount.Next() = 0)
                                end;
                                dlgWin.close;
                            end;
                        end;
                    end;
                end;
            }
 
            action("Asignar categorias cuenta")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Action;
 
                trigger OnAction()
                var
                    recAccount: Record "G/L Account";
                    recAccountRename: Record "G/L Account";
                    newCode: Code[20];
                    dlgWin: dialog;
                    control: Boolean;
                begin
                    if (Confirm('1/3 Está seguro? Se cambiarán todas las cuentas contables?')) then begin
                        if (Confirm('2 / 3 Seguro?')) then begin
                            if Confirm('3 / 3 Seguro?') then begin
                                dlgWin.open('Procesando #1##########');
                                recAccount.Reset();
                                CurrPage.SetSelectionFilter(recAccount);
                                recAccount.SetRange("No.");
                                if (recAccount.FindFirst()) then begin
                                    repeat
                                        if recAccount."Account Type" = Enum::"G/L Account Type".FromInteger(0) then begin
                                            newCode := DelStr(recAccount."No.", StrLen(recAccount."No."));
                                            control := false;
                                            repeat
                                                if (recAccountRename.Get(newCode)) then begin
                                                    if (recAccountRename."Account Type" = Enum::"G/L Account Type".FromInteger(1)) then begin
                                                        recAccount."Account Category" := recAccountRename."Account Category";
                                                        recAccount.Modify();
                                                        control := true;
                                                    end;
                                                end
                                                else begin
                                                    newCode := DelStr(newCode, StrLen(newCode));
                                                end;
                                            until (control = true)
                                        end;
                                    until (recAccount.Next() = 0)
                                end;
                            end;
                        end;
                    end;
                end;
            }
        }
    }
}