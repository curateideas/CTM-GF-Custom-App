codeunit 98000 "Simple Tests CTMGFPte"
{
    Subtype = Test;

    [Test]
    procedure OnPostSalesOrderNoErrorOccurs()
    var
        SalesHeader: Record "Sales Header";

    begin
        //[GIVEN] A Sales Order
        LibrarySales.CreateSalesOrder(SalesHeader);
        //[WHEN] Posting the Order
        LibrarySales.PostSalesDocument(SalesHeader, true, true);
        //[THEN] No Error occurs
    end;

    var
        LibrarySales: codeunit "Library - Sales";


}

