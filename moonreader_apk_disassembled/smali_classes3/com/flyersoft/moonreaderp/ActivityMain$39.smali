.class Lcom/flyersoft/moonreaderp/ActivityMain$39;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->clearStatisticsForSelected(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb1:Landroid/widget/CheckBox;

.field final synthetic val$cb2:Landroid/widget/CheckBox;

.field final synthetic val$selected:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/CheckBox;Ljava/util/ArrayList;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 3919
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$cb1:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$selected:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$cb2:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 3922
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$cb1:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 3923
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$selected:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 3924
    invoke-static {p2}, Lcom/flyersoft/tools/BookDb;->deleteStatistics(Ljava/lang/String;)I

    goto :goto_0

    .line 3926
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$cb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 3927
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string p2, "positions10"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 3928
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$selected:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 3929
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    .line 3930
    :cond_1
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3932
    :cond_2
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 p2, 0x1

    if-nez p1, :cond_3

    .line 3933
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->val$cb2:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateRecentList(ZZ)V

    .line 3934
    :cond_3
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    if-ne p1, p2, :cond_4

    .line 3935
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 3936
    :cond_4
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 p2, 0x2

    if-ne p1, p2, :cond_5

    .line 3937
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_5
    return-void
.end method
