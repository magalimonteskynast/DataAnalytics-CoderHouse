let
    Origen = Excel.Workbook(File.Contents("C:\Users\Lenovo\Downloads\Budget_vs_Actual_Data.xlsx"), null, true),
    Sheet1_Sheet = Origen{[Item="Sheet1",Kind="Sheet"]}[Data],
    #"Encabezados promovidos" = Table.PromoteHeaders(Sheet1_Sheet, [PromoteAllScalars=true]),
    #"Tipado de datos" = Table.TransformColumnTypes(#"Encabezados promovidos",{{"Date", type date}, {"Department", type text}, {"Category", type text}, {"Region", type text}, {"Budget Amount", Currency.Type}, {"Actual Amount", Currency.Type}, {"Payment Method", type text}, {"Transaction ID", type text}}),
    #"Duplicados quitados columna ID_Transaccion" = Table.Distinct(#"Tipado de datos", {"Transaction ID"}),
    #"Eliminar NULL de Department por S/R" = Table.ReplaceValue(#"Duplicados quitados columna ID_Transaccion",null,"S/R",Replacer.ReplaceValue,{"Department"}),
    #"Eliminar NULL de Category por S/R" = Table.ReplaceValue(#"Eliminar NULL de Department por S/R",null,"S/R",Replacer.ReplaceValue,{"Category"}),
    #"Eliminar NULL de Region por S/R" = Table.ReplaceValue(#"Eliminar NULL de Category por S/R",null,"S/R",Replacer.ReplaceValue,{"Region"}),
    #"Se reemplaza NULL en ID_Transaccion" = Table.ReplaceValue(#"Eliminar NULL de Region por S/R",null,"TXN99999",Replacer.ReplaceValue,{"Transaction ID"}),
    // El paso siguiente lo que hace es modificar el nombre de las columnas tomando como base el paso anterior que es "Se reemplaza NULL en ID_Transaccion", el paso MiTransformaciónManual utiliza la función Table.RenameColumns poniendo entre llaves {} el nombre original y luego el nombre que se utilizará separados por comas.A su vez, utiliza una coma para separar cada juego de {} que representa el cambio de nombre de una columna.
    MiTransformaciónManual = Table.RenameColumns(#"Se reemplaza NULL en ID_Transaccion",{{"Date", "fecha"}, {"Department", "departamento"}, {"Category", "categoria"}, {"Region", "region"}, {"Budget Amount", "monto_presupuesto"}, {"Actual Amount", "monto_actual"}, {"Payment Method", "metodo_pago"}, {"Transaction ID", "ID_transaccion"}}),
    #"Se filtra el departamento filtrando por Marketing" = Table.SelectRows(MiTransformaciónManual, each ([departamento] = "Marketing"))
in
    #"Se filtra el departamento filtrando por Marketing"
