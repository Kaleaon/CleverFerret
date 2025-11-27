.class public abstract Lorg/apache/commons/vfs2/operations/AbstractFileOperation;
.super Ljava/lang/Object;
.source "AbstractFileOperation.java"

# interfaces
.implements Lorg/apache/commons/vfs2/operations/FileOperation;


# instance fields
.field private final fileObject:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperation;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method protected getFileObject()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperation;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method
