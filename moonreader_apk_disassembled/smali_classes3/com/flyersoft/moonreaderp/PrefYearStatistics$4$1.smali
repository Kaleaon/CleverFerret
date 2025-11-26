.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;Landroid/view/View;)V
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

    .line 336
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 2

    .line 338
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 339
    invoke-virtual {p1, p2, p3, p4}, Ljava/util/Calendar;->set(III)V

    .line 340
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->val$v:Landroid/view/View;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    if-ne p2, p3, :cond_0

    .line 341
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    iput-wide p3, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 342
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p4

    invoke-static {p3, p4}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 343
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    iget-object p4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, p4, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    cmp-long p4, p2, v0

    if-lez p4, :cond_1

    .line 344
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    iput-wide p3, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 345
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 348
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    iput-wide p3, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 349
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p4

    invoke-static {p3, p4}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    iget-object p4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v0, p4, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    cmp-long p4, p2, v0

    if-lez p4, :cond_1

    .line 351
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    iput-wide p3, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 352
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 356
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetYearsTextColor(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 357
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->val$v:Landroid/view/View;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    if-ne p1, p2, :cond_2

    .line 358
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide p3, p3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-virtual {p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result p2

    const/4 p3, -0x1

    invoke-static {p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$msetupBarChart(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V

    :cond_2
    return-void
.end method
