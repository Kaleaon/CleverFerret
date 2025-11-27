.class Lcom/flyersoft/components/cloud/Sync$13;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloud(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checkSyncRecords:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 658
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$13;->val$checkSyncRecords:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 0

    .line 661
    invoke-static {p1}, Lcom/flyersoft/tools/T;->ByteArrayOutputStream2String(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;

    move-result-object p1

    .line 662
    sget-object p2, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 663
    sput-boolean p1, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z

    return-void

    .line 666
    :cond_0
    iget-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$13;->val$checkSyncRecords:Z

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smupdateBookListViaCloudFinal(Z)V

    return-void
.end method
