scriptPath=$PWD

. ./SetupEnvironment.sh

OUTPUT_DIR="$outputPath"/"$version/Incremental"
if [ ! -d "$OUTPUT_DIR" ]; then

	mkdir -p "$OUTPUT_DIR"
fi


FILE="$scriptPath/Scripts/UpdateDDL.sql"
OUTPUT_FILE="$OUTPUT_DIR/UpdateDDL.txt"


if [ -f "$FILE" ]; then
export PGPASSWORD=$PASSWORD
psql -h $host -p $port -d $databaseUser -U $databaseUser -1 -v ON_ERROR_STOP=1 -a -f "$FILE" -L "$OUTPUT_FILE"
fi

status=$?
if [ $status -gt 0 ];then
echo "Error occurred. Exiting script execution."
exit 1
fi



FILE="$scriptPath/Scripts/DefaultData.sql"
OUTPUT_FILE="$OUTPUT_DIR/DefaultData.txt"


if [ -f "$FILE" ]; then
export PGPASSWORD=$PASSWORD
psql -h $host -p $port -d $databaseUser -U $databaseUser -1 -v ON_ERROR_STOP=1 -a -f "$FILE" -L "$OUTPUT_FILE"
fi

status=$?
if [ $status -gt 0 ];then
echo "Error occurred. Exiting script execution."
exit 1
fi


FILE="$scriptPath/Scripts/StoredProceduresAndFunctions.sql"
OUTPUT_FILE="$OUTPUT_DIR/StoredProceduresAndFunctions.txt"


if [ -f "$FILE" ]; then
export PGPASSWORD=$PASSWORD
psql -h $host -p $port -d $databaseUser -U $databaseUser -1 -v ON_ERROR_STOP=1 -a -f "$FILE" -L "$OUTPUT_FILE"
fi

status=$?
if [ $status -gt 0 ];then
echo "Error occurred. Exiting script execution."
exit 1
fi



FILE="$scriptPath/Scripts/Views.sql"
OUTPUT_FILE="$OUTPUT_DIR/Views.txt"


if [ -f "$FILE" ]; then
export PGPASSWORD=$PASSWORD
psql -h $host -p $port -d $databaseUser -U $databaseUser -1 -v ON_ERROR_STOP=1 -a -f "$FILE" -L "$OUTPUT_FILE"
fi

status=$?
if [ $status -gt 0 ];then
echo "Error occurred. Exiting script execution."
exit 1
fi




