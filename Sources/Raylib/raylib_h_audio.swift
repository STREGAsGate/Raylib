/**
 * Copyright (c) 2022 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

import _RaylibC

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
//MARK: - Audio device management functions
public extension Raylib {
    /// Initialize audio device and context
    @inlinable
    static func initAudioDevice() {
        _RaylibC.InitAudioDevice()
    }
    
    /// Close the audio device and context
    @inlinable
    static func closeAudioDevice() {
        _RaylibC.CloseAudioDevice()
    }
    
    /// Check if audio device has been initialized successfully
    @inlinable
    static var isAudioDeviceReady: Bool {
        let result = _RaylibC.IsAudioDeviceReady()
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set master volume (listener)
    @inlinable
    static func setMasterVolume(_ volume: Float) {
        _RaylibC.SetMasterVolume(volume)
    }
}


//MARK: - Wave/Sound loading/unloading functions
public extension Raylib {
    /// Load wave data from file
    @inlinable
    static func loadWave(_ fileName: String) -> Wave {
        return fileName.withCString { cString in
            return _RaylibC.LoadWave(cString)
        }
    }
    
    /// Load wave from memory buffer, fileType refers to extension: i.e. ".wav"
    @inlinable
    static func LoadWaveFromMemory(_ fileType: String, _ fileData: UnsafePointer<UInt8>!, _ dataSize: Int32) -> Wave {
        return fileType.withCString { fileCString in
            return _RaylibC.LoadWaveFromMemory(fileCString, fileData, dataSize)
        }
    }
    
    /// Load sound from file
    @inlinable
    static func loadSound(_ fileName: String) -> Sound {
        return fileName.withCString { cString in
            return _RaylibC.LoadSound(cString)
        }
    }
    
    /// Load sound from wave data
    @inlinable
    static func loadSoundFromWave(_ wave: Wave) -> Sound {
        return _RaylibC.LoadSoundFromWave(wave)
    }
    
    /// Update sound buffer with new data
    @inlinable
    static func updateSound(_ sound: Sound, _ data: UnsafeRawPointer!, _ samplesCount: Int32) {
        return _RaylibC.UpdateSound(sound, data, samplesCount)
    }
    
    /// Unload wave data
    @inlinable
    static func unloadWave(_ wave: Wave) {
        _RaylibC.UnloadWave(wave)
    }
    
    /// Unload sound
    @inlinable
    static func unloadSound(_ sound: Sound) {
        _RaylibC.UnloadSound(sound)
    }
    
    /// Export wave data to file, returns true on success
    @inlinable
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
    @inlinable
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
}


//MARK: - Wave/Sound management functions
public extension Raylib {
    /// Play a sound
    @inlinable
    static func playSound(_ sound: Sound) {
        _RaylibC.PlaySound(sound)
    }
    
    /// Stop playing a sound
    @inlinable
    static func stopSound(_ sound: Sound) {
        _RaylibC.StopSound(sound)
    }
    
    /// Pause a sound
    @inlinable
    static func pauseSound(_ sound: Sound) {
        _RaylibC.PauseSound(sound)
    }
    
    /// Resume a paused sound
    @inlinable
    static func resumeSound(_ sound: Sound) {
        _RaylibC.ResumeSound(sound)
    }
    
    /// Play a sound (using multichannel buffer pool)
    @inlinable
    static func playSoundMulti(_ sound: Sound) {
        _RaylibC.PlaySoundMulti(sound)
    }
    
    /// Stop any sound playing (using multichannel buffer pool)
    @inlinable
    static func stopSoundMulti() {
        _RaylibC.StopSoundMulti()
    }
    
    /// Get number of sounds playing in the multichannel
    @inlinable
    static func getSoundsPlaying() -> Int32 {
        return _RaylibC.GetSoundsPlaying()
    }
    
    /// Check if a sound is currently playing
    @inlinable
    static func isSoundPlaying(_ sound: Sound) -> Bool {
        let result = _RaylibC.IsSoundPlaying(sound)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Set volume for a sound (1.0 is max level)
    @inlinable
    static func setSoundVolume(_ sound: Sound, _ volume: Float) {
        _RaylibC.SetSoundVolume(sound, volume)
    }
    
    /// Set pitch for a sound (1.0 is base level)
    @inlinable
    static func setSoundPitch(_ sound: Sound, _ pitch: Float) {
        _RaylibC.SetSoundPitch(sound, pitch)
    }
    
    /// Convert wave data to desired format
    @inlinable
    static func waveFormat(_ wave: inout Wave, _ sampleRate: Int32, _ sampleSize: Int32, _ channels: Int32) {
        _RaylibC.WaveFormat(&wave, sampleRate, sampleSize, channels)
    }
    
    /// Copy a wave to a new wave
    @inlinable
    static func waveCopy(_ wave: Wave) -> Wave {
        return _RaylibC.WaveCopy(wave)
    }
    
    /// Crop a wave to defined samples range
    @inlinable
    static func waveCrop(_ wave: inout Wave, _ initSample: Int32, _ finalSample: Int32) {
        _RaylibC.WaveCrop(&wave, initSample, finalSample)
    }
    
    /// Load samples data from wave as a floats array
    @inlinable
    static func loadWaveSamples(_ wave: Wave) -> [Float] {
        let buffer = UnsafeMutableBufferPointer(start: _RaylibC.LoadWaveSamples(wave), count: Int(wave.frameCount))
        let array = Array(buffer)
        _RaylibC.UnloadWaveSamples(buffer.baseAddress)
        return array
    }
    
    /// Unload samples data loaded with LoadWaveSamples()
    @inlinable @available(*, unavailable, message: "Swift manages memory. There's no need to call this.")
    static func unloadWaveSamples(_ samples: [Float]) {
        var samples = samples
        _RaylibC.UnloadWaveSamples(&samples)
    }
}


//MARK: - Music management functions
public extension Raylib {
    /// Load music stream from file
    @inlinable
    static func loadMusicStream(_ fileName: String) -> Music {
        return fileName.withCString { cString in
            return _RaylibC.LoadMusicStream(cString)
        }
    }
    
    /// Load music stream from data
    @inlinable
    static func loadMusicStreamFromMemory(_ fileType: String, _ data: UnsafeMutablePointer<UInt8>!, _ dataSize: Int32) -> Music {
        return fileType.withCString { fileCString in
            return _RaylibC.LoadMusicStreamFromMemory(fileCString, data, dataSize)
        }
    }
    
    /// Unload music stream
    @inlinable
    static func unloadMusicStream(_ music: Music) {
        _RaylibC.UnloadMusicStream(music)
    }
    
    /// Start music playing
    @inlinable
    static func playMusicStream(_ music: Music) {
        _RaylibC.PlayMusicStream(music)
    }
    
    /// Check if music is playing
    @inlinable
    static func isMusicStreamPlaying(_ music: Music) -> Bool {
        let result = _RaylibC.IsMusicStreamPlaying(music)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Updates buffers for music streaming
    @inlinable
    static func updateMusicStream(_ music: Music) {
        _RaylibC.UpdateMusicStream(music)
    }
    
    /// Stop music playing
    @inlinable
    static func stopMusicStream(_ music: Music) {
        _RaylibC.StopMusicStream(music)
    }
    
    /// Pause music playing
    @inlinable
    static func pauseMusicStream(_ music: Music) {
        _RaylibC.PauseMusicStream(music)
    }
    
    /// Resume playing paused music
    @inlinable
    static func resumeMusicStream(_ music: Music) {
        _RaylibC.ResumeMusicStream(music)
    }
    
    /// Seek music to a position (in seconds)
    @inlinable
    static func seekMusicStream(_ music: Music, _ position: Float) {
        _RaylibC.SeekMusicStream(music, position)
    }
    
    /// Set volume for music (1.0 is max level)
    @inlinable
    static func setMusicVolume(_ music: Music, _ volume: Float) {
        _RaylibC.SetMusicVolume(music, volume)
    }
    
    /// Set pitch for a music (1.0 is base level)
    @inlinable
    static func setMusicPitch(_ music: Music, _ pitch: Float) {
        _RaylibC.SetMusicPitch(music, pitch)
    }
    
    /// Get music time length (in seconds)
    @inlinable
    static func getMusicTimeLength(_ music: Music) -> Float {
        return _RaylibC.GetMusicTimeLength(music)
    }
    
    /// Get current music time played (in seconds)
    @inlinable
    static func getMusicTimePlayed(_ music: Music) -> Float {
        return _RaylibC.GetMusicTimeLength(music)
    }
}


//MARK: - AudioStream management functions
public extension Raylib {
    /// Init audio stream (to stream raw audio pcm data)
    @inlinable
    static func loadAudioStream(_ sampleRate: UInt32, _ sampleSize: UInt32, _ channels: UInt32) -> AudioStream {
        return _RaylibC.LoadAudioStream(sampleRate, sampleSize, channels)
    }
    
    /// Unload audio stream and free memory
    @inlinable
    static func unloadAudioStream(_ stream: AudioStream) {
        _RaylibC.UnloadAudioStream(stream)
    }
    
    /// Update audio stream buffers with data
    @inlinable
    static func updateAudioStream(_ stream: AudioStream, _ data: UnsafeRawPointer!, _ samplesCount: Int32) {
        _RaylibC.UpdateAudioStream(stream, data, samplesCount)
    }
    
    /// Check if any audio stream buffers requires refill
    @inlinable
    static func isAudioStreamProcessed(_ stream: AudioStream) -> Bool {
        let result = _RaylibC.IsAudioStreamPlaying(stream)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Play audio stream
    @inlinable
    static func playAudioStream(_ stream: AudioStream) {
        _RaylibC.PlayAudioStream(stream)
    }
    
    /// Pause audio stream
    @inlinable
    static func pauseAudioStream(_ stream: AudioStream) {
        _RaylibC.PauseAudioStream(stream)
    }
    
    /// Resume audio stream
    @inlinable
    static func resumeAudioStream(_ stream: AudioStream) {
        _RaylibC.ResumeAudioStream(stream)
    }
    
    /// Check if audio stream is playing
    @inlinable
    static func isAudioStreamPlaying(_ stream: AudioStream) -> Bool {
        let result = _RaylibC.IsAudioStreamPlaying(stream)
#if os(Windows)
        return result.rawValue != 0
#else
        return result
#endif
    }
    
    /// Stop audio stream
    @inlinable
    static func stopAudioStream(_ stream: AudioStream) {
        _RaylibC.StopAudioStream(stream)
    }
    
    /// Set volume for audio stream (1.0 is max level)
    @inlinable
    static func setAudioStreamVolume(_ stream: AudioStream, _ volume: Float) {
        _RaylibC.SetAudioStreamVolume(stream, volume)
    }
    
    /// Set pitch for audio stream (1.0 is base level)
    @inlinable
    static func setAudioStreamPitch(_ stream: AudioStream, _ pitch: Float) {
        _RaylibC.SetAudioStreamPitch(stream, pitch)
    }
    
    /// Default size for new audio streams
    @inlinable
    static func setAudioStreamBufferSizeDefault(_ size: Int32) {
        _RaylibC.SetAudioStreamBufferSizeDefault(size)
    }
    
    /// Audio thread callback to request new data
    @inlinable
    static func setAudioStreamCallback(_ stream: AudioStream, _ callback: @escaping AudioCallback) {
        _RaylibC.SetAudioStreamCallback(stream, callback)
    }
    
    /// Attach audio stream processor to stream
    @inlinable
    static func attachAudioStreamProcessor(_ stream: AudioStream, _ processor: @escaping AudioCallback) {
        _RaylibC.AttachAudioStreamProcessor(stream, processor)
    }
    
    /// Detach audio stream processor from stream
    @inlinable
    static func detachAudioStreamProcessor(_ stream: AudioStream, _ processor: @escaping AudioCallback) {
        _RaylibC.DetachAudioStreamProcessor(stream, processor)
    }
}
