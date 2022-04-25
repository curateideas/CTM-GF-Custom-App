codeunit 50001 "SLReUseUnitPrice Meth CTMGFPte"
{
    internal procedure RecreateSalesLinesReUseUnitPrice(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line");
    var
        Handled: Boolean;
    begin
        OnBeforeRecreateSalesLinesReUseUnitPrice(SalesLine, TempSalesLine, Handled);

        DoRecreateSalesLinesReUseUnitPrice(SalesLine, TempSalesLine, Handled);

        OnAfterRecreateSalesLinesReUseUnitPrice(SalesLine, TempSalesLine);
    end;

    local procedure DoRecreateSalesLinesReUseUnitPrice(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line"; Handled: Boolean);
    var
        SHSelltoCustEnteredCTMGFPte: Codeunit "SHSelltoCustEntered CTMGFPte";
        SellToCustomerFirstEntered: Boolean;
    begin
        if Handled then
            exit;

        SHSelltoCustEnteredCTMGFPte.GetSellToCustFirstEntered(SellToCustomerFirstEntered);

        if not SellToCustomerFirstEntered then
            exit;

        if SalesLine."Document Type" = SalesLine."Document Type"::Quote then
            SalesLine.Validate("Unit Price", TempSalesLine."Unit Price");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRecreateSalesLinesReUseUnitPrice(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRecreateSalesLinesReUseUnitPrice(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line");
    begin
    end;
}