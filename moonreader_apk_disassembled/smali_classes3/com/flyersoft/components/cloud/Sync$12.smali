.class Lcom/flyersoft/components/cloud/Sync$12;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateCoversViaCloud()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 638
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 6

    .line 641
    invoke-static {p1}, Lcom/flyersoft/tools/T;->ByteArrayOutputStream2String(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;

    move-result-object p1

    .line 642
    sget-object p2, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 643
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p1

    .line 644
    sget p2, Lcom/flyersoft/tools/A;->syncType:I

    const/4 p3, 0x6

    const/4 p4, 0x1

    if-ne p2, p3, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p1, p2, p4, p4}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdownloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V

    .line 645
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    sget p1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->getShelfCoversDeviceFile(I)Ljava/lang/String;

    move-result-object v1

    sget-object p1, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    .line 646
    invoke-static {p1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 645
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    :cond_1
    return-void
.end method
