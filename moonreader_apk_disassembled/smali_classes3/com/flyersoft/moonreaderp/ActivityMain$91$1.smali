.class Lcom/flyersoft/moonreaderp/ActivityMain$91$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$91;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$91;

.field final synthetic val$cloudFile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$91;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8952
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$91;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;->val$cloudFile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 3

    .line 8955
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 8956
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$91;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$91;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    check-cast p1, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v2}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$91$1;->val$cloudFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/flyersoft/components/cloud/Sync;->doAfterDownloadBookFileFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
