# vad in python

Created: Mar 04, 2020 12:39 AM

# VAD?

- Voice Activity Detection
- speech processing where the presence or absence of human speech is detected
- mainly used in speech recognition
    - to reduce the size of speech data

## VAD in Python

### Using webrtcvad package

    import webrtcvad
    vad = webrtcvad.Vad()
    
    vad.set_mode(1)
    
    # Run the VAD on 10 ms of silence. The result should be False.
    sample_rate = 16000
    frame_duration = 10  # ms
    frame = b'\x00\x00' * int(sample_rate * frame_duration / 1000)
    print 'Contains speech: %s' % (vad.is_speech(frame, sample_rate)

- only 16-bit mono PCM
- sampled 8000, 16000, 32000, 48000 Hz
- frame 10, 20, 30 ms in duration

[wiseman/py-webrtcvad](https://github.com/wiseman/py-webrtcvad)