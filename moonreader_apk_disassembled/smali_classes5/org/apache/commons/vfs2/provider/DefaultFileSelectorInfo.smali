.class final Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;
.super Ljava/lang/Object;
.source "DefaultFileSelectorInfo.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelectInfo;


# instance fields
.field private baseFolder:Lorg/apache/commons/vfs2/FileObject;

.field private depth:I

.field private file:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBaseFolder()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 33
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->baseFolder:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getDepth()I
    .locals 1

    .line 51
    iget v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->depth:I

    return v0
.end method

.method public getFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->file:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public setBaseFolder(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->baseFolder:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method

.method public setDepth(I)V
    .locals 0

    .line 55
    iput p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->depth:I

    return-void
.end method

.method public setFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->file:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " [baseFolder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->baseFolder:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", file="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", depth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->depth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
