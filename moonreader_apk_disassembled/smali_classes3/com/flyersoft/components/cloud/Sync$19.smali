.class Lcom/flyersoft/components/cloud/Sync$19;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$newBooks:Ljava/util/ArrayList;

.field final synthetic val$readyUploadBookList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 955
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$19;->val$readyUploadBookList:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$19;->val$newBooks:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 957
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$19;->val$readyUploadBookList:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$19;->val$newBooks:Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-static {v0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smaddCloudBooksToShelf(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    return-void
.end method
