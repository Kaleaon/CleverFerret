.class public Lorg/apache/commons/vfs2/FileChangeEvent;
.super Ljava/lang/Object;
.source "FileChangeEvent.java"


# instance fields
.field private final file:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/apache/commons/vfs2/FileChangeEvent;->file:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method public getFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 38
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileChangeEvent;->file:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method
