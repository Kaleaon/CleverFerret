.class Lcom/flyersoft/components/cloud/Sync$17;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooks(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudBooks:Ljava/util/List;

.field final synthetic val$fromSyncFromMenu:Z

.field final synthetic val$newBooks:Ljava/util/ArrayList;

.field final synthetic val$readyUploadBookList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 887
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$readyUploadBookList:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$newBooks:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$cloudBooks:Ljava/util/List;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$fromSyncFromMenu:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 890
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->prefShelf:Lcom/flyersoft/moonreaderp/PrefShelf;

    if-eqz v0, :cond_0

    .line 891
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->prefShelf:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->dismiss()V

    .line 892
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->prefAbout:Lcom/flyersoft/moonreaderp/PrefAbout;

    if-eqz v0, :cond_1

    .line 893
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->prefAbout:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefAbout;->dismiss()V

    .line 894
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$readyUploadBookList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$newBooks:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$cloudBooks:Ljava/util/List;

    iget-boolean v3, p0, Lcom/flyersoft/components/cloud/Sync$17;->val$fromSyncFromMenu:Z

    invoke-static {v0, v1, v2, v3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smupdateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V

    return-void
.end method
