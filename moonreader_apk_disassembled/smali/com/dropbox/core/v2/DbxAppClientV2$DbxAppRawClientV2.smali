.class final Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;
.super Lcom/dropbox/core/v2/DbxRawClientV2;
.source "DbxAppClientV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/DbxAppClientV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DbxAppRawClientV2"
.end annotation


# instance fields
.field private final key:Ljava/lang/String;

.field private final secret:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, p4, p5, v0}, Lcom/dropbox/core/v2/DbxRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;)V

    .line 76
    iput-object p2, p0, Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;->key:Ljava/lang/String;

    .line 77
    iput-object p3, p0, Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;->secret:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Lcom/dropbox/core/v2/DbxAppClientV2$1;)V
    .locals 0

    .line 70
    invoke-direct/range {p0 .. p5}, Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected addAuthHeaders(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)V"
        }
    .end annotation

    .line 98
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->removeAuthHeader(Ljava/util/List;)Ljava/util/List;

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxAppClientV2$DbxAppRawClientV2;->secret:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/dropbox/core/DbxRequestUtil;->addBasicAuthHeader(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    return-void
.end method

.method public canRefreshAccessToken()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public needsRefreshAccessToken()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public refreshAccessToken()Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected withPathRoot(Lcom/dropbox/core/v2/common/PathRoot;)Lcom/dropbox/core/v2/DbxRawClientV2;
    .locals 1

    .line 104
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "App endpoints don\'t support Dropbox-API-Path-Root header."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
