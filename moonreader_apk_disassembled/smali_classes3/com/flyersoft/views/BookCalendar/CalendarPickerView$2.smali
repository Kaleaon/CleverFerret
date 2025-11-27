.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$2;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->fixDialogDimens()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 488
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$2;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 490
    const-string v0, "Dimens are fixed: now scroll to the selected date"

    invoke-static {v0}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;)V

    .line 491
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$2;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$mscrollToSelectedDates(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-void
.end method
