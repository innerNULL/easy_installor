# file: transform_audio.sh
# date: 2024-01-08


# Paths
TARGET_AUDIOS_DIR=""
OUTPUT_AUDIOS_DIR=""

# Parameters
SAMPLE_RATE=16000
CHANNELS=1
BIT_DEPTH=16


function init() {
  rm -rf ${OUTPUT_AUDIOS_DIR}
  mkdir -p ${OUTPUT_AUDIOS_DIR}
}


function main() {
  echo "Starts transformation"

  init
  
  if [ -d "${TARGET_AUDIOS_DIR}" ]; then
    files=($(ls "${TARGET_AUDIOS_DIR}"))
    for file in "${files[@]}"; do
      input_file_path="${TARGET_AUDIOS_DIR}/${file}"
      output_file_path="${OUTPUT_AUDIOS_DIR}/${file}"
      echo "Now transforming ${input_file_path}"
      ffmpeg -i ${input_file_path} -ar ${SAMPLE_RATE} -ac ${CHANNELS} -sample_fmt s${BIT_DEPTH} ${output_file_path}
      echo "Finished and dump converted audio at ${output_file_path}"
    done
  else
    echo "Directory not found: $dir"
  fi
 
  echo "Finished transformation"
}


main
