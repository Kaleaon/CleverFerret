.class public Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileContentInfoFactory;
.super Ljava/lang/Object;
.source "HdfsFileContentInfoFactory.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContentInfoFactory;


# static fields
.field private static final CONTENT:Ljava/lang/String; = "text/plain"

.field private static final ENCODING:Ljava/lang/String; = "UTF-8"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/commons/vfs2/FileContent;)Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 43
    new-instance p1, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;

    const-string v0, "text/plain"

    const-string v1, "UTF-8"

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method
