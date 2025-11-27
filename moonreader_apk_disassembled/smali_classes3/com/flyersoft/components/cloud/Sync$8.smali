.class Lcom/flyersoft/components/cloud/Sync$8;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->uploadShelfBooksFinal(Ljava/lang/String;)V
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

    .line 502
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$8;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterUpload(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 505
    const-string v0, "403"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 507
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$8;->val$filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smrecordUploadedFile(Ljava/lang/String;)V

    .line 508
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smuploadShelfBooksFinal(Ljava/lang/String;)V

    return-void
.end method
