.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;
.super Ljava/lang/Object;
.source "CalendarPickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

.field final synthetic val$selectedIndex:I

.field final synthetic val$smoothScroll:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;IZ)V
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

    .line 419
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iput p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$selectedIndex:I

    iput-boolean p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$smoothScroll:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 421
    iget v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$selectedIndex:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "Scrolling to position %d"

    invoke-static {v0, v1}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 423
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$smoothScroll:Z

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$selectedIndex:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->smoothScrollToPosition(I)V

    return-void

    .line 426
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;->val$selectedIndex:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->myScrollTo(I)Z

    return-void
.end method
