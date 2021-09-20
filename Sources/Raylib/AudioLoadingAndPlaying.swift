/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import _RaylibC

public extension Raylib {
    //------------------------------------------------------------------------------------
    // Audio Loading and Playing Functions (Module: audio)
    //------------------------------------------------------------------------------------
    
    //MARK: - Audio device management functions
    
    /// Initialize audio device and context
    @_transparent
    static func initAudioDevice() {
        _RaylibC.InitAudioDevice()
    }
    
    /// Close the audio device and context
    @_transparent
    static func closeAudioDevice() {
        _RaylibC.CloseAudioDevice()
    }
    
    /// Check if audio device has been initialized successfully
    @_transparent
    static var isAudioDeviceReady: Bool {
        let result = _RaylibC.IsAudioDeviceReady()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set master volume (listener)
    @_transparent
    static func setMasterVolume(_ volume: Float) {
        _RaylibC.SetMasterVolume(volume)
    }
    
    //MARK: - Wave/Sound loading/unloading functions
    
    /// Load wave data from file
    @_transparent
    static func loadWave(_ fileName: String) -> Wave {
        return fileName.withCString { cString in
            return _RaylibC.LoadWave(cString)
        }
    }
    
    /// Load wave from memory buffer, fileType refers to extension: i.e. ".wav"
    @_transparent
    static func LoadWaveFromMemory(_ fileType: String, _ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32) -> Wave {
        return fileType.withCString { fileCString in
            return _RaylibC.LoadWaveFromMemory(fileCString, fileData, dataSize)
        }
    }
    
    /// Load sound from file
    @_transparent
    static func loadSound(_ fileName: String) -> Sound {
        return fileName.withCString { cString in
            return _RaylibC.LoadSound(cString)
        }
    }
    
    /// Load sound from wave data
    @_transparent
    static func loadSoundFromWave(_ wave: Wave) -> Sound {
        return _RaylibC.LoadSoundFromWave(wave)
    }
    
    /// Update sound buffer with new data
    @_transparent
    static func UpdateSound(_ sound: Sound, _ data: UnsafeRawPointer!, _ samplesCount: Int32) {
        return _RaylibC.UpdateSound(sound, data, samplesCount)
    }
    
    /// Unload wave data
    @_transparent
    static func unloadWave(_ wave: Wave) {
        _RaylibC.UnloadWave(wave)
    }
    
    /// Unload sound
    @_transparent
    static func unloadSound(_ sound: Sound) {
        _RaylibC.UnloadSound(sound)
    }
    
    /// Export wave data to file, returns true on success
    @_transparent
    static func exportWave(_ wave: Wave, _ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.ExportWave(wave, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    /// Export wave sample data to code (.h), returns true on success
    @_transparent
    static func exportWaveAsCode(_ wave: Wave, _ fileName: String) -> Bool {
        return fileName.withCString { cString in
            let result = _RaylibC.ExportWaveAsCode(wave, cString)
#if os(Windows)
            return result.rawValue != 0
#else
            return result
#endif
        }
    }
    
    //MARK: - Wave/Sound management functions
    
    /// Play a sound
    @_transparent
    static func playSound(_ sound: Sound) {
        _RaylibC.PlaySound(sound)
    }
    
    /// Stop playing a sound
    @_transparent
    static func stopSound(_ sound: Sound) {
        _RaylibC.StopSound(sound)
    }
    
    /// Pause a sound
    @_transparent
    static func pauseSound(_ sound: Sound) {
        _RaylibC.PauseSound(sound)
    }
    
    /// Resume a paused sound
    @_transparent
    static func resumeSound(_ sound: Sound) {
        _RaylibC.ResumeSound(sound)
    }
    
    /// Play a sound (using multichannel buffer pool)
    @_transparent
    static func playSoundMulti(_ sound: Sound) {
        _RaylibC.PlaySoundMulti(sound)
    }
    
    /// Stop any sound playing (using multichannel buffer pool)
    @_transparent
    static func stopSoundMulti() {
        _RaylibC.StopSoundMulti()
    }
    
    /// Get number of sounds playing in the multichannel
    @_transparent
    static func getSoundsPlaying() -> Int32 {
        return _RaylibC.GetSoundsPlaying()
    }
    
    /// Check if a sound is currently playing
    @_transparent
    static func isSoundPlaying(_ sound: Sound) -> Bool {
        let result = _RaylibC.IsSoundPlaying(sound)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set volume for a sound (1.0 is max level)
    @_transparent
    static func setSoundVolume(_ sound: Sound, _ volume: Float) {
        _RaylibC.SetSoundVolume(sound, volume)
    }
    
    /// Set pitch for a sound (1.0 is base level)
    @_transparent
    static func setSoundPitch(_ sound: Sound, _ pitch: Float) {
        _RaylibC.SetSoundPitch(sound, pitch)
    }
    
    /// Convert wave data to desired format
    @_transparent
    static func waveFormat(_ wave: inout Wave, _ sampleRate: Int32, _ sampleSize: Int32, _ channels: Int32) {
        _RaylibC.WaveFormat(&wave, sampleRate, sampleSize, channels)
    }
    
    /// Copy a wave to a new wave
    @_transparent
    static func waveCopy(_ wave: Wave) -> Wave {
        return _RaylibC.WaveCopy(wave)
    }
    
    /// Crop a wave to defined samples range
    @_transparent
    static func waveCrop(_ wave: inout Wave, _ initSample: Int32, _ finalSample: Int32) {
        _RaylibC.WaveCrop(&wave, initSample, finalSample)
    }
    
    /// Load samples data from wave as a floats array
    @_transparent
    static func loadWaveSamples(_ wave: Wave) -> [Float] {
        let buffer = UnsafeMutableBufferPointer(start: _RaylibC.LoadWaveSamples(wave), count: Int(wave.sampleCount))
        return Array(buffer)
    }
    
    /// Unload samples data loaded with LoadWaveSamples()
    @_transparent @available(*, unavailable, message: "Swift manages memory. There's no need to call this.")
    static func unloadWaveSamples(_ samples: [Float]) {
        var samples = samples
        _RaylibC.UnloadWaveSamples(&samples)
    }
    
    //MARK: - Music management functions
    
    /// Load music stream from file
    @_transparent
    static func loadMusicStream(_ fileName: String) -> Music {
        return fileName.withCString { cString in
            return _RaylibC.LoadMusicStream(cString)
        }
    }
    
    /// Load music stream from data
    @_transparent
    static func loadMusicStreamFromMemory(_ fileType: String, _ data: UnsafeMutablePointer<UInt8>!, _ dataSize: Int32) -> Music {
        return fileType.withCString { fileCString in
            return _RaylibC.LoadMusicStreamFromMemory(fileCString, data, dataSize)
        }
    }
    
    /// Unload music stream
    @_transparent
    static func unloadMusicStream(_ music: Music) {
        _RaylibC.UnloadMusicStream(music)
    }
    
    /// Start music playing
    @_transparent
    static func playMusicStream(_ music: Music) {
        _RaylibC.PlayMusicStream(music)
    }
    
    /// Check if music is playing
    @_transparent
    static func isMusicPlaying(_ music: Music) -> Bool {
        let result = _RaylibC.IsMusicPlaying(music)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Updates buffers for music streaming
    @_transparent
    static func updateMusicStream(_ music: Music) {
        _RaylibC.UpdateMusicStream(music)
    }
    
    /// Stop music playing
    @_transparent
    static func stopMusicStream(_ music: Music) {
        _RaylibC.StopMusicStream(music)
    }
    
    /// Pause music playing
    @_transparent
    static func pauseMusicStream(_ music: Music) {
        _RaylibC.PauseMusicStream(music)
    }
    
    /// Resume playing paused music
    @_transparent
    static func resumeMusicStream(_ music: Music) {
        _RaylibC.ResumeMusicStream(music)
    }
    
    /// Set volume for music (1.0 is max level)
    @_transparent
    static func setMusicVolume(_ music: Music, _ volume: Float) {
        _RaylibC.SetMusicVolume(music, volume)
    }
    
    /// Set pitch for a music (1.0 is base level)
    @_transparent
    static func setMusicPitch(_ music: Music, _ pitch: Float) {
        _RaylibC.SetMusicPitch(music, pitch)
    }
    
    /// Get music time length (in seconds)
    @_transparent
    static func getMusicTimeLength(_ music: Music) -> Float {
        return _RaylibC.GetMusicTimeLength(music)
    }
    
    /// Get current music time played (in seconds)
    @_transparent
    static func getMusicTimePlayed(_ music: Music) -> Float {
        return _RaylibC.GetMusicTimeLength(music)
    }
    
    //MARK: - AudioStream management functions
    
    /// Init audio stream (to stream raw audio pcm data)
    @_transparent
    static func initAudioStream(_ sampleRate: UInt32, _ sampleSize: UInt32, _ channels: UInt32) -> AudioStream {
        return _RaylibC.InitAudioStream(sampleRate, sampleSize, channels)
    }
    
    /// Update audio stream buffers with data
    @_transparent
    static func updateAudioStream(_ stream: AudioStream, _ data: UnsafeRawPointer!, _ samplesCount: Int32) {
        _RaylibC.UpdateAudioStream(stream, data, samplesCount)
    }
    
    /// Close audio stream and free memory
    @_transparent
    static func closeAudioStream(_ stream: AudioStream) {
        _RaylibC.CloseAudioStream(stream)
    }
    
    /// Check if any audio stream buffers requires refill
    @_transparent
    static func isAudioStreamProcessed(_ stream: AudioStream) -> Bool {
        let result = _RaylibC.IsAudioStreamPlaying(stream)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Play audio stream
    @_transparent
    static func playAudioStream(_ stream: AudioStream) {
        _RaylibC.PlayAudioStream(stream)
    }
    
    /// Pause audio stream
    @_transparent
    static func pauseAudioStream(_ stream: AudioStream) {
        _RaylibC.PauseAudioStream(stream)
    }
    
    /// Resume audio stream
    @_transparent
    static func resumeAudioStream(_ stream: AudioStream) {
        _RaylibC.ResumeAudioStream(stream)
    }
    
    /// Check if audio stream is playing
    @_transparent
    static func isAudioStreamPlaying(_ stream: AudioStream) -> Bool {
        let result = _RaylibC.IsAudioStreamPlaying(stream)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Stop audio stream
    @_transparent
    static func stopAudioStream(_ stream: AudioStream) {
        _RaylibC.StopAudioStream(stream)
    }
    
    /// Set volume for audio stream (1.0 is max level)
    @_transparent
    static func setAudioStreamVolume(_ stream: AudioStream, _ volume: Float) {
        _RaylibC.SetAudioStreamVolume(stream, volume)
    }
    
    /// Set pitch for audio stream (1.0 is base level)
    @_transparent
    static func setAudioStreamPitch(_ stream: AudioStream, _ pitch: Float) {
        _RaylibC.SetAudioStreamPitch(stream, pitch)
    }
    
    /// Default size for new audio streams
    @_transparent
    static func setAudioStreamBufferSizeDefault(_ size: Int32) {
        _RaylibC.SetAudioStreamBufferSizeDefault(size)
    }
}
