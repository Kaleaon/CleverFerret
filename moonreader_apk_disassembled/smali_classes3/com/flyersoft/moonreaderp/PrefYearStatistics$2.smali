.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 104
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 107
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->calendar:I

    .line 108
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->share:I

    .line 109
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    .line 111
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2$1;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    .line 124
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
