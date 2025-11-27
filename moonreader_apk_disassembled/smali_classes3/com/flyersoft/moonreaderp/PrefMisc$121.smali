.class Lcom/flyersoft/moonreaderp/PrefMisc$121;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showStdCloudOptions(Landroid/content/Context;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I

.field final synthetic val$manualB:Landroid/widget/CheckBox;

.field final synthetic val$pathEt:Landroid/widget/EditText;

.field final synthetic val$syncMenuB:Landroid/widget/CheckBox;

.field final synthetic val$syncMsg:Landroid/widget/CheckBox;

.field final synthetic val$syncProgress:Landroid/widget/CheckBox;

.field final synthetic val$syncShelf:Landroid/widget/CheckBox;

.field final synthetic val$syncWiFiB:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3373
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncProgress:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncShelf:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncMsg:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$manualB:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncMenuB:Landroid/widget/CheckBox;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncWiFiB:Landroid/widget/CheckBox;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$pathEt:Landroid/widget/EditText;

    iput p8, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$cloudType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 3375
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 3376
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncProgress:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->syncProgress:Z

    .line 3377
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncShelf:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 3378
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncMsg:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    .line 3379
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$manualB:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->syncManually:Z

    .line 3380
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncMenuB:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    .line 3381
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$syncWiFiB:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    .line 3383
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$pathEt:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 3384
    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3385
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 3386
    :cond_0
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$121;->val$cloudType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 3387
    sget-object v1, Lcom/flyersoft/tools/A;->dropboxBookPath:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3388
    sput-object p2, Lcom/flyersoft/tools/A;->dropboxBookPath:Ljava/lang/String;

    goto :goto_0

    .line 3391
    :cond_1
    sget-object v1, Lcom/flyersoft/tools/A;->gdriveBookPath:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3392
    sput-object p2, Lcom/flyersoft/tools/A;->gdriveBookPath:Ljava/lang/String;

    .line 3396
    :cond_2
    :goto_0
    sget-boolean p2, Lcom/flyersoft/tools/A;->syncManually:Z

    const/4 v0, 0x1

    if-eqz p2, :cond_3

    .line 3397
    invoke-static {v0}, Lcom/flyersoft/components/DragSort/ReaderBar;->setCloudButtons(Z)V

    .line 3399
    :cond_3
    sget-boolean p2, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eq p1, p2, :cond_4

    .line 3400
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz p1, :cond_4

    .line 3401
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->doSyncShelf(Z)V

    :cond_4
    return-void
.end method
