.class final Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;
.super Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;
.source "DefaultFileContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/DefaultFileContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FileRandomAccessContent"
.end annotation


# instance fields
.field private final file:Lorg/apache/commons/vfs2/FileObject;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 0

    .line 596
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    .line 597
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/RandomAccessContent;)V

    .line 598
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->file:Lorg/apache/commons/vfs2/FileObject;

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

    .line 616
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 618
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/close-rac.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->file:Lorg/apache/commons/vfs2/FileObject;

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

    .line 607
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->onClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 609
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v0, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$100(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/RandomAccessContent;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->this$0:Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-static {v1, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->access$100(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/RandomAccessContent;)V

    throw v0
.end method
