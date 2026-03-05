package com.cleverferret.v2.core.ui.theme;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Adapter boundary between core:ui semantic roles and GitHub.com/kaleaon/ktheme themes.
 *
 * <p>Compatibility rules for future ktheme updates:
 * - Only depend on required baseline color fields.
 * - Preserve unknown/future fields in {@code passthroughRoles}.
 * - Keep semantic role mapping stable for feature modules.</p>
 */
public final class KthemeThemeAdapterV1 {
    private KthemeThemeAdapterV1() {}

    public record KthemeSnapshot(
            String id,
            boolean darkMode,
            String primary,
            String onPrimary,
            String background,
            String onBackground,
            String surface,
            String onSurface,
            String outline,
            String error,
            String onError,
            Map<String, String> passthroughRoles
    ) {}

    public record SemanticTheme(
            String id,
            boolean dark,
            Map<String, String> semanticColors,
            Map<String, String> passthroughRoles
    ) {}

    public static SemanticTheme adapt(KthemeSnapshot snapshot) {
        Map<String, String> semantic = new LinkedHashMap<>();
        semantic.put("color.action.primary", snapshot.primary());
        semantic.put("color.content.inverse", snapshot.onPrimary());
        semantic.put("color.surface.background", snapshot.background());
        semantic.put("color.content.primary", snapshot.onBackground());
        semantic.put("color.surface.elevated", snapshot.surface());
        semantic.put("color.content.secondary", snapshot.onSurface());
        semantic.put("color.border.default", snapshot.outline());
        semantic.put("color.state.error", snapshot.error());
        semantic.put("color.content.error", snapshot.onError());

        return new SemanticTheme(
                snapshot.id(),
                snapshot.darkMode(),
                Map.copyOf(semantic),
                snapshot.passthroughRoles() == null ? Map.of() : Map.copyOf(snapshot.passthroughRoles())
        );
    }
}
