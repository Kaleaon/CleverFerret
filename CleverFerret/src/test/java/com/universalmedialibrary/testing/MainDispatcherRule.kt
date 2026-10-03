package com.universalmedialibrary.testing

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.setMain
import org.junit.rules.TestWatcher
import org.junit.runner.Description

/**
 * Swaps `Dispatchers.Main` for a [TestDispatcher] for the duration of a test.
 *
 * Pair with `runTest { ... }` and Turbine for `StateFlow` assertions in
 * `ViewModel` tests. Defaults to [StandardTestDispatcher]; pass an
 * `UnconfinedTestDispatcher` when a test needs eager dispatch.
 *
 * Example:
 * ```
 * @get:Rule val mainDispatcherRule = MainDispatcherRule()
 *
 * @Test fun emits_loaded_state() = runTest {
 *     viewModel.state.test {
 *         assertThat(awaitItem()).isEqualTo(UiState.Loading)
 *         assertThat(awaitItem()).isInstanceOf(UiState.Loaded::class.java)
 *     }
 * }
 * ```
 */
@OptIn(ExperimentalCoroutinesApi::class)
class MainDispatcherRule(
    val testDispatcher: TestDispatcher = StandardTestDispatcher(),
) : TestWatcher() {
    override fun starting(description: Description) {
        Dispatchers.setMain(testDispatcher)
    }

    override fun finished(description: Description) {
        Dispatchers.resetMain()
    }
}
