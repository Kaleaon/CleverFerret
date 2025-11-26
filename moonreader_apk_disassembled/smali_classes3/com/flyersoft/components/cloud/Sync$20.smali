.class Lcom/flyersoft/components/cloud/Sync$20;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$cloudBooks:Ljava/util/List;

.field final synthetic val$fromSyncFromMenu:Z

.field final synthetic val$ignoreList:Ljava/util/ArrayList;

.field final synthetic val$readyUploadBookList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(ZLandroid/widget/CheckBox;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 981
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$fromSyncFromMenu:Z

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$cb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$ignoreList:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$readyUploadBookList:Ljava/util/ArrayList;

    iput-object p5, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$cloudBooks:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 984
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfgetupdateShelfDlg()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    if-ne p1, v0, :cond_2

    .line 985
    iget-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$fromSyncFromMenu:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 986
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$ignoreList:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->addToDownloadedShelfList(Ljava/util/ArrayList;)V

    .line 987
    :cond_0
    iget-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$fromSyncFromMenu:Z

    if-nez p1, :cond_1

    sget p1, Lcom/flyersoft/components/cloud/Sync;->bookDatabaseUpdated:I

    if-lez p1, :cond_1

    .line 988
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$readyUploadBookList:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->updateBookListToCloud(Ljava/util/ArrayList;)V

    .line 989
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$20;->val$cloudBooks:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const/4 p1, 0x0

    .line 990
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputupdateShelfDlg(Landroidx/appcompat/app/AlertDialog;)V

    :cond_2
    return-void
.end method
