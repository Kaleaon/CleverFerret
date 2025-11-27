.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/MonthView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CellClickedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;


# direct methods
.method private constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 566
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-void
.end method


# virtual methods
.method public handleClick(Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)V
    .locals 2

    .line 568
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 570
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetcellClickInterceptor(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetcellClickInterceptor(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;->onCellClicked(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 578
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1, v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$mdoSelectDate(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Ljava/util/Date;Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)Z

    move-result p1

    .line 580
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdateListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    move-result-object v1

    if-eqz v1, :cond_2

    if-eqz p1, :cond_1

    .line 582
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdateListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    move-result-object p1

    invoke-interface {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;->onDateSelected(Ljava/util/Date;)V

    return-void

    .line 584
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdateListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    move-result-object p1

    invoke-interface {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;->onDateUnselected(Ljava/util/Date;)V

    :cond_2
    :goto_0
    return-void
.end method
