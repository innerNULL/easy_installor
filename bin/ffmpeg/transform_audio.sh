# file: transform_audio.sh
# date: 2024-01-08


set -x


# Paths
TARGET_AUDIOS_DIR=""
OUTPUT_AUDIOS_DIR=""

# Parameters
SAMPLE_RATE=16000
CHANNELS=1
BIT_DEPTH=16
OUTPUT_FORMAT=wav

# Filters
MIN_DURATION_SECONDS=5


function init() {
  rm -rf ${OUTPUT_AUDIOS_DIR}
  mkdir -p ${OUTPUT_AUDIOS_DIR}
}


function filter() {
  local file_path=$1
  local duration=$(ffmpeg -i ${input_file_path} 2>&1 | grep "Duration" | cut -d ' ' -f 4 | sed s/,//)
  local seconds=$(echo $duration | awk -F: '{print ($1*3600) + ($2*60) + $3}')
  local too_short=$(awk -v n1="$seconds" -v n2="$MIN_DURATION_SECONDS" 'BEGIN {print (n1 >= n2) ? "0" : "1"}')
  if [ "${too_short}" -eq 1 ]; then
    echo 1
  fi
  echo 0
}


function main() {
  echo "Starts transformation"

  init
  
  if [ -d "${TARGET_AUDIOS_DIR}" ]; then
    files=($(ls "${TARGET_AUDIOS_DIR}"))
    for file in "${files[@]}"; do
      local input_file_path="${TARGET_AUDIOS_DIR}/${file}"
      local output_file_path=${OUTPUT_AUDIOS_DIR}/${file}.${OUTPUT_FORMAT}
      local filter_flag=$(filter ${input_file_path})
      if [ "${filter_flag}" -eq 0 ]; then
        echo "Now transforming ${input_file_path}"
        ffmpeg -i ${input_file_path} -ar ${SAMPLE_RATE} -ac ${CHANNELS} -sample_fmt s${BIT_DEPTH} ${output_file_path}
        echo "Finished and dump converted audio at ${output_file_path}"
      fi
    done
  else
    echo "Directory not found: $dir"
  fi
 
  echo "Finished transformation"
}


main
