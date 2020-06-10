set scriptsPath=%~dp0

call "%scriptsPath%\SetupEnvironment.bat"


IF NOT EXIST "%outputPath%\%version%\Incremental" (
	mkdir "%outputPath%\%version%\Incremental"
)

IF EXIST "%scriptsPath%/Scripts/UpdateDDL.sql" (
	psql -h %host% -p %port% -d %databaseName% -U %databaseUser% -1 -v ON_ERROR_STOP=1 -f "%scriptsPath%/Scripts/UpdateDDL.sql" -L %outputPath%%version%/Incremental/UpdateDDL_Output.txt
)

IF EXIST "%scriptsPath%/Scripts/DropCreateTables.sql" (
	psql -h %host% -p %port% -d %databaseName% -U %databaseUser% -1 -v ON_ERROR_STOP=1 -f "%scriptsPath%/Scripts/DropCreateTables.sql" -L %outputPath%%version%/Incremental/DropCreatetables_Output.txt
)

IF EXIST "%scriptsPath%/Scripts/DefaultData.sql" (
	psql -h %host% -p %port% -d %databaseName% -U %databaseUser% -1 -v ON_ERROR_STOP=1 -f "%scriptsPath%/Scripts/DefaultData.sql" -L %outputPath%%version%/Incremental/DefaultData_Output.txt
)
IF EXIST "%scriptsPath%/Scripts/StoredProceduresAndFunctions.sql" (
	psql -h %host% -p %port% -d %databaseName% -U %databaseUser% -1 -v ON_ERROR_STOP=1 -f "%scriptsPath%/Scripts/StoredProceduresAndFunctions.sql" -L %outputPath%%version%/Incremental/StoredProceduresAndFunctions_Output.txt
)
IF EXIST "%scriptsPath%/Scripts/Views.sql" (
	psql -h %host% -p %port% -d %databaseName% -U %databaseUser% -1 -v ON_ERROR_STOP=1 -f "%scriptsPath%/Scripts/Views.sql" -L %outputPath%%version%/Incremental/Views_Output.txt
)

