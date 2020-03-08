# short code for speech recognition in Python

Created By: hyerim kim
Last Edited: Mar 09, 2020 2:02 AM
Tags: Package, Python

pip install SpeechRecognition

    import speech_recognition as speech_recog 
    sample_audio = speech_recog.AudioFile('E:/Datasets/my_audio.wav')
    with sample_audio as audio_file:
        audio_content = recog.record(audio_file)
    recog.recognize_google(audio_content)

## References

[Uberi/speech_recognition](https://github.com/Uberi/speech_recognition)

[Introduction to Speech Recognition with Python](https://stackabuse.com/introduction-to-speech-recognition-with-python/)
