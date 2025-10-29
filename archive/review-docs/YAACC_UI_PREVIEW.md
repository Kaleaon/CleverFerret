# YAACC Integration - UI Preview

## Media Server Settings Screen

The Media Server Settings screen now includes YAACC (DLNA/UPnP) servers alongside Jellyfin, Plex, and Emby.

### Screen Layout

```
┌─────────────────────────────────────────────┐
│  ←  Media Servers                      [+]  │
├─────────────────────────────────────────────┤
│                                             │
│  Jellyfin Servers                           │
│  ┌─────────────────────────────────────┐   │
│  │  My Jellyfin Server          ✓      │   │
│  │  http://192.168.1.100:8096          │   │
│  │  [Test]              [Delete]        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  Plex Servers                               │
│  ┌─────────────────────────────────────┐   │
│  │  Home Plex Server           ✓       │   │
│  │  https://192.168.1.101:32400        │   │
│  │  [Test]              [Delete]        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  Emby Servers                               │
│  ┌─────────────────────────────────────┐   │
│  │  No Emby servers configured          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  YAACC (DLNA/UPnP) Servers         ← NEW!  │
│  ┌─────────────────────────────────────┐   │
│  │  Living Room DLNA        ✓          │   │
│  │  http://192.168.1.102:8200          │   │
│  │  [Test]              [Delete]        │   │
│  └─────────────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

## Add Server Dialog

When tapping the [+] button, users can select YAACC from the dropdown:

```
┌─────────────────────────────────────────┐
│  Add Media Server                       │
├─────────────────────────────────────────┤
│                                         │
│  Server Type                            │
│  ┌───────────────────────────────────┐ │
│  │ YAACC (DLNA/UPnP)            ▼   │ │
│  └───────────────────────────────────┘ │
│    ├─ Jellyfin                         │
│    ├─ Plex                             │
│    ├─ Emby                             │
│    └─ YAACC (DLNA/UPnP)     ✓         │
│                                         │
│  Server Name                            │
│  ┌───────────────────────────────────┐ │
│  │ Living Room DLNA              │    │
│  └───────────────────────────────────┘ │
│                                         │
│  Server URL                             │
│  ┌───────────────────────────────────┐ │
│  │ http://192.168.1.102:8200     │    │
│  └───────────────────────────────────┘ │
│                                         │
│  💡 DLNA/UPnP servers typically don't   │
│     require authentication. Enter the   │
│     server address and port.            │
│                                         │
│              [Cancel]      [Add]        │
└─────────────────────────────────────────┘
```

## Theme Integration

All YAACC elements use CleverFerret's existing design system:

### Color Scheme
- **Connected Status**: MaterialTheme.colorScheme.primary (✓ green check)
- **Disconnected Status**: MaterialTheme.colorScheme.error (⚠ red error icon)
- **Text**: MaterialTheme.colorScheme.onSurface
- **Secondary Text**: MaterialTheme.colorScheme.onSurfaceVariant
- **Card Background**: MetallicCard component (theme-aware)

### Typography
- **Section Headers**: MaterialTheme.typography.titleMedium + FontWeight.Bold
- **Server Names**: MaterialTheme.typography.titleMedium
- **Server URLs**: MaterialTheme.typography.bodySmall
- **Info Messages**: MaterialTheme.typography.bodySmall

### Components Used
- `MetallicCard` - For server cards and empty states
- `MetallicText` - For section headers
- `MetallicButton` - For Test and Delete actions
- `MetallicTopAppBar` - For screen header
- `FloatingActionButton` - For add server action

### Spacing
- Padding: 16.dp (consistent with other sections)
- Vertical spacing between items: 12.dp
- Section header padding: 8.dp vertical
- Card internal padding: 16.dp

## Empty State

When no YAACC servers are configured:

```
┌─────────────────────────────────────────┐
│  YAACC (DLNA/UPnP) Servers             │
│  ┌───────────────────────────────────┐ │
│  │                                   │ │
│  │   No YAACC/DLNA servers          │ │
│  │        configured                 │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

## Server Card States

### Connected
```
┌─────────────────────────────────────┐
│  Living Room DLNA          ✓ (green)│
│  http://192.168.1.102:8200          │
│  [Test]              [Delete]        │
└─────────────────────────────────────┘
```

### Disconnected
```
┌─────────────────────────────────────┐
│  Bedroom DLNA              ⚠ (red)  │
│  http://192.168.1.103:8200          │
│  [Test]              [Delete]        │
└─────────────────────────────────────┘
```

## Theme Compatibility

The YAACC integration works with all CleverFerret themes:
- ✅ NAVY_GOLD
- ✅ BURGUNDY_ROSE_GOLD  
- ✅ SAGE_COPPER
- ✅ SLATE_AMBER
- ✅ PLUM_GOLD
- ✅ TEAL_BRONZE
- ✅ All other custom themes

Both light and dark modes are fully supported with automatic color adaptation.

## Accessibility

- ✅ Proper content descriptions for icons
- ✅ Sufficient color contrast
- ✅ Touch targets meet minimum size requirements
- ✅ Screen reader friendly
- ✅ Keyboard navigation support (via Compose)

## Responsive Design

The UI adapts to different screen sizes:
- Phone portrait: Full width cards
- Phone landscape: Full width cards with scrolling
- Tablet: Optimized spacing and layout
- Foldables: Responsive to screen changes
