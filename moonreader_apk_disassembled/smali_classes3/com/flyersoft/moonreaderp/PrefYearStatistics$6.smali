.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;
.super Landroid/os/Handler;
.source "PrefYearStatistics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->listYears()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;Landroid/os/Looper;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 514
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->val$width:I

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 516
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    array-length p1, p1

    .line 517
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 518
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 519
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    aget v3, v3, v2

    if-ne v3, v0, :cond_0

    move p1, v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 521
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->horizontalScrollView1:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/HorizontalScrollView;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->val$width:I

    mul-int v2, v2, p1

    invoke-virtual {v0, v2, v1}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    return-void
.end method
