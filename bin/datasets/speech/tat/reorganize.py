# -*- coding: utf-8 -*-
# file: reorganize.py
# date: 2024-01-26


import os
import sys
import json
from typing import Dict, List


def init(out_dir) -> None:
    os.system("mkdir -p %s/audios" % out_dir)


def reorg(out_dir: str, metadata_dir: str, audio_dir: str) -> Dict:
    meta_data: Dict[str, Dict] = {}
    sub_dirs: List[str] = [
        os.path.join(metadata_dir, x) for x in os.listdir(metadata_dir)
    ]
    file_paths: List[str] = []
    for sub_dir in sub_dirs:
        sub_dir_name: str = sub_dir.split("/")[-1]
        for metadata_file in os.listdir(sub_dir):
            audio_file: str = metadata_file.replace(".json", "-03.wav")
            audio_path: str = os.path.join(audio_dir, sub_dir_name, audio_file)
            metadata_path: str = os.path.join(sub_dir, metadata_file)
            metadata: Dict = json.loads(open(metadata_path, "r").read())
            
            new_audio_file: str = "%s_%s" % (sub_dir_name, audio_file)
            new_audio_path: str = os.path.join(out_dir, "audios", new_audio_file)
            new_metadata: Dict = {
                "duration": metadata["音檔長度"], 
                "transcript": metadata["漢羅台文"], 
                "sub_dir": sub_dir_name
            }
            meta_data[new_audio_file] = new_metadata
            os.system("cp %s %s" % (audio_path, new_audio_path))
            print("Copied '%s' to '%s'" % (audio_path, new_audio_path))

    new_metadata_path: str = os.path.join(out_dir, "metadata.json")
    open(new_metadata_path, "w").write(json.dumps(meta_data, ensure_ascii=False))
    print("New metadata located at '%s'" % new_metadata_path)


if __name__ == "__main__":
    configs: Dict = json.loads(open(sys.argv[1], "r").read())
    init(configs["out_dir"])
    reorg(configs["out_dir"], configs["metadata_dir"], configs["audio_dir"])
