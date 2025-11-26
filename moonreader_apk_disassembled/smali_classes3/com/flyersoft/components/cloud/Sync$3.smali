.class Lcom/flyersoft/components/cloud/Sync$3;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->downloadCloudNoteFile()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 0

    .line 191
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdealDownloadedCloudNote(Ljava/io/ByteArrayOutputStream;)V

    return-void
.end method
