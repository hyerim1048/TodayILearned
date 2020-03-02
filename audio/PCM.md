# Audio 저장 방식

Created: Mar 02, 2020 12:03 PM
Topic: Audio

# Pulse-code modulation (PCM)

- sampled **analog** signals **→ digital** signals
- a standard form of digital audio in computers
- 1) **Amplitude** of the analog signal is **sampled regularly** at uniform intervals
    - 2) and **quantized to the nearest value** within a range of digital steps

## Terminology

### Resolution/Sample size

- the amount of data used to **represent each discrete amplitude** sample
- **8 bit** (1 byte), 16 bit (range of 65536)

### Byte Order

- if more than one byte → byte order must be known (big endian vs little endian)
    - because of most used little-endian intel CPUs, **little-endian** is common

### Sign

- to understand the range of amplitude
- signed : always 2's complement

### Channels And Interleaving

- monaural: 1 channel
- more than 1 channel: interleaved - left, right, L, R ...

### Frequency And Sample Rate

- how many [samples](http://samples.channel)/channel are played each second
- samples/second (Hz)
    - 8000, 11025, 16000 ...

### Integer Or Floating Point

- most PCM formats use integers for encoding samples
    - some use floating point

### Frame

- A frame = 1 sample if 1 channel
- 2 samples if 2 channels

### Frame Size

- size in bytes of each frame
    - if 8 bits, 1 channel - one byte

## Audio formats using PCM

### WAV: Waveform audio format

- PCM data file used by Microsoft without any **compression**

[Pulse-code modulation](https://en.wikipedia.org/wiki/Pulse-code_modulation)

[PCM](https://wiki.multimedia.cx/index.php/PCM#Basic_Theory)

[PCM Terminology and Concepts - alsaaudio documentation 0.8.4 documentation](https://larsimmisch.github.io/pyalsaaudio/terminology.html)
