.class final Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;
.super Lorg/apache/commons/vfs2/util/MonitorInputStream;
.source "DefaultFileContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/DefaultFileContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FileContentInputStream"
.end annotation


# instance fields
.field private final file:Lorg/apache/commons/vfs2/FileObject;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Ljava/io/InputStream;)V
    .locals 0

    .line 559
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    .line 560
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/util/MonitorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 561
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->file:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 570
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 572
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/close-instr.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected onClose()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 582
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorInputStream;->onClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 584
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v0, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$000(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v1, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$000(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;)V

    throw v0
.end method
