.class public Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FluentInitializer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 339
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public displayOnly()Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 2

    .line 396
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fputdisplayOnly(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Z)V

    return-object p0
.end method

.method public inMode(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 1

    .line 342
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iput-object p1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 343
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$mvalidateAndUpdate(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-object p0
.end method

.method public setShortWeekdays([Ljava/lang/String;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 3

    .line 389
    new-instance v0, Ljava/text/DateFormatSymbols;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetlocale(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/Locale;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 390
    invoke-virtual {v0, p1}, Ljava/text/DateFormatSymbols;->setShortWeekdays([Ljava/lang/String;)V

    .line 391
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE"

    invoke-direct {v1, v2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    invoke-static {p1, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fputweekdayNameFormat(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Ljava/text/DateFormat;)V

    return-object p0
.end method

.method public withHighlightedDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 0

    .line 384
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->withHighlightedDates(Ljava/util/Collection;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    return-object p1
.end method

.method public withHighlightedDates(Ljava/util/Collection;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/util/Date;",
            ">;)",
            "Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;"
        }
    .end annotation

    .line 379
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightDates(Ljava/util/Collection;)V

    return-object p0
.end method

.method public withMonthsReverseOrder(Z)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 1

    .line 401
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fputmonthsReverseOrder(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Z)V

    return-object p0
.end method

.method public withSelectedDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 0

    .line 352
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->withSelectedDates(Ljava/util/Collection;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    return-object p1
.end method

.method public withSelectedDates(Ljava/util/Collection;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/util/Date;",
            ">;)",
            "Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;"
        }
    .end annotation

    .line 360
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object v0, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 361
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SINGLE mode can\'t be used with multiple selectedDates"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 363
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object v0, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    if-ne v0, v1, :cond_3

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x2

    if-gt v0, v1, :cond_2

    goto :goto_1

    .line 364
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RANGE mode only allows two selectedDates.  You tried to pass "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 365
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_1
    if-eqz p1, :cond_4

    .line 368
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    .line 369
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-virtual {v1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectDate(Ljava/util/Date;)Z

    goto :goto_2

    .line 372
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$mscrollToSelectedDates(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    .line 374
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$mvalidateAndUpdate(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-object p0
.end method
