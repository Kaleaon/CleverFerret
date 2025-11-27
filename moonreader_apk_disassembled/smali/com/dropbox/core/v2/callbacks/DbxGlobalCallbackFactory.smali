.class public interface abstract Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;
.super Ljava/lang/Object;
.source "DbxGlobalCallbackFactory.java"


# virtual methods
.method public abstract createNetworkErrorCallback(Ljava/lang/String;)Lcom/dropbox/core/v2/callbacks/DbxNetworkErrorCallback;
.end method

.method public abstract createRouteErrorCallback(Ljava/lang/String;Ljava/lang/Object;)Lcom/dropbox/core/v2/callbacks/DbxRouteErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)",
            "Lcom/dropbox/core/v2/callbacks/DbxRouteErrorCallback<",
            "TT;>;"
        }
    .end annotation
.end method
