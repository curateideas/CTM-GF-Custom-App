codeunit 50004 "SHSaveSellToCustEnt. CTMGFPte"
{
    internal procedure SalesHeaderSaveSellToCustFirstEntered(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header")
    var
        Handled: Boolean;
    begin
        OnBeforeSalesHeaderSaveSellToCustFirstEntered(SalesHeader, xSalesHeader, Handled);

        DoSalesHeaderSaveSellToCustFirstEntered(SalesHeader, xSalesHeader, Handled);

        OnAfterSalesHeaderSaveSellToCustFirstEntered(SalesHeader, xSalesHeader);
    end;

    local procedure DoSalesHeaderSaveSellToCustFirstEntered(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header"; Handled: Boolean);
    var
        SHSelltoCustEnteredCTMGFPte: Codeunit "SHSelltoCustEntered CTMGFPte";
    begin
        if Handled then
            exit;
        if (SalesHeader."Sell-to Customer No." <> xSalesHeader."Sell-to Customer No.") and
            (xSalesHeader."Sell-to Customer No." = '') then
            SHSelltoCustEnteredCTMGFPte.SetSellToCustFirstEntered(true)
        else
            SHSelltoCustEnteredCTMGFPte.SetSellToCustFirstEntered(false);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSalesHeaderSaveSellToCustFirstEntered(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSalesHeaderSaveSellToCustFirstEntered(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header");
    begin
    end;
}