.class public Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;
.super Lorg/apache/commons/vfs2/provider/URLFileNameParser;
.source "HttpsFileNameParser.java"


# static fields
.field private static final DEFAULT_PORT:I = 0x1bb

.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x1bb

    .line 31
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;-><init>(I)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 35
    sget-object v0, Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;

    return-object v0
.end method
