.class Lcom/flyersoft/components/cloud/Sync$21;
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
.field final synthetic val$cloudBooks:Ljava/util/List;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$fromSyncFromMenu:Z

.field final synthetic val$newBooks:Ljava/util/ArrayList;

.field final synthetic val$readyUploadBookList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 964
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$cloudBooks:Ljava/util/List;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$readyUploadBookList:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$newBooks:Ljava/util/ArrayList;

    iput-boolean p5, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$fromSyncFromMenu:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    const/4 p1, 0x0

    .line 967
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputupdateShelfDlg(Landroidx/appcompat/app/AlertDialog;)V

    .line 968
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$con:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$21;->val$con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->clone_shelf:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "?"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->clone_shelf_tip:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/components/cloud/Sync$21$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/cloud/Sync$21$2;-><init>(Lcom/flyersoft/components/cloud/Sync$21;)V

    const v0, 0x104000a

    .line 969
    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/components/cloud/Sync$21$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/cloud/Sync$21$1;-><init>(Lcom/flyersoft/components/cloud/Sync$21;)V

    const/high16 v0, 0x1040000

    .line 974
    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 p2, 0x0

    .line 979
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
