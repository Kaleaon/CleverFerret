# TTS Provider Selection - UI Guide

## Visual Walkthrough

### 1. Settings Menu Entry Point

```text
╔═══════════════════════════════════════╗
║  Settings                         ←   ║
╠═══════════════════════════════════════╣
║                                       ║
║  Reading & Audio                      ║
║  ┌─────────────────────────────────┐ ║
║  │ 🎤 Text-to-Speech Provider    → │ ║
║  │ Choose between Android TTS,     │ ║
║  │ Gemini, and more                │ ║
║  └─────────────────────────────────┘ ║
║                                       ║
║  Media Servers                        ║
║  ┌─────────────────────────────────┐ ║
║  │ 📡 Media Servers              → │ ║
║  └─────────────────────────────────┘ ║
╚═══════════════════════════════════════╝
```

---

### 2. TTS Provider Selection Screen

```text
╔═══════════════════════════════════════╗
║ ← Text-to-Speech Provider             ║
╠═══════════════════════════════════════╣
║                                       ║
║ Choose your text-to-speech provider   ║
║ Select the voice service you want to  ║
║ use for reading books aloud.          ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ Android TTS                ✓  ● │ ║ ← Selected & Configured
║ │ Built-in device text-to-speech   │ ║
║ │ (offline, free)                   │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ Google Gemini          ⚙️  ⚠️  ○│ ║ ← Not Configured
║ │ AI-powered natural speech         │ ║
║ │ (requires API key)                │ ║
║ │ API key required                  │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ Google Cloud TTS       ⚙️  ✓  ○│ ║ ← Configured but not selected
║ │ High-quality neural voices        │ ║
║ │ (requires API key)                │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ ElevenLabs             ⚙️  ⚠️  ○│ ║
║ │ Ultra-realistic AI voices         │ ║
║ │ (requires API key)                │ ║
║ │ API key required                  │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ OpenAI TTS             ⚙️  ⚠️  ○│ ║
║ │ Natural human-like speech         │ ║
║ │ (requires API key)                │ ║
║ │ API key required                  │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ ℹ️  About TTS Providers          │ ║
║ │                                   │ ║
║ │ • Android TTS: Free, offline,     │ ║
║ │   works immediately               │ ║
║ │ • Cloud TTS: High-quality AI      │ ║
║ │   voices, requires internet       │ ║
║ │ • API keys for cloud services     │ ║
║ │   can be obtained from their      │ ║
║ │   respective websites             │ ║
║ └─────────────────────────────────┘ ║
╚═══════════════════════════════════════╝
```

---

### 3. API Key Configuration Dialog

When user clicks on unconfigured provider or settings icon:

```text
╔═══════════════════════════════════════╗
║  Configure Google Gemini              ║
╠═══════════════════════════════════════╣
║                                       ║
║ Enter your API key to use Google      ║
║ Gemini.                               ║
║                                       ║
║ ┌─────────────────────────────────┐ ║
║ │ API Key                           │ ║
║ │ ●●●●●●●●●●●●●●●●●●●●●   👁️     │ ║ ← Password field with toggle
║ │ sk-...                            │ ║
║ └─────────────────────────────────┘ ║
║                                       ║
║ Get your API key from:                ║
║ https://makersuite.google.com/app/    ║
║ apikey                                ║
║                                       ║
║           [Cancel]      [Save]        ║
╚═══════════════════════════════════════╝
```

---

### 4. Provider States

#### Unconfigured Cloud Provider
```text
┌─────────────────────────────────────┐
│ Google Gemini            ⚙️  ⚠️  ○ │
│ AI-powered natural speech           │
│ (requires API key)                  │
│ ⚠️ API key required                 │
└─────────────────────────────────────┘
```

#### Configured but Not Selected
```text
┌─────────────────────────────────────┐
│ Google Cloud TTS         ⚙️  ✓   ○ │
│ High-quality neural voices          │
│ (requires API key)                  │
└─────────────────────────────────────┘
```

