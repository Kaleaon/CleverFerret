.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 118
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    if-nez p1, :cond_0

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mchangeRangedMode(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 122
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 123
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->show()V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dismiss()V

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mShareImg(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    .line 129
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dismiss()V

    :cond_3
    return-void
.end method
