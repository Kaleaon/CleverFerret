package com.cleverferret.v2.core.auth

class InMemoryTokenStore : TokenStore {
    private var cached: AuthTokens? = null

    override fun read(): AuthTokens? = cached

    override fun write(tokens: AuthTokens) {
        cached = tokens
    }

    override fun clear() {
        cached = null
    }
}
