# -*- coding: utf-8 -*-
# file: inference.py


import sys
import os
import json
import whisper
import torch
from whisper.model import Whisper
from typing import Dict, List
from tqdm import tqdm


if __name__ == "__main__":
    configs: Dict = json.loads(open(sys.argv[1], "r").read())

    model_size: str = configs["model_size"]
    audio_dir: str = configs["audio_dir"]
    lang: str = configs["lang"]
    output_dir: str = configs["output_dir"]
    data_name: str = audio_dir.split("/")[-1]
    output_path: str = os.path.join(
        output_dir, "asr_inf_whisper_%s_%s_on_%s.jsonl" % (model_size, lang, data_name)
    )
    device: torch.device = torch.device(configs["device"])
    max_sample_size: int = configs["max_sample_size"]

    audios: List[str] = [
        os.path.join(audio_dir, x) for x in os.listdir(audio_dir)
    ]
    print("Orignally having %i samples" % len(audios))
    audios = sorted(list(set(audios)))[:max_sample_size]

    model: Whisper = whisper.load_model(model_size)
    model = model.to(device)

    out_file = open(output_path, "w")

    for audio in tqdm(audios):
        results: Dict = model.transcribe(audio, language=lang, task="transcribe")
        transcript: str = results["text"]
        record: Dict[str, str] = {"file": audio, "transcript": transcript}
        out_file.write(json.dumps(record, ensure_ascii=False) + "\n")

    out_file.close()
    print("Inference result: '%s'" % output_path)
