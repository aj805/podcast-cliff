import os
import time
from config import TRANSCRIPTION_CHECK_INTERVAL, TRANSCRIPTION_MAX_WAIT_TIME

def wait_for_files(expected_files):
    start_time = time.time()

    while True:
        all_files_exist = all(os.path.exists(file) for file in expected_files)
        
        if all_files_exist:
            print(f"All expected files found")
            return True
        elif time.time() - start_time > TRANSCRIPTION_MAX_WAIT_TIME:
            print(f"Timeout occurred after waiting for {TRANSCRIPTION_MAX_WAIT_TIME} seconds.")
            return False
        else:
            print(f"Waiting for files. Checking again in {TRANSCRIPTION_CHECK_INTERVAL} seconds.")
            time.sleep(TRANSCRIPTION_CHECK_INTERVAL)

def add_transcript_path(dicts):
    for i in range(len(dicts)):
        dicts[i]['transcript_path'] = f"{dicts[i]['path']}.txt"
    return dicts
