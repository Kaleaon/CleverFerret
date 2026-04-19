package com.cleverferret.v2.feature.opds.ui

import com.cleverferret.v2.core.common.error.AppError

sealed interface OpdsUiErrorMessage {
    val message: String
    val reportFeedUrlAction: Boolean

    data class FeedParseError(override val reportFeedUrlAction: Boolean = true) : OpdsUiErrorMessage {
        override val message: String = "Feed parse error"
    }

    data class NetworkTimeout(override val reportFeedUrlAction: Boolean = true) : OpdsUiErrorMessage {
        override val message: String = "Network timeout"
    }

    data class UnsupportedAcquisitionLink(override val reportFeedUrlAction: Boolean = false) : OpdsUiErrorMessage {
        override val message: String = "Unsupported acquisition link"
    }

    data class Generic(override val message: String, override val reportFeedUrlAction: Boolean) : OpdsUiErrorMessage
}

object OpdsUiErrorMapper {
    fun map(error: AppError): OpdsUiErrorMessage = when (error) {
        is AppError.ParsingFailure -> OpdsUiErrorMessage.FeedParseError()
        is AppError.TransportFailure -> if (error.timeout) OpdsUiErrorMessage.NetworkTimeout() else OpdsUiErrorMessage.Generic(error.message, true)
        is AppError.ExternalServiceFailure -> if (error.errorCode == "UNSUPPORTED_ACQUISITION") {
            OpdsUiErrorMessage.UnsupportedAcquisitionLink()
        } else {
            OpdsUiErrorMessage.Generic(error.message, true)
        }
        else -> OpdsUiErrorMessage.Generic(error.message, true)
    }
}
