.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 480
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 482
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 483
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 484
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    const/4 v1, 0x1

    .line 485
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 486
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 487
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 488
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x6

    const/4 v1, -0x1

    .line 489
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->roll(II)V

    .line 490
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    iput-wide v2, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 491
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v2, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v4, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {p1, v2, v3, v4, v5}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$minitDays(Lcom/flyersoft/moonreaderp/PrefYearStatistics;JJ)V

    .line 492
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 493
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetYearsTextColor(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 494
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v2, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetupBarChart(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V

    return-void
.end method
