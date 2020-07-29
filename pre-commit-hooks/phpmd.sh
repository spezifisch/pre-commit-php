#!/bin/sh

color_green="\033[0;32m"
color_red="\033[0;31m"
color_reset="\033[0m"

# Set PHP Mess Detector candidates
vendor_command="vendor/bin/phpmd"
system_command="phpmd"
phar_command="phpmd.phar"

# Search PHP Mess Detector
exec_command=""
if [ -f "$vendor_command" ]; then
  exec_command=$vendor_command
elif hash $system_command 2>/dev/null; then
  exec_command=$system_command
elif [ -f "$local_command" ]; then
  exec_command="php $phar_command"
else
  echo "${color_red}PHP Mess Detector is not found.${color_reset}"
  echo "At least one of the following is required: $vendor_command, $system_command, or $local_command"
fi

# Run PHP Mess Detector on each input file
report_param="$1"
ruleset_param="$2"
input_files="${@:3}"
error_occurred=0

for input_file in ${input_files[@]}; do
  command="${exec_command} ${input_file} ${report_param} ${ruleset_param}"
  echo -e "Running: ${command}"
  command_output=`eval $command`
  echo "${command_output}"
  if [[ "${command_output}" =~ ERROR ]]; then
    error_occurred=1
  fi
  echo
done
exit $error_occurred
