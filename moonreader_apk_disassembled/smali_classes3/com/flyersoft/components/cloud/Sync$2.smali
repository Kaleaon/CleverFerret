.class Lcom/flyersoft/components/cloud/Sync$2;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$forceSync:Z

.field final synthetic val$syncMsg:Z


# direct methods
.method constructor <init>(ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 126
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$2;->val$forceSync:Z

    iput-boolean p2, p0, Lcom/flyersoft/components/cloud/Sync$2;->val$syncMsg:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 0

    .line 129
    iget-boolean p3, p0, Lcom/flyersoft/components/cloud/Sync$2;->val$forceSync:Z

    iget-boolean p4, p0, Lcom/flyersoft/components/cloud/Sync$2;->val$syncMsg:Z

    invoke-static {p1, p2, p3, p4}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdealDownloadedCloudPosition(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;ZZ)V

    return-void
.end method