#### Selected and Active
```text
┌─────────────────────────────────────┐
│ Android TTS                  ✓   ● │ ← Blue border
│ Built-in device text-to-speech     │
│ (offline, free)                     │
└─────────────────────────────────────┘
```

---

## Icon Legend

- **●** = Selected (Radio button filled)
- **○** = Not selected (Radio button empty)
- **✓** = Configured / Available
- **⚠️** = Needs configuration
- **⚙️** = Settings button (opens API key dialog)
- **→** = Navigation arrow
- **←** = Back button
- **ℹ️** = Information
- **🎤** = Microphone/Voice icon
- **👁️** = Show/hide password toggle

---

## Color Scheme

### Provider Cards
- **Selected**: Primary container color with 2dp primary border
- **Unselected**: Surface color with no border
- **Hover**: Slight elevation increase

### Status Indicators
- **Configured (✓)**: Primary color (blue/green)
- **Needs Config (⚠️)**: Error color (red/orange)
- **Settings (⚙️)**: On-surface color (gray)

### Info Card
- **Background**: Primary container (light blue)
- **Text**: On-primary-container color

---

## Interaction Flow

### Selecting Android TTS (No API Key)
```text
1. User taps Android TTS card
   ↓
2. Radio button changes to filled (●)
   ↓
3. Card gets blue border
   ↓
4. Provider immediately active ✓
```

### Selecting Gemini (First Time)
```text
1. User taps Gemini card
   ↓
2. API key dialog appears
   ↓
3. User enters API key
   ↓
4. User clicks "Save"
   ↓
5. Dialog closes
   ↓
6. Provider becomes configured (✓)
   ↓
7. Provider becomes selected (●)
   ↓
8. Card gets blue border
```

### Configuring Without Selecting
```text
1. User taps settings icon (⚙️)
   ↓
2. API key dialog appears
   ↓
3. User enters/updates API key
   ↓
4. User clicks "Save"
   ↓
5. Provider shows configured (✓)
   ↓
6. Provider remains unselected (○)
```

---

## Accessibility

### Screen Reader Support
- Each provider card announces: "Provider name, description, configuration status, selection status"
- Settings button announces: "Configure provider name"
- API key field announces: "API key, password field, show/hide button"

### Keyboard Navigation
- Tab through provider cards
- Space/Enter to select provider
- Tab to settings icon, Enter to configure

### High Contrast Mode
- All important indicators visible
- Border widths increased
- Color combinations meet WCAG AA standards

---

## Responsive Design

### Portrait Mode (Phones)
- Full width cards
- Stacked vertically
- Comfortable spacing (8dp between cards)

### Landscape Mode (Tablets)
- Two-column layout for providers
- Side-by-side API key dialog
- More compact spacing

### Large Screens
- Max width constraint (600dp)
- Centered content
- Increased padding

---

## Animation & Transitions

### Card Selection
- Smooth border animation (150ms)
- Color transition (200ms)
- Radio button fill animation (100ms)

### Dialog Appearance
- Fade in background (200ms)
- Scale in dialog (250ms, spring animation)
- Keyboard slides up smoothly

### API Key Toggle
- Password reveal animates (150ms)
- Icon rotation (100ms)

---

## User Feedback

### Success States
- Provider selected: Brief haptic feedback
- API key saved: Snackbar "API key saved successfully"
- Provider configured: Check icon appears with animation

### Error States
- Invalid API key: Red outline on field
- Network error: Error snackbar with retry option
- Provider unavailable: Disabled state with explanation

---

## Best Practices Demonstrated

✅ **Material 3 Design** - Latest design system
✅ **Clear Hierarchy** - Visual importance through size/color
✅ **Status Visibility** - Always clear what's configured
✅ **Progressive Disclosure** - API key dialog only when needed
✅ **Helpful Context** - Info card explains options
✅ **Error Prevention** - Clear indicators of what's needed
✅ **Accessibility** - Screen reader and keyboard support
✅ **Responsive** - Works on all screen sizes

---

This UI provides an intuitive, professional experience for configuring TTS providers!
