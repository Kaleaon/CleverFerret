package com.cleverferret.v2.app

import com.cleverferret.v2.app.navigation.AppNavigationCatalog
import com.cleverferret.v2.app.navigation.V2NavigationGraph
import java.util.logging.Level
import java.util.logging.Logger

private val logger: Logger = Logger.getLogger("CleverFerretV2")

fun main() {
    logger.log(Level.INFO, "CleverFerretV2 composition root")
    logger.log(Level.INFO, "Top-level domains: ${V2NavigationGraph.TopLevelDomain.entries.size}")
    logger.log(Level.INFO, "Canonical routes: ${AppNavigationCatalog.allRoutes.size}")
}
