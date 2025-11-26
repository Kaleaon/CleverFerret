.class Lcom/flyersoft/components/cloud/Sync$21$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$21;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$21;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$21;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 974
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$21$1;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 977
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$21$1;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Sync$21;->val$readyUploadBookList:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$21$1;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    iget-object p2, p2, Lcom/flyersoft/components/cloud/Sync$21;->val$newBooks:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$21$1;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Sync$21;->val$cloudBooks:Ljava/util/List;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$21$1;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    iget-boolean v1, v1, Lcom/flyersoft/components/cloud/Sync$21;->val$fromSyncFromMenu:Z

    invoke-static {p1, p2, v0, v1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smupdateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V

    return-void
.end method
