#!/bin/sh

# Search PHP Mess Detector command
vendor_command="vendor/bin/phpmd"
system_command="phpmd"
local_command="phpmd.phar"

exec_command=""
if [ -f "$vendor_command" ]; then
  exec_command=$vendor_command
elif hash $system_command 2>/dev/null; then
  exec_command=$system_command
elif [ -f "$local_command" ]; then
  exec_command="php $local_command"
else
  echo -e "PHP Mess Detector command is not found."
  echo "Make sure that at least one of the following is available:"
  echo "* $vendor_command"
  echo "* $system_command"
  echo "* $local_command"
fi

report_param="$1"
ruleset_param="$2"
input_files="${@:3}"
command="${exec_command} ${input_files} ${report_param} ${ruleset_param}"

echo -e "Running command $command"
command_result=`eval $command`
exit "$?"
