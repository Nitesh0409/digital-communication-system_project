# Unified Digital Communication System for Multimedia Transmission

## Overview
This project focuses on designing and implementing an end-to-end digital communication system for transmitting multimedia data (image/audio) over wireless channels.

## Current Status (Mid-Evaluation)

### Completed
- Multimedia input processing (image and audio)
- Binary conversion (8-bit image, 16-bit PCM audio)
- Framing with synchronization, metadata, sequencing, and CRC
- BPSK modulation with upsampling and pulse shaping
- Transmitter-side signal generation and verification

### In Progress
- Hardware interfacing and transmission testing
- System validation for real-time transmission

### Pending
- QPSK and 8-QAM modulation
- Channel coding (Repetition, Hamming)
- Receiver design (demodulation, decoding, reconstruction)
- Performance evaluation (BER, SNR, throughput)

## Demonstration Capability
- Functional transmitter pipeline:
  Input → Encoding → Framing → BPSK Output
- Generated signals ready for transmission/testing

## Tech Stack
- MATLAB (signal processing and modulation)

## Repository Structure
