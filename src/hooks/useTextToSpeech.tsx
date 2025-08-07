
import { useState, useEffect, useCallback, useRef } from 'react';

export const useTextToSpeech = () => {
  const [isEnabled, setIsEnabled] = useState(() => {
    const saved = localStorage.getItem('mahoro-tts-enabled');
    return saved ? JSON.parse(saved) : false; // Default to false (off)
  });
  const [isSpeaking, setIsSpeaking] = useState(false);
  const currentUtteranceRef = useRef<SpeechSynthesisUtterance | null>(null);
  const timeoutRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    localStorage.setItem('mahoro-tts-enabled', JSON.stringify(isEnabled));
  }, [isEnabled]);

  // Cleanup on component unmount
  useEffect(() => {
    return () => {
      stop();
    };
  }, []);

  const stop = useCallback(() => {
    // Clear any pending timeout
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
      timeoutRef.current = null;
    }
    
    // Cancel speech synthesis
    window.speechSynthesis.cancel();
    currentUtteranceRef.current = null;
    setIsSpeaking(false);
  }, []);

  const speak = useCallback((text: string, language: string = 'en') => {
    // Don't speak if disabled or no text
    if (!isEnabled || !text.trim()) return;

    // Stop any ongoing speech first
    stop();

    // Wait a brief moment for the stop to take effect
    timeoutRef.current = setTimeout(() => {
      const utterance = new SpeechSynthesisUtterance(text.trim());
      currentUtteranceRef.current = utterance;
      
      // Set language based on selection
      const langMap: { [key: string]: string } = {
        'en': 'en-US',
        'fr': 'fr-FR',
        'sw': 'sw-KE',
        'rw': 'rw-RW' // May not be available on all browsers
      };
      
      utterance.lang = langMap[language] || 'en-US';
      utterance.rate = 0.8; // Slightly slower for clarity
      utterance.pitch = 1;
      utterance.volume = 0.9;

      utterance.onstart = () => {
        setIsSpeaking(true);
      };
      
      utterance.onend = () => {
        setIsSpeaking(false);
        currentUtteranceRef.current = null;
      };
      
      utterance.onerror = (event) => {
        console.warn('Speech synthesis error:', event.error);
        setIsSpeaking(false);
        currentUtteranceRef.current = null;
      };

      utterance.onpause = () => {
        setIsSpeaking(false);
      };

      utterance.onresume = () => {
        setIsSpeaking(true);
      };

      // Check if TTS is still enabled before speaking
      if (isEnabled) {
        window.speechSynthesis.speak(utterance);
      }
    }, 100);
  }, [isEnabled, stop]);

  const toggle = useCallback(() => {
    if (isEnabled) {
      // If disabling, stop current speech
      stop();
    }
    setIsEnabled(!isEnabled);
  }, [isEnabled, stop]);

  return {
    isEnabled,
    isSpeaking,
    speak,
    stop,
    toggle
  };
};
