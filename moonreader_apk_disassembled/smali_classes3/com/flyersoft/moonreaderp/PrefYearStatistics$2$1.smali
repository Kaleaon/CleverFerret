.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    if-nez p1, :cond_0

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    const/4 v1, -0x1

    invoke-static {v0, v1, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mshowOptions(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 115
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 116
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->show()V

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dismiss()V

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 120
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mshareAsImage(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    :cond_2
    return-void
.end method
