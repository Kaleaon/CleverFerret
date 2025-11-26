.class Lcom/flyersoft/moonreaderp/ActivityMain$111;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->removeBooksFromHistory(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9823
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 9825
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->val$files:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 9826
    invoke-static {p2}, Lcom/flyersoft/tools/A;->removeHistory(Ljava/lang/String;)V

    .line 9827
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 9828
    sget v1, Lcom/flyersoft/tools/A;->files_type:I

    if-nez v1, :cond_1

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 9829
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputfolderFileCount(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    .line 9830
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteSingeBook(Ljava/lang/String;Z)Z

    .line 9831
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->sd_grant_dlg:Lcom/flyersoft/components/MyDialog;

    if-eqz p2, :cond_0

    .line 9835
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 9836
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateRecentList(ZZ)V

    .line 9837
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAllShelfSorts()V

    return-void
.end method
