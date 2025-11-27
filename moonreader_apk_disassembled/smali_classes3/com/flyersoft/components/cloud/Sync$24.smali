.class Lcom/flyersoft/components/cloud/Sync$24;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCoversFinal(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$coverName:Ljava/lang/String;

.field final synthetic val$curCoverFile:Ljava/lang/String;

.field final synthetic val$uploadCoversAfterDownload:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1129
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$coverName:Ljava/lang/String;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$curCoverFile:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$uploadCoversAfterDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 9

    const/4 p2, 0x3

    if-eqz p1, :cond_5

    .line 1133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$coverName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1134
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$curCoverFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    cmp-long v6, v1, v3

    if-lez v6, :cond_0

    .line 1135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x6

    invoke-virtual {v0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_3.png"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1136
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1137
    invoke-static {v0}, Lcom/flyersoft/tools/A;->deleteShelfImageCache(Ljava/lang/String;)V

    .line 1140
    :cond_1
    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_4

    .line 1141
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1142
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {p1, v1}, Lcom/flyersoft/tools/T;->bytes2File([BLjava/lang/String;)Z

    .line 1143
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v6

    const/4 p1, 0x2

    const/4 v2, 0x1

    cmp-long v8, p3, v3

    if-lez v8, :cond_2

    cmp-long v3, v6, p3

    if-eqz v3, :cond_2

    .line 1145
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "should be "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const-string v4, "#SIZE ERROR#"

    aput-object v4, v0, v5

    aput-object v3, v0, v2

    aput-object p3, v0, p1

    aput-object p4, v0, p2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    .line 1147
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 1149
    invoke-static {v1, v0, v2}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto :goto_0

    .line 1151
    :cond_3
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    new-array p1, p1, [Ljava/lang/Object;

    const-string p4, "******broken image"

    aput-object p4, p1, v5

    aput-object p3, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1152
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->addToDownloadedShelfList(Ljava/lang/String;)V

    .line 1155
    :goto_0
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    goto :goto_1

    .line 1157
    :cond_4
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->bytes2File([BLjava/lang/String;)Z

    .line 1161
    :cond_5
    :goto_1
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfgetcoverDownloadList2()Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfgetcoverDownloadList2()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    rem-int/2addr p1, p2

    if-nez p1, :cond_7

    :cond_6
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 1162
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance p2, Lcom/flyersoft/components/cloud/Sync$24$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/cloud/Sync$24$1;-><init>(Lcom/flyersoft/components/cloud/Sync$24;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1169
    :cond_7
    iget-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$24;->val$uploadCoversAfterDownload:Z

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdownloadShelfBookCoversFinal(Z)V

    return-void
.end method
