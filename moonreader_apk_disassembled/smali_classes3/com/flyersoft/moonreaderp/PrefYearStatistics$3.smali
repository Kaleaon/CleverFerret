.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setupBarChart(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

.field final synthetic val$month:I

.field final synthetic val$year:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V
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

    .line 174
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->val$year:I

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->val$month:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNothingSelected()V
    .locals 0

    return-void
.end method

.method public onValueSelected(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)V
    .locals 5

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/highlight/Highlight;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 178
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barMonth:I

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 179
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getX()F

    move-result p1

    float-to-int p1, p1

    .line 180
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget v1, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    invoke-static {p2, v1, p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetupBarChart(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V

    .line 181
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    .line 182
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p2, v1, v2, v0}, Ljava/util/Calendar;->set(III)V

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 184
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    .line 186
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->val$year:I

    invoke-static {v1, p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(II)Ljava/time/YearMonth;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Ljava/time/YearMonth;)I

    move-result p1

    invoke-virtual {p2, v0, v2, p1}, Ljava/util/Calendar;->set(III)V

    .line 187
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 188
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 190
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetYearsTextColor(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    return-void

    .line 192
    :cond_0
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getX()F

    move-result p1

    float-to-int p1, p1

    .line 193
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    .line 194
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->val$month:I

    sub-int/2addr v2, v0

    invoke-virtual {p2, v1, v2, p1}, Ljava/util/Calendar;->set(III)V

    .line 195
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    iput-wide v0, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 196
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    return-void
.end method
