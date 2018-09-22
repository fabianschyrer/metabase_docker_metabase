#!/bin/bash

# Create Encryption Key on Docker Host and write to TXT file
echo
echo "*** Creating Encryption Key and writing Encryption Key to environment file"
openssl rand -base64 64 > MB_ENCRYPTION_SECRET_KEY.txt

# Format text in TXT file and copy Encryption Key to Environment Variable file
{ echo -n 'MB_ENCRYPTION_SECRET_KEY='; cat MB_ENCRYPTION_SECRET_KEY.txt; } > MB_ENCRYPTION_SECRET_KEY.txt.new
mv MB_ENCRYPTION_SECRET_KEY.txt{.new,}
perl -p -i -e 's/\R//g;' MB_ENCRYPTION_SECRET_KEY.txt
sed -f replace.sed metabase-env.list.template > metabase-env.list

# Remove TXT File to meet security standard
rm MB_ENCRYPTION_SECRET_KEY.txt
echo
echo "*** Metabase Database Connection Details Encryption at REST has been successfully configured"