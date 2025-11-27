.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
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
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->range_select:I

    .line 115
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->callendarRangeMode:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/components/MyMenu;->SELECT_END:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->statistics_by_year:I

    .line 116
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->share:I

    .line 117
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    .line 118
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    .line 131
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    const/high16 v0, 0x41f00000    # 30.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    neg-int v0, v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyMenu;->show(II)V

    return-void
.end method
