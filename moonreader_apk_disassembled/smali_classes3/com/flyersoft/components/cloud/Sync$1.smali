.class Lcom/flyersoft/components/cloud/Sync$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->uploadCloudPositionFile(ZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$syncMsg:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 75
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$1;->val$syncMsg:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterUpload(Ljava/lang/String;)V
    .locals 1

    .line 78
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Sync$1;->val$syncMsg:Z

    invoke-static {p1, v0}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdealUploadedCloudPosition(Ljava/lang/String;Z)V

    return-void
.end method
