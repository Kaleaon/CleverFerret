.class public abstract Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;
.super Ljava/lang/Object;
.source "AbstractFileNameParser.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/FileNameParser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encodeCharacter(C)Z
    .locals 1

    const/16 v0, 0x25

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
