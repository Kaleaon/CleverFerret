.class final Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;
.super Lorg/apache/commons/vfs2/util/MonitorOutputStream;
.source "DefaultFileContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/DefaultFileContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "FileContentOutputStream"
.end annotation


# instance fields
.field private final file:Lorg/apache/commons/vfs2/FileObject;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Ljava/io/OutputStream;)V
    .locals 0

    .line 630
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    .line 631
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/util/MonitorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 632
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->file:Lorg/apache/commons/vfs2/FileObject;

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

    .line 641
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 643
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/close-outstr.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected onClose()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 653
    const-string v0, "vfs.provider/close-outstr.error"

    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorOutputStream;->onClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 656
    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$200(Lorg/apache/commons/vfs2/provider/DefaultFileContent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 658
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {v2, v0, v3, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2

    :catchall_0
    move-exception v1

    .line 656
    :try_start_2
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v2}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$200(Lorg/apache/commons/vfs2/provider/DefaultFileContent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 658
    throw v1

    :catch_1
    move-exception v1

    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {v2, v0, v3, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2
.end method
