.class Lcom/flyersoft/components/cloud/Sync$30;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->addCloudFilesToShelf(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Landroid/widget/CheckBox;Ljava/util/ArrayList;Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1415
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$edit:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$cb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$files:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1417
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1418
    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    sput-boolean p2, Lcom/flyersoft/tools/A;->fileImportWithFav:Z

    .line 1420
    :try_start_0
    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    sget-boolean p2, Lcom/flyersoft/tools/A;->fileImportWithFav:Z

    if-eqz p2, :cond_0

    .line 1421
    const-string p1, "default_fav"

    .line 1422
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$files:Ljava/util/ArrayList;

    invoke-static {p2, p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smaddCloudFilesToShelfFinal(Ljava/util/ArrayList;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1424
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1426
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$30;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    return-void
.end method
