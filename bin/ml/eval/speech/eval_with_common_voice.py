# -*- coding: utf-8 -*-
# file: eval.py


import pdb
import sys
import json
import unicodedata
import re
import string
import pandas as pd
from pandas import DataFrame
from typing import Dict, List
from torchmetrics.text import CharErrorRate
from hanziconv import HanziConv


def text_norm(input_string):
    # Remove Chinese and English punctuations
    chinese_punctuations = '，。！？【】（）《》“”‘’：；“”'
    english_punctuations = r'''!()-[]{};:'"\,<>./?@#$%^&*_~'''
    punctuations_pattern = f"[{re.escape(chinese_punctuations)}{re.escape(english_punctuations)}]"

    # Remove alphabets and numbers
    alphanum_pattern = r'[A-Za-z0-9]'

    # Combine patterns
    combined_pattern = f'{punctuations_pattern}|{alphanum_pattern}'

    # Remove specified characters using regex
    result = re.sub(combined_pattern, '', input_string)

    return result

def get_groundtruth_transcript(
    meta_data_path: str, use_text_norm: bool=True
) -> Dict[str, str]:
    out: Dict[str, str] = {}
    df: DataFrame = pd.read_csv(meta_data_path, sep="\t")
    for record in df.to_dict(orient="records"):
        file_name: str = record["path"].split(".")[0]
        transcript: str = record["sentence"]
        transcript: str = text_norm(transcript) if use_text_norm else transcript
        out[file_name] = transcript
    return out


def get_asr_transcript(
    inf_file_path: str, file_col: str, transcript_col: str, 
    use_text_norm: bool=True
) -> Dict[str, str]:
    out: Dict[str, str] = {}
    records: List[Dict] = [
        json.loads(x) for x in open(inf_file_path, "r").read().split("\n")
        if x not in {"\n", "", " "}
    ]
    for record in records:
        file_name: str = record[file_col].split("/")[-1].split(".")[0]
        transcript: str = record[transcript_col]
        transcript = transcript.replace(" ", "")
        transcript = HanziConv.toSimplified(transcript)
        transcript = text_norm(transcript) if use_text_norm else transcript
        out[file_name] = transcript
    return out


def get_eval_metrics(targets: Dict[str, str], outputs: Dict[str, str]) -> None:
    target_texts: List[str] = []
    output_texts: List[str] = []
    for k, v in outputs.items():
        if k not in targets:
            continue
        target: str = targets[k]
        ourput: str = outputs[k]
        target_texts.append(target)
        output_texts.append(ourput)

    assert(len(target_texts) == len(output_texts))
    cer = CharErrorRate()
    sample_size: int = len(target_texts)
    results: Dict = {
        "sample_size": sample_size,
        "cer": float(cer(output_texts, target_texts))
    }
    print(results)


if __name__ == "__main__":
    configs: Dict = json.loads(open(sys.argv[1], "r").read())

    groundtruth: Dict[str, str] = get_groundtruth_transcript(
        configs["common_voice_transcript_path"], 
        use_text_norm=configs["text_norm"]
    )
    asr_results: Dict[str, str] = get_asr_transcript(
        configs["inf_jsonl_path"], 
        configs["inf_jsonl_path_col"], configs["inf_jsonl_transcript_col"], 
        use_text_norm=configs["text_norm"]
    )
    get_eval_metrics(groundtruth, asr_results)
