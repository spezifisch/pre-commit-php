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

echo "$@"
echo "$1"
echo "$2"

command_inputs="${@:2}"
command_params="$1"
command_line="${exec_command} ${command_inputs} ${command_params}"

echo -e "Running command $command_line"
command_result=`eval $command_line`
exit "$?"
