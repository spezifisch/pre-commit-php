#!/bin/sh

# Set PHP Mess Detector command candidates
vendor_command="vendor/bin/phpmd"
system_command="phpmd"
local_command="phpmd.phar"

# Search PHP Mess Detector command
exec_command=""
if [ -f "$vendor_command" ]; then
  exec_command=$vendor_command
elif hash $system_command 2>/dev/null; then
  exec_command=$system_command
elif [ -f "$local_command" ]; then
  exec_command="php $local_command"
else
  echo -e "PHP Mess Detector executable is not found and at least one of the following executables is required:"
  echo "  * $vendor_command"
  echo "  * $system_command"
  echo "  * $local_command"
fi

# Collect input filenames and parameters
report_param="$1"
ruleset_param="$2"
input_files="${@:3}"

# Run PHP Mess Detector on each input file
error_occurred=0
for input_file in ${input_files[@]}; do
  "${exec_command}" "${input_file}" ${report_param} "${ruleset_param}"
  if [ $? -ne 0 ]; then
    error_occurred=1
    echo "Holy"
  fi
done
exit $error_occurred
