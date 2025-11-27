.class public Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;
.super Ljava/lang/Object;
.source "ThumbnailArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/ThumbnailArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

.field protected mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

.field protected final path:Ljava/lang/String;

.field protected size:Lcom/dropbox/core/v2/files/ThumbnailSize;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 167
    const-string v0, "(/(.|[\\r\\n])*|id:.*)|(rev:[0-9a-f]{9,})|(ns:[0-9]+(/.*)?)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->path:Ljava/lang/String;

    .line 171
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailFormat;->JPEG:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    .line 172
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailSize;->W64H64:Lcom/dropbox/core/v2/files/ThumbnailSize;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    .line 173
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailMode;->STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-void

    .line 168
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 165
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'path\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/ThumbnailArg;
    .locals 5

    .line 260
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/files/ThumbnailArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ThumbnailFormat;Lcom/dropbox/core/v2/files/ThumbnailSize;Lcom/dropbox/core/v2/files/ThumbnailMode;)V

    return-object v0
.end method

.method public withFormat(Lcom/dropbox/core/v2/files/ThumbnailFormat;)Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 195
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    return-object p0

    .line 198
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailFormat;->JPEG:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    return-object p0
.end method

.method public withMode(Lcom/dropbox/core/v2/files/ThumbnailMode;)Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 245
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-object p0

    .line 248
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailMode;->STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-object p0
.end method

.method public withSize(Lcom/dropbox/core/v2/files/ThumbnailSize;)Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 220
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    return-object p0

    .line 223
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/ThumbnailSize;->W64H64:Lcom/dropbox/core/v2/files/ThumbnailSize;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    return-object p0
.end method
