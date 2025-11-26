.class Lcom/flyersoft/moonreaderp/ActivityMain$44;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->clearAllStatistics()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 4252
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 4254
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 4255
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 4256
    invoke-static {}, Lcom/flyersoft/tools/A;->saveHistory()V

    .line 4257
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getPositionSp()Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4258
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_0
    const-wide/16 p1, 0x0

    .line 4260
    sput-wide p1, Lcom/flyersoft/tools/A;->statistics_pages:J

    .line 4261
    sput-wide p1, Lcom/flyersoft/tools/A;->statistics_words:J

    .line 4262
    sput-wide p1, Lcom/flyersoft/tools/A;->statistics_time:J

    const-wide/16 v0, 0x1

    .line 4263
    sput-wide v0, Lcom/flyersoft/tools/A;->statistics_days:J

    .line 4264
    sput-wide p1, Lcom/flyersoft/tools/A;->statistics_last_day:J

    .line 4265
    invoke-static {}, Lcom/flyersoft/tools/A;->incReadDays()V

    .line 4266
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->deleteAllStatistics()V

    .line 4268
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$44;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
