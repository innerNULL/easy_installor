# file: dataset_download_common_voice.sh
# date: 2023-01-09


#set -x


HOST="https://datasets-server.huggingface.co/rows?dataset=mozilla-foundation%2Fcommon_voice_11_0"
LANG="zh-CN"
SPLIT="test"
OUTPUT_DIR="./_hf_common_voice_dataset"


function init() {
  rm -rf ${OUTPUT_DIR}
  mkdir -p ${OUTPUT_DIR}/${SPLIT}
}


function main() {
  init
  cd ${OUTPUT_DIR}/${SPLIT}
  curl -X GET "${HOST}&config=${LANG}&split=${SPLIT}" >> metadata.json

  for row in $(cat metadata.json | jq -c '.rows[]'); do
    echo ${row}
    local row_id=$(echo ${row} | jq '.row_idx')
    local src_url=$(echo ${row} | jq '.row.audio[0].src')
    local audio_type=$(echo "${src_url}" | awk -F'.' '{print $NF}' | sed 's/\"//g')
    local sample_name=${SPLIT}_${LANG}_${row_id}.${audio_type}
    wget $(echo ${src_url} | sed 's/\"//g')
    mv audio.mp3 ${sample_name} 
    echo "Finished downloading ${src_url} to ${sample_name}"
  done

  echo "Finished"
}


main
