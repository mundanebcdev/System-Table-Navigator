codeunit 88000 SystemTablesInstall
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        SystemTables: Record "System Tables";
    begin
        if not SystemTables.IsEmpty() then
            exit;
        SystemTables.FillSystemTables();
    end;
}