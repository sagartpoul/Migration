PROMPT;
CLEAR BUFFER;
COLUMN SELECTED new_value SELECTION;
SET TERM off
PROMPT '&1' 
SELECT 
   CASE PROCESS_STATUS
		WHEN 'Y' THEN 'Continue'
		WHEN 'N' THEN 'Restart'
   END SELECTED 
FROM CSV_CONFIG WHERE STATUS='L';
SET TERM ON
-- execute the selected script
PROMPT ...calling the script : '&SELECTION'
@@'&1&SELECTION' '&1'

