package com.cleverferret.v2.core.ui

import com.cleverferret.v2.core.ui.accessibility.AccessibilityAcceptanceV1
import com.cleverferret.v2.core.ui.accessibility.AccessibilityInstrumentationCatalogV1
import com.cleverferret.v2.core.ui.components.ComponentCatalogV1
import com.cleverferret.v2.core.ui.components.SnapshotCoverageV1
import com.cleverferret.v2.core.ui.components.ComponentCatalogV1.SampleState
import com.cleverferret.v2.core.ui.tokens.DesignTokensV1
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class DesignSystemContractsV1Test {
    @Test
    fun spacingScale_containsExpectedBaselineTokens() {
        assertEquals(4, DesignTokensV1.spacing("space.1"))
        assertEquals(16, DesignTokensV1.spacing("space.4"))
        assertEquals(64, DesignTokensV1.spacing("space.16"))
    }

    @Test
    fun componentCatalog_requiresDefaultLoadingEmptyErrorStates() {
        val gaps = ComponentCatalogV1.conformanceGaps(
            catalogStates = ComponentCatalogV1.REQUIRED_COMPONENTS.associate { component ->
                component.name to setOf(
                    SampleState.DEFAULT,
                    SampleState.LOADING,
                    SampleState.EMPTY,
                    SampleState.ERROR,
                )
            },
        )
        assertTrue(gaps.isEmpty(), "All catalog components should advertise required sample states")
    }

    @Test
    fun snapshotCoverage_includesLightDarkWithReaderOverlayScenarios() {
        val scenarios = SnapshotCoverageV1.requiredScenarios("MediaCard")
        assertTrue(scenarios.any { it.themeMode == SnapshotCoverageV1.ThemeMode.LIGHT })
        assertTrue(scenarios.any { it.themeMode == SnapshotCoverageV1.ThemeMode.DARK })
        assertTrue(scenarios.any { it.readerOverlay == SnapshotCoverageV1.ReaderOverlay.HIGH_CONTRAST_READER })
    }

    @Test
    fun instrumentationCatalog_tracksKeyComponentsForA11yChecks() {
        assertTrue(AccessibilityInstrumentationCatalogV1.KEY_COMPONENTS.contains("MediaCard"))
        assertTrue(AccessibilityInstrumentationCatalogV1.KEY_COMPONENTS.contains("MiniPlayerBar"))
    }

    @Test
    fun accessibilityCriteria_isReleaseBlockingForRequiredGates() {
        assertEquals(200, AccessibilityAcceptanceV1.DYNAMIC_TYPE_MAX_PERCENT)
        assertTrue("a11y.contrast" in AccessibilityAcceptanceV1.RELEASE_BLOCKING_CI_GATES)
        assertTrue("a11y.talkback_labels_roles" in AccessibilityAcceptanceV1.RELEASE_BLOCKING_CI_GATES)
        assertTrue("a11y.focus_order" in AccessibilityAcceptanceV1.RELEASE_BLOCKING_CI_GATES)
    }
}
