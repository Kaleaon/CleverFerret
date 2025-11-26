.class public Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;
.super Ljava/lang/Object;
.source "GetSharedLinkMetadataArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected linkPassword:Ljava/lang/String;

.field protected path:Ljava/lang/String;

.field protected final url:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 134
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->url:Ljava/lang/String;

    const/4 p1, 0x0

    .line 135
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->path:Ljava/lang/String;

    .line 136
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->linkPassword:Ljava/lang/String;

    return-void

    .line 132
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'url\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;
    .locals 4

    .line 182
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->url:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->path:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->linkPassword:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;
    .locals 0

    .line 171
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->linkPassword:Ljava/lang/String;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 154
    const-string v0, "/(.|[\\r\\n])*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 155
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 158
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->path:Ljava/lang/String;

    return-object p0
.end method
