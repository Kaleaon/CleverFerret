.class Lcom/dropbox/core/util/IOUtil$1;
.super Ljava/io/InputStream;
.source "IOUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/util/IOUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 212
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public read()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method public read([B)I
    .locals 0

    const/4 p1, -0x1

    return p1
.end method

.method public read([BII)I
    .locals 0

    const/4 p1, -0x1

    return p1
.end method
