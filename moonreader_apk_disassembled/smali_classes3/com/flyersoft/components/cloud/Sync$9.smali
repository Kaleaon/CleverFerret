.class Lcom/flyersoft/components/cloud/Sync$9;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->downloadPdfCloudIsNewer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$filename:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 529
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$9;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 0

    if-eqz p1, :cond_0

    .line 534
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$9;->val$filename:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->bytes2File([BLjava/lang/String;)Z

    .line 535
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdownloadPdfCloudIsNewer()V

    return-void
.end method
