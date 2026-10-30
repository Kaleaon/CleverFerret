package com.cleverferret.v2.feature.widgets.di

import com.cleverferret.v2.feature.widgets.api.WidgetsFeatureApi
import com.cleverferret.v2.feature.widgets.widget.MediaLibraryWidget

object WidgetsFeatureModule {
    fun provideWidgetsFeatureApi(): WidgetsFeatureApi = MediaLibraryWidget()
}
