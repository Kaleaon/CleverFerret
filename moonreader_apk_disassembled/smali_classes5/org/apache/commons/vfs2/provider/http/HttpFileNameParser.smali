.class public Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;
.super Lorg/apache/commons/vfs2/provider/URLFileNameParser;
.source "HttpFileNameParser.java"


# static fields
.field private static final DEFAULT_PORT:I = 0x50

.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x50

    .line 31
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;-><init>(I)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 35
    sget-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;

    return-object v0
.end method
