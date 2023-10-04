permissionset 88000 "System Tables Nav"
{
    Assignable = true;
    Permissions = tabledata "System Tables" = RIMD,
        table "System Tables" = X,
        page "All Control Fields" = X,
        page Date = X,
        page Fields = X,
        page Keys = X,
        page "Report Data Items" = X,
        page "System Tables" = X,
        page "Table Relations Metadata" = X,
        codeunit SystemTablesInstall = X,
        page "Page Actions" = X;
}