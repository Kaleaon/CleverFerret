.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initCalendar()V
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

    .line 264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSelected(Ljava/util/Date;)V
    .locals 3

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    .line 268
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mgetSelectedDayBooks(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    .line 269
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 270
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setRvVisible(I)V

    .line 271
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mlistBooks(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    return-void

    .line 273
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setRvVisible(I)V

    return-void
.end method

.method public onDateUnselected(Ljava/util/Date;)V
    .locals 0

    return-void
.end method
