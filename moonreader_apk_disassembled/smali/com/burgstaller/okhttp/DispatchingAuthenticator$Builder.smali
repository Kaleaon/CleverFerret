.class public final Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;
.super Ljava/lang/Object;
.source "DispatchingAuthenticator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/burgstaller/okhttp/DispatchingAuthenticator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field registry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lokhttp3/Authenticator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->registry:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public build()Lcom/burgstaller/okhttp/DispatchingAuthenticator;
    .locals 3

    .line 72
    new-instance v0, Lcom/burgstaller/okhttp/DispatchingAuthenticator;

    iget-object v1, p0, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->registry:Ljava/util/Map;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/burgstaller/okhttp/DispatchingAuthenticator;-><init>(Ljava/util/Map;Lcom/burgstaller/okhttp/DispatchingAuthenticator$1;)V

    return-object v0
.end method

.method public with(Ljava/lang/String;Lokhttp3/Authenticator;)Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->registry:Ljava/util/Map;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
