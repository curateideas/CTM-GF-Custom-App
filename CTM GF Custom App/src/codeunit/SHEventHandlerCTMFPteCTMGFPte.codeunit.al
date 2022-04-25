codeunit 50002 "SHEventHandler CTMFPteCTMGFPte"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeValidateEvent', 'Sell-to Customer No.', true, true)]
    local procedure SalesHeaderOnBeforeValidateEvent(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        SHSaveSellToCustEntCTMGFPte: Codeunit "SHSaveSellToCustEnt. CTMGFPte";
    begin
        SHSaveSellToCustEntCTMGFPte.SalesHeaderSaveSellToCustFirstEntered(Rec, xRec);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeSalesLineInsert', '', true, true)]
    local procedure SalesHeaderOnBeforeSalesLineInsert(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        SLReUseUnitPriceMethCTMGFPte: Codeunit "SLReUseUnitPrice Meth CTMGFPte";
    begin
        SLReUseUnitPriceMethCTMGFPte.RecreateSalesLinesReUseUnitPrice(SalesLine, TempSalesLine);
    end;
}