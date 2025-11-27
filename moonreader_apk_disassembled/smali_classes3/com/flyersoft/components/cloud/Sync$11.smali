.class Lcom/flyersoft/components/cloud/Sync$11;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCoversFinal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$local:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 612
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$11;->val$local:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterUpload(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 615
    const-string v0, "403"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 617
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$11;->val$local:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smrecordUploadedFile(Ljava/lang/String;)V

    .line 618
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smuploadShelfBookCoversFinal()V

    return-void
.end method
