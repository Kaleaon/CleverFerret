.class Lcom/flyersoft/components/cloud/Sync$26;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->openShelfBookFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1218
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$26;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 2

    .line 1221
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1222
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$26;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    check-cast p1, Ljava/lang/String;

    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/components/cloud/Sync;->doAfterDownloadBookFileFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
