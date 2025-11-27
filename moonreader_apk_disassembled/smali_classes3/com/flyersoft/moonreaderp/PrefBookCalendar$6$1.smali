.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 332
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 1

    .line 334
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 335
    invoke-virtual {p1, p2, p3, p4}, Ljava/util/Calendar;->set(III)V

    .line 336
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    .line 337
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthBegin:Ljava/util/Calendar;

    invoke-virtual {p3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    cmp-long v0, p1, p3

    if-ltz v0, :cond_0

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthEnd:Ljava/util/Calendar;

    invoke-virtual {p3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    cmp-long v0, p1, p3

    if-gtz v0, :cond_0

    .line 338
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {p3, p1, p2}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mshowCalendar(Lcom/flyersoft/moonreaderp/PrefBookCalendar;J)V

    return-void

    .line 340
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->no_more_found:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
