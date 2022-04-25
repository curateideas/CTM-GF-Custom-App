codeunit 50003 "SHSelltoCustEntered CTMGFPte"
{
    SingleInstance = true;

    internal procedure SetSellToCustFirstEntered(NewSellToCustFirstEntered: Boolean)
    begin
        SellToCustFirstEntered := NewSellToCustFirstEntered;
    end;

    internal procedure GetSellToCustFirstEntered(var CurrentSellToCustFirstEntered: Boolean)
    begin
        CurrentSellToCustFirstEntered := SellToCustFirstEntered;
    end;

    var
        SellToCustFirstEntered: Boolean;
}