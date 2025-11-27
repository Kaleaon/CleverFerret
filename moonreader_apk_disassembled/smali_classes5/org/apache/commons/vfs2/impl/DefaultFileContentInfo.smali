.class public Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;
.super Ljava/lang/Object;
.source "DefaultFileContentInfo.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContentInfo;


# instance fields
.field private final contentEncoding:Ljava/lang/String;

.field private final contentType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;->contentType:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;->contentEncoding:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getContentEncoding()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;->contentEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;->contentType:Ljava/lang/String;

    return-object v0
.end method
